package ui.components;

import instructions.Instr;
import instructions.RuntimeError;

import java.net.URL;

import javax.swing.plaf.metal.MetalIconFactory.FolderIcon16;

import machine.MachineState;
import machine.MachineUpdate;
import machine.MachineUpdateData;

import org.apache.log4j.Logger;
import org.apache.log4j.chainsaw.Main;
import org.apache.pivot.beans.BXML;
import org.apache.pivot.beans.Bindable;
import org.apache.pivot.collections.List;
import org.apache.pivot.collections.Map;
import org.apache.pivot.util.Resources;
import org.apache.pivot.util.concurrent.Task;
import org.apache.pivot.util.concurrent.TaskExecutionException;
import org.apache.pivot.wtk.Action;
import org.apache.pivot.wtk.Button;
import org.apache.pivot.wtk.ButtonPressListener;
import org.apache.pivot.wtk.Component;
import org.apache.pivot.wtk.FileBrowserSheet;
import org.apache.pivot.wtk.MessageType;
import org.apache.pivot.wtk.Prompt;
import org.apache.pivot.wtk.PushButton;
import org.apache.pivot.wtk.Window;

public class BaseWindow extends Window implements Bindable,MachineUpdate {
	
	private static final Logger logger = Logger.getLogger(BaseWindow.class);
	
	@BXML private FileBrowserSheet fileBrowserSheet;
	@BXML private List<Register> registerTableData;
	@BXML private List<Address> stackTableData;
	@BXML private List<Address> heapTableData;
	@BXML private List<PCInstruction> programSpaceData;
	private boolean running = false;
	private int stackPointer;
	private int pcValue;
	private MachineState machine;
	private SimulateMachineState simulateMachine = null;
	final private URL stackImage = Main.class.getClassLoader().getResource("ui/images/sp.png");
	final private URL cpImage = Main.class.getClassLoader().getResource("ui/images/pc.png");
	
	@Override
	public void initialize(Map<String, Object> arg0, URL arg1, Resources arg2) {
		// get the machine state and then register this class with it.
		// register the machine here to make sure that this class is finished being constructed.
		machine = MachineState.createMachine("AVRMachine");
		logger.info("Initializing window...");
		PushButton runButton = (PushButton) arg0.get("runButton");
		PushButton stepButton = (PushButton) arg0.get("stepButton");
		PushButton stopButton = (PushButton) arg0.get("stopButton");
		
		runButton.getButtonPressListeners().add(new ButtonPressListener() {
			
			@Override
			public void buttonPressed(Button arg0) {
				updateWindowState();
				
			}
		});
		
		stepButton.getButtonPressListeners().add(new ButtonPressListener() {
			
			@Override
			public void buttonPressed(Button arg0) {
				execStepButton();
			}
		});
		
		stopButton.getButtonPressListeners().add(new ButtonPressListener() {
			
			@Override
			public void buttonPressed(Button arg0) {
				
				
			}
		});
		
		//read in the program into the programspace.
		java.util.ArrayList<Instr> instructions = machine.getProgramSpace();
		
		for(int i = 0; i < instructions.size();i++)
		{
			Instr instruction = instructions.get(i);
			programSpaceData.add(new PCInstruction(instruction.toString(), i));
		}
		
		//set the pc pointer.
		if( programSpaceData.getLength() >0)
		{		
			programSpaceData.get(machine.getPC()).setProgramCounter(cpImage);
		}
		
		for(int i = 0; i < 32;i++)
		{
			registerTableData.add(new Register(Integer.toString(i),"0"));
		}
		
		machine.addUpdate(this);
	}
	
	protected void execStepButton() {
		updateWindowState();
		try
		{
			simulateMachine.executeOne();
		}
		catch(RuntimeError e)
		{
			Prompt.prompt(MessageType.ERROR, e.getMessage(), this);
		}
		
		//update gui state.
		updateGui();
	}

	public BaseWindow()
	{

		Action.getNamedActions().put("fileOpen", new Action()
		{
			public void perform(Component source)
			{
				logger.info("Opening a file broswer.");
				fileBrowserSheet.open(BaseWindow.this);
			}
		});
		
		Action.getNamedActions().put("exit", new Action(){
			public void perform(Component source)
			{
				logger.info("Performing Shutdown sequence...");
				System.exit(0);
			}
		});
		
	}

	private void updateGui()
	{
		//need to update the pc pointer and the stack pointer.
		//first unset the old values.
		programSpaceData.get(pcValue).clearImage();
		programSpaceData.get(machine.getPC()).setProgramCounter(cpImage);
		
		String address = "0x" + Integer.toHexString(machine.getStackPointer());
		String oldValue = "0x" +Integer.toHexString(stackPointer);
		boolean foundNew = false,foundOld=false;
		for(Address addr : stackTableData)
		{
			if(addr.getAddress().equals(oldValue))
			{
				addr.clearImage();
				foundOld= true;
			}
			if(addr.getAddress().equals(address))
			{
				addr.setStackPointer(stackImage);
				foundNew=true;
			}
			if(foundNew && foundOld)
			{
				break;
			}
			
		}
		
		this.repaint();
	}
	
	private void updateWindowState()
	{
		stackPointer = machine.getStackPointer();
		pcValue = machine.getPC();
		if(simulateMachine == null)
		{
			simulateMachine = new SimulateMachineState();
		}
	}
	
	@Override
	public void update(MachineUpdateData data) {
		java.util.Map<Integer,Integer> regUpdates = data.getRegUpdates();
		
		for(Integer reg:regUpdates.keySet())
		{
			logger.debug("Updating register: " + reg);
			((Register)registerTableData.get(reg)).setValue(Integer.toString(regUpdates.get(reg)));
		}
		
		final java.util.Map<Integer,Integer> stackUpdates = data.getStackUpdates();
		final java.util.Map<Integer,Integer> heapUpdates = data.getHeapUpdates();		
		for(Integer stackMem: stackUpdates.keySet())
		{
			Address add = getStackAddress(stackMem);
			if(add == null)
			{
				//will it always be first?
				stackTableData.insert(new Address(stackMem.toString(),stackUpdates.get(stackMem)) , 0);
			}
			else
			{
				add.setValue(stackUpdates.get(stackMem));
			}
		}
		if(data.getStackPointer() != null && data.getStackPointer() > 0)
		{
			stackPointer = data.getStackPointer();
			if(getStackAddress(stackPointer)!= null)
			{
				getStackAddress(stackPointer).setStackPointer(stackImage);
			}
			else
			{
				Address newAddr = new Address();
				newAddr.setAddress(Integer.toString(stackPointer));
				newAddr.setStackPointer(stackImage);
				stackTableData.insert(newAddr,0);
			}
		}
		
		for(Integer heapMem: heapUpdates.keySet())
		{
			Address add = getStackAddress(heapMem);
			if(add == null)
			{
				//will it always be last?
				heapTableData.add(new Address(heapMem.toString(),stackUpdates.get(heapMem)));
			}
			else
			{
				add.setValue(stackUpdates.get(heapMem));
			}
		}

	}
	
	private Address getStackAddress(int address)
	{
		Address ret = null;
		for(Address add:stackTableData)
		{
			if(add.getAddress().trim().equals(Integer.toString(address)))
			{
				ret = add;
				break;
			}
		}
		return ret;
	}
	
	/**
	 * This class is for executing the long run program.
	 * @author Ryan Moore
	 *
	 */
	private class SimulateMachineState extends Task<String>
	{
		private boolean run = false;
		private final MachineState machine;

		@Override
		/**
		 * Use this method to make a long run.
		 */
		public String execute() throws TaskExecutionException {
			return null;
		}
		
		/**
		 * Use this method to make one step.
		 */
		public void executeOne() throws RuntimeError
		{
			machine.executeInstruction();
		}
		
		public SimulateMachineState()
		{
			this.machine = MachineState.createMachine("AVRSim");
		}
		
		public synchronized boolean isRunning()
		{
			return run;
		}
		
		public synchronized void setRunning(boolean run)
		{
			this.run = run;
		}
	}
}

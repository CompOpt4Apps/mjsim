package ui.components;

import instructions.Instr;
import instructions.RuntimeError;

import java.io.File;
import java.net.URL;
import java.util.Comparator;

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
import org.apache.pivot.util.concurrent.TaskListener;
import org.apache.pivot.wtk.Action;
import org.apache.pivot.wtk.Button;
import org.apache.pivot.wtk.ButtonPressListener;
import org.apache.pivot.wtk.Component;
import org.apache.pivot.wtk.FileBrowserSheet;
import org.apache.pivot.wtk.FileBrowserSheet.Mode;
import org.apache.pivot.wtk.MessageType;
import org.apache.pivot.wtk.Prompt;
import org.apache.pivot.wtk.PushButton;
import org.apache.pivot.wtk.Sheet;
import org.apache.pivot.wtk.SheetCloseListener;
import org.apache.pivot.wtk.TaskAdapter;
import org.apache.pivot.wtk.Window;

import parse.ReadAssem;

public class BaseWindow extends Window implements Bindable,MachineUpdate {

	private static final Logger logger = Logger.getLogger(BaseWindow.class);

	@BXML private FileBrowserSheet fileBrowserSheet;
	@BXML private List<Register> registerTableData;
	@BXML private List<Address> stackTableData;
	@BXML private List<Address> heapTableData;
	@BXML private List<PCInstruction> programSpaceData;
	private int stackPointer;
	private int pcValue;
	private MachineState machine;
	private PushButton runButton;
	private PushButton stepButton;
	private PushButton stopButton;
	private SimulateMachineState simulateMachine = null;
	final private URL stackImage = Main.class.getClassLoader().getResource("ui/images/sp.png");
	final private URL cpImage = Main.class.getClassLoader().getResource("ui/images/pc.png");
	final private Comparator<Address> addressSort = new Comparator<Address>(){

		@Override
		public int compare(Address o1, Address o2) {
			return o1.getAddress().compareTo(o2.getAddress());
		}
		
	}; 

	@Override
	public void initialize(Map<String, Object> arg0, URL arg1, Resources arg2) {
		// get the machine state and then register this class with it.
		// register the machine here to make sure that this class is finished being constructed.
		machine = MachineState.createMachine("AVRMachine");
		logger.info("Initializing window...");
		runButton = (PushButton) arg0.get("runButton");
		stepButton = (PushButton) arg0.get("stepButton");
		stopButton = (PushButton) arg0.get("stopButton");

		runButton.getButtonPressListeners().add(new ButtonPressListener() {

			@Override
			public void buttonPressed(Button arg0) {
				//set the enabled.
				if(machine == null)
				{
					return;
				}
				runButton.setEnabled(false);
				stepButton.setEnabled(false);
				stopButton.setEnabled(true);
				updateWindowState();
				simulateMachine.setRunning(true);

				TaskListener<String> taskListener = new TaskListener<String>() {

					@Override
					public void taskExecuted(Task<String> arg0) {
						resetButtons();
						//update gui state.
						updateGui();

					}

					@Override
					public void executeFailed(Task<String> arg0) {
						resetButtons();
						//update gui state.
						updateGui();
						errorPrompt(arg0.getFault());
					}
				};

				simulateMachine.execute(new TaskAdapter<String>(taskListener));
			}
		});

		stepButton.getButtonPressListeners().add(new ButtonPressListener() {

			@Override
			public void buttonPressed(Button arg0) {
				if(machine == null)
				{
					return;
				}
				execStepButton();
			}
		});

		stopButton.getButtonPressListeners().add(new ButtonPressListener() {

			@Override
			public void buttonPressed(Button arg0) {
				simulateMachine.setRunning(false);


			}
		});

		//read in the program into the program space.
		readInProgram();

		machine.addUpdate(this);
	}

	private void readInProgram() {
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
	}

	private void resetButtons() {
		runButton.setEnabled(true);
		stepButton.setEnabled(true);
		stopButton.setEnabled(false);

	}

	private void execStepButton() {
		updateWindowState();
		try
		{
			simulateMachine.executeOne();
		}
		catch(RuntimeError e)
		{
			errorPrompt(e);
		}

		//update gui state.
		updateGui();
	}

	private void errorPrompt(Exception e)
	{
		Prompt.prompt(MessageType.ERROR,e.getMessage(), this);
	}

	public BaseWindow()
	{

		Action.getNamedActions().put("fileOpen", new Action()
		{
			public void perform(Component source)
			{
				logger.info("Opening a file broswer.");
				fileBrowserSheet.setMode(Mode.OPEN);
				fileBrowserSheet.open(BaseWindow.this,new SheetCloseListener() {

					@Override
					public void sheetClosed(Sheet arg0) {
						if(arg0.getResult())
						{
							File selectedFile = fileBrowserSheet.getSelectedFile();
							processOpenFile(selectedFile);
						}
					}


				});
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

	private void processOpenFile(File selectedFile) {
		boolean error = false;
		logger.info("Loading file: " + selectedFile.toString());
		//check to see if the file is a file
		if(!selectedFile.isFile())
		{
			Prompt.prompt(MessageType.ERROR, selectedFile.toString() + " is not a file.", this);
			return;
		}

		if(!selectedFile.getName().endsWith(".s"))
		{
			Prompt.prompt(MessageType.ERROR, selectedFile.toString() + " is not an assembly (.s) file.", this);
			return;
		}
		MachineState.uninitMachine();
		machine = MachineState.createMachine("AVR Sim",false);
		simulateMachine = null;

		ReadAssem reader = new ReadAssem(selectedFile, machine);
		try {
			machine.readAtmegaProgram(reader.getProgram());
		} catch (Exception e) {
			Prompt.prompt(MessageType.ERROR,"Error while Parsing: " + e.getMessage(),this);
			MachineState.uninitMachine();
			machine = null;
			error = true;
		}
		this.heapTableData.clear();
		this.stackTableData.clear();
		this.registerTableData.clear();
		this.programSpaceData.clear();
		if(error)
		{
			return;
		}
		readInProgram();
		machine.addUpdate(this);
		repaint();
	}

	private void updateGui()
	{
		//need to update the pc pointer and the stack pointer.
		//first unset the old values.
		programSpaceData.get(pcValue).clearImage();
		programSpaceData.get(machine.getPC()).setProgramCounter(cpImage);

		String address = "0x" + Integer.toHexString(machine.getStackPointer());
		String oldValue = "0x" +Integer.toHexString(stackPointer);
		logger.debug("Updating gui -");
		logger.debug("Old stack pointer = " + oldValue);
		logger.debug("New stack pointer = " + address);
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
			logger.debug("Updating register r" + reg + " to value: " + regUpdates.get(reg));
			
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
				stackTableData.add(new Address(stackMem.toString(),stackUpdates.get(stackMem)));
			}
			else
			{
				add.setValue(stackUpdates.get(stackMem));
			}
			stackTableData.setComparator(addressSort);
		}
		if(data.getStackPointer() != null && data.getStackPointer() > 0)
		{
			int stackPointer = data.getStackPointer();
			logger.debug("Updating stack pointer in gui to value of:  " + stackPointer);
			if(getStackAddress(stackPointer)== null)
			{
				Address newAddr = new Address();
				newAddr.setAddress(Integer.toString(stackPointer));
				newAddr.setStackPointer(stackImage);
				stackTableData.add(newAddr);
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
			logger.trace("Trying to find address " + address + " and comparing against address " + add.getAddress());
			if(add.getAddress().equals("0x" + Integer.toHexString(address)))
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
		private boolean run = true;
		private final MachineState machine;

		@Override
		/**
		 * Use this method to make a long run.
		 */
		public String execute() throws TaskExecutionException {
			try
			{
				while(isRunning())
				{
					executeOne();
				}
			}catch(RuntimeError e)	
			{
				throw new TaskExecutionException(e);
			}
			return "Done Executing...";
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

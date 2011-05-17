package ui.components;

import instructions.Instr;
import instructions.RuntimeError;

import java.io.File;
import java.net.URL;
import java.util.Comparator;

import machine.MachineState;
import machine.MachineUpdate;
import machine.MachineUpdateData;
import machine.SREG;

import org.apache.log4j.Logger;
import org.apache.log4j.chainsaw.Main;
import org.apache.pivot.beans.BXML;
import org.apache.pivot.beans.Bindable;
import org.apache.pivot.collections.HashMap;
import org.apache.pivot.collections.List;
import org.apache.pivot.collections.Map;
import org.apache.pivot.util.Resources;
import org.apache.pivot.util.concurrent.Task;
import org.apache.pivot.util.concurrent.TaskExecutionException;
import org.apache.pivot.util.concurrent.TaskListener;
import org.apache.pivot.wtk.Action;
import org.apache.pivot.wtk.ApplicationContext;
import org.apache.pivot.wtk.Button;
import org.apache.pivot.wtk.ButtonPressListener;
import org.apache.pivot.wtk.Component;
import org.apache.pivot.wtk.ComponentMouseButtonListener;
import org.apache.pivot.wtk.FileBrowserSheet;
import org.apache.pivot.wtk.FileBrowserSheet.Mode;
import org.apache.pivot.wtk.MessageType;
import org.apache.pivot.wtk.Prompt;
import org.apache.pivot.wtk.PushButton;
import org.apache.pivot.wtk.Sheet;
import org.apache.pivot.wtk.SheetCloseListener;
import org.apache.pivot.wtk.TableView;
import org.apache.pivot.wtk.TaskAdapter;
import org.apache.pivot.wtk.Window;
import org.apache.pivot.beans.BXMLSerializer;
import org.apache.pivot.wtk.Application;
import org.apache.pivot.wtk.Display;
import org.apache.pivot.wtk.Palette;
import org.apache.pivot.wtk.Panel;
import org.apache.pivot.wtk.ImageView;

import parse.ReadAssem;

public class BaseWindow extends Window implements Bindable,MachineUpdate {

	private static final Logger logger = Logger.getLogger(BaseWindow.class);

	@BXML private FileBrowserSheet fileBrowserSheet;
	@BXML private List<Register> registerTableData;
	@BXML private List<Address> stackTableData;
	@BXML private List<Address> heapTableData;
	@BXML private List<PCInstruction> programSpaceData;
	@BXML private List<SREGData> sregTableData;
	private int stackPointer;
	private int pcValue;
	private MachineState machine;
	private PushButton runButton;
	private PushButton stepButton;
	private PushButton stopButton;
	private TableView pcTableView;
    private Panel emulatorPanel;
	private SimulateMachineState simulateMachine = null;
	private HashMap<Integer,Boolean> breakPoints;
	final private URL stackImage = Main.class.getClassLoader().getResource("ui/images/sp.png");
	final private URL cpImage = Main.class.getClassLoader().getResource("ui/images/pc.png");
	final private URL breakPointImage = Main.class.getClassLoader().getResource("ui/images/breakPoint.png");
    final private URL redLEDURL = Main.class.getClassLoader().getResource("ui/images/redLED.png");
    final private URL orangeLEDURL = Main.class.getClassLoader().getResource("ui/images/orangeLED.png");
    final private URL yellowLEDURL = Main.class.getClassLoader().getResource("ui/images/yellowLED.png");
    final private URL greenLEDURL = Main.class.getClassLoader().getResource("ui/images/greenLED.png");
    final private URL blueLEDURL = Main.class.getClassLoader().getResource("ui/images/blueLED.png");
    final private URL violetLEDURL = Main.class.getClassLoader().getResource("ui/images/violetLED.png");
    final private URL whiteLEDURL = Main.class.getClassLoader().getResource("ui/images/whiteLED.png");
    final private URL aButtonLitURL = Main.class.getClassLoader().getResource("ui/images/AButtonLit.png");
    final private URL bButtonLitURL = Main.class.getClassLoader().getResource("ui/images/BButtonLit.png");
    final private URL upButtonLitURL = Main.class.getClassLoader().getResource("ui/images/UpButtonLit.png");
    final private URL downButtonLitURL = Main.class.getClassLoader().getResource("ui/images/DownButtonLit.png");
    final private URL rightButtonLitURL = Main.class.getClassLoader().getResource("ui/images/RightButtonLit.png");
    final private URL leftButtonLitURL = Main.class.getClassLoader().getResource("ui/images/LeftButtonLit.png");
    final private URL emulatorURL = Main.class.getClassLoader().getResource("ui/images/meggySimBack.png");
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
		pcTableView = (TableView) arg0.get("programSpace");
        emulatorPanel = (Panel) arg0.get("emulatorPanel");

		sregTableData.add(new SREGData());
		pcTableView.getComponentMouseButtonListeners().add(new ComponentMouseButtonListener() {
			  
			@Override
			public boolean mouseUp(Component component,
					org.apache.pivot.wtk.Mouse.Button button, int x, int y) {
				logger.trace("MouseUp event occured on PCTable --ignoring.");
				return false;
			}
			
			@Override
			public boolean mouseDown(Component component,
					org.apache.pivot.wtk.Mouse.Button button, int x, int y) {
				logger.trace("MouseDown event occured on PCTable --ignoring.");
				return false;
			}
			
			@Override
			public boolean mouseClick(Component component,
					org.apache.pivot.wtk.Mouse.Button button, int x, int y, int count) {
				TableView tempTable = (TableView) component;
				logger.info("MouseClick event on the PCTable.");
				if(count == 2 && breakPoints != null)
				{
					int doubleClickAt = tempTable.getSelectedIndex();
					logger.info("Double Click Event");
					Boolean breakPointEnabled = breakPoints.get(doubleClickAt);
					if(breakPointEnabled == null || breakPointEnabled == false)
					{
						breakPoints.put(doubleClickAt, true);
						programSpaceData.get(doubleClickAt).setBreakPoint(breakPointImage);
					}
					else
					{
						breakPoints.put(doubleClickAt, false);
						programSpaceData.get(doubleClickAt).clearBreakPointImage();
					}
				}
				
				return false;
			}
		});
		
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
                        updateEmulator();
						checkFinished();
					}

					@Override
					public void executeFailed(Task<String> arg0) {
						resetButtons();
						//update gui state.
						try
						{
							updateGui();
						}
						catch(Exception e)
						{
							logger.fatal(e);
						}
						errorPrompt("Reporting Error from within internal execution: "+ arg0.getFault());
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
				checkFinished();
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

	public boolean checkFinished()
	{
		if(machine.isFinished())
		{
			Prompt.prompt(MessageType.INFO, "Reached the end of execution.  Please reload file to run again.",this);
            return true;
		}
        return false;
	}
	
	private void readInProgram() {
		java.util.ArrayList<Instr> instructions = machine.getProgramSpace();
		breakPoints = new HashMap<Integer, Boolean>();

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
		if(machine.hasProgram())
		{
			resetButtons();
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
			errorPrompt(e.getMessage());
			logger.fatal(e);
		}

		//update gui state.
		updateGui();
	}

	private void errorPrompt(String e)
	{
		Prompt.prompt(MessageType.ERROR,e, this);
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
		runButton.setEnabled(true);
		stepButton.setEnabled(true);
		repaint();
	}

	//Update this in the Application UI context.
	private void updateGui()
	{
		ApplicationContext.queueCallback(new Runnable() {

			@Override
			public void run() {
				updateGui__internal();
			}
		}
		);

	}

	private void updateGui__internal()
	{
		//need to update the pc pointer and the stack pointer.
		//first unset the old values.
		programSpaceData.get(pcValue).clearPCImage();
		pcTableView.clearSelection();
		if(machine.getPC()==0xFFFF)
		{
			runButton.setEnabled(false);
			stepButton.setEnabled(false);
			stopButton.setEnabled(false);
			//clear out the stack pointer
			for(Address addr: stackTableData)
			{
				addr.clearImage();		
			}
			breakPoints = null;
			return;
		}
		programSpaceData.get(machine.getPC()).setProgramCounter(cpImage);
		pcTableView.setSelectedIndex(machine.getPC());

		String address = "0x" + Integer.toHexString(machine.getStackPointer());
		String oldValue = "0x" +Integer.toHexString(stackPointer);
		logger.debug("Updating gui -");
		logger.debug("Old stack pointer = " + oldValue);
		logger.debug("New stack pointer = " + address);

		for(Address addr : stackTableData)
		{
			if(addr.getAddress().equals(address))
			{
				addr.setStackPointer(stackImage);
			}
			else
			{
				addr.clearImage();
			}
		}

        updateEmulator();
		this.repaint();
	}

    private void updateEmulator()
    {
        // to get rid of all previous components
        emulatorPanel.removeAll();
        ImageView emulatorView = new ImageView();
        emulatorView.setImage(emulatorURL);
        emulatorView.setWidth(300);
        emulatorView.setHeight(160);
        emulatorPanel.add(emulatorView);
        // update things in the emulator
        updateEmulatorLEDs();
        updateEmulatorButtons();
    }

    private void updateEmulatorLEDs()
    {
        for (int row = 0; row < 8; row++)
        {
            for (int col = 0; col < 8; col++)
            {
                lightLED(col, row, machine.getGridColor(col, row)); 
            }
        }
    }

    private void lightLED(int x, int y, String color)
    {
        ImageView newLED = new ImageView();
        
        if (color.equals("RED"))
        {
            newLED.setImage(redLEDURL);
        }
        else if (color.equals("ORANGE"))
        {
            newLED.setImage(orangeLEDURL);
        }
        else if (color.equals("YELLOW"))
        {
            newLED.setImage(yellowLEDURL);
        }
        else if (color.equals("GREEN"))
        {
            newLED.setImage(greenLEDURL);
        }
        else if (color.equals("BLUE"))
        {
            newLED.setImage(blueLEDURL);
        }
        else if (color.equals("VIOLET"))
        {
            newLED.setImage(violetLEDURL);
        }
        else if (color.equals("WHITE"))
        {
            newLED.setImage(whiteLEDURL);
        }
        int x_offset = 108;
        int y_offset = 121;
        // when I scaled the image down for the png,
        // the LED ratio got a little off
        // and now I have to add one extra pixel for LED's with
        // rows or columns greater than 3
        if (x > 3)
        {
            x_offset = 109;
        }
        if (y > 3)
        {
            y_offset = 120;
        }
        newLED.setX(x_offset + x*11);
        newLED.setY(y_offset - y*11);
        newLED.setWidth(11);
        newLED.setHeight(11);
        emulatorPanel.add(newLED);
    }

    private void updateEmulatorButtons()
    {
        if (machine.checkButton("A") > 0)
        {
            addButton(aButtonLitURL);
        }
        else if (machine.checkButton("B") > 0)
        {
            addButton(bButtonLitURL); 
        }
        else if (machine.checkButton("Up") > 0)
        {
            addButton(upButtonLitURL);
        }
        else if (machine.checkButton("Down") > 0)
        {
            addButton(downButtonLitURL);
        }
        else if (machine.checkButton("Left") > 0)
        {
            addButton(leftButtonLitURL);
        }
        else if (machine.checkButton("Right") > 0)
        {
            addButton(rightButtonLitURL);
        }
    }

    private void addButton(URL button)
    {
        ImageView newButton = new ImageView();
        newButton.setImage(button); 
        newButton.setWidth(300);
        newButton.setHeight(160);
        emulatorPanel.add(newButton);
    }
	
	private void updateWindowState()
	{
		stackPointer = machine.getStackPointer();
		pcValue = machine.getPC();
		if(simulateMachine == null)
		{
			simulateMachine = new SimulateMachineState(breakPoints);
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
				logger.trace("Adding data to the heap.");
				heapTableData.add(new Address(heapMem.toString(),heapUpdates.get(heapMem)));
			}
			else
			{
				add.setValue(heapUpdates.get(heapMem));
			}
		}

		if(data.getSREG() != null)
		{
			SREG tempSreg = data.getSREG();
				SREGData onlySreg = sregTableData.get(0);
				if(tempSreg.isC())
				{
					onlySreg.setC(1);
				}
				else
				{
					onlySreg.setC(0);
				}
				if(tempSreg.isT())
				{
					onlySreg.setT(1);
				}
				else
				{
					onlySreg.setT(0);
				}
				if(tempSreg.isI())
				{
					onlySreg.setI(1);
				}
				else
				{
					onlySreg.setI(0);
				}
				if(tempSreg.isH())
				{
					onlySreg.setH(1);
				}
				else
				{
					onlySreg.setH(0);
				}
				if(tempSreg.isS())
				{
					onlySreg.setS(1);
				}
				else
				{
					onlySreg.setS(0);
				}
				if(tempSreg.isV())
				{
					onlySreg.setV(1);
				}
				else
				{
					onlySreg.setV(0);
				}
				if(tempSreg.isN())
				{
					onlySreg.setN(1);
				}
				else
				{
					onlySreg.setN(0);
				}
				if(tempSreg.isZ())
				{
					onlySreg.setZ(1);
				}
				else
				{
					onlySreg.setZ(0);
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
		private boolean hitCurrentBreakPoint = false;
		private final MachineState machine;
		private final HashMap<Integer,Boolean> breakPoints;

		@Override
		/**
		 * Use this method to make a long run.
		 */
		public String execute() throws TaskExecutionException {
			try
			{
				while(isRunning() && !machine.isFinished() && !hitBreakPoint(machine.getPC()))
				{
					hitCurrentBreakPoint = false;
					executeOne();
				}
			}catch(RuntimeError e)	
			{
				throw new TaskExecutionException(e);
			}
			catch(Exception e)
			{
				logger.fatal("Fatal Error",e);
			}
			return "Done Executing...";
		}

		private boolean hitBreakPoint(int pcValue)
		{
			if(breakPoints == null)
			{
				return false;
			}
			Boolean breakPoint = breakPoints.get(pcValue);

			if(breakPoint == null)
			{
				return false;
			}
			else
			{
				if(hitCurrentBreakPoint == true)
				{
					hitCurrentBreakPoint = false;
					return false;
				}
				hitCurrentBreakPoint= breakPoint;
				return breakPoint;
			}
		}
		
		/**
		 * Use this method to make one step.
		 */
		public void executeOne() throws RuntimeError
		{
			machine.executeInstruction();
		}

		public SimulateMachineState(HashMap<Integer, Boolean> breakPoints)
		{
			this.machine = MachineState.createMachine("AVRSim");
			this.breakPoints = breakPoints;
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

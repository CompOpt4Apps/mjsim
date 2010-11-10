package machine;

import instructions.ATmegaProgram;
import instructions.Function;
import instructions.Instr;
import instructions.InstrLabel;
import instructions.RuntimeError;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import machine.functions.Func;
import machine.functions.FuncSetPix;

import org.apache.log4j.Logger;

public class MachineState {
	final private static Logger logger = Logger.getLogger(MachineState.class);

	final private Map<Integer, Integer> stack;
	final private Map<Integer, Integer> heap;
	final private Map<Integer, Integer> registers;
	final private ArrayList<Instr> programSpace;
	final private Map<String, Integer> functionMapping;
	final private Map<String, Integer> labelMapping;
	final private Map<String, Func> predefinedFunctions = new HashMap<String, Func>();
	final private String name;
	private int pc = 0;//set to the beginning of the programSpace.
	private boolean finished = false;
	private int stackPointer = 0x3e3d; //this value is taken from the SPL and SPH from the main.s file.
	private int returnAddress = -1;
	final private SREG statusReg; 
	
	public MachineState(String name)
	{
		//Using a TreeMap instead of a HashMap because after a large number of addresses have been accessed
		//the speed of the HashMap will greatly decrease.  The number of registers however is small enough
		//that a HashMap will give a better speed.
		stack = new TreeMap<Integer, Integer>();
		heap = new TreeMap<Integer, Integer>();
		registers = new HashMap<Integer, Integer>();
		programSpace = new ArrayList<Instr>();
		functionMapping = new HashMap<String, Integer>();//This records the function name and maps it to a integer where the function starts in the programSpace.
		labelMapping = new HashMap<String, Integer>();//This records the mapping from a label (not a function) to a pc value.
		statusReg = new SREG();
		this.name = name;
		//set up the return address for main
		stack.put(stackPointer, 0xFF);
		stack.put(stackPointer-1,0xFF);
		stackPointer-=2;
		
		
		//add all of the predefined functions
		predefinedFunctions.put("_Z6DrawPxhhh", new FuncSetPix(this));
	}
	
	
	public void updateState(UpdateEvent event)
	{
		logger.info("Received UpdateEvent...processing...");
	
		if(event.getRd() != null)
		{
			Pair<Integer,Integer> pair = event.getRd(); 
			logger.info("Updating register r(" + pair.getLeft() +") with the value ("+pair.getRight()+")");
			registers.put(pair.getLeft(), pair.getRight());
		}
		
		if(event.getMemory() != null)
		{
			Pair<Integer, Integer> pair = event.getMemory();
			logger.info("Updating memory location ("+pair.getLeft()+") with the value ("+pair.getRight()+")");
			stack.put(pair.getLeft(), pair.getRight());
		}
		
		if(event.getStackPointer() >= 0)
		{
			logger.info("Updating stack pointer to (0x"+ Integer.toHexString(event.getStackPointer())+")");
			this.stackPointer = event.getStackPointer();
		}
	
		if(event.getSREG() != null)
		{
			updateSREG(event.getSREG());
		}
		
		if(event.getLongMemory() != null)
		{
			logger.info("Adding long memory to the stack at (0x"+ Integer.toHexString(event.getLongMemory().getLeft()) +")");
			//store the high value in the lower memory, store the low value in high memory.
			Pair<Integer,Integer> tempPair = event.getLongMemory();
			this.stack.put(tempPair.getLeft(), (tempPair.getRight() & 0xFF00) >> 8);//get the high 8 bits, and shift them to the right.
			this.stack.put(tempPair.getLeft()+1, (tempPair.getRight() & 0xFF)); //get the low 8 bits.
		}
		
		pc = event.getPc();//this should be set in every instruction.
	}
	
	public String toString()
	{
		return "MachineState: " +name;
	}
	
	/**
	 * Returns the value of the register (reg).
	 * @param reg The register to get the value of.
	 * @return Returns the value of the register.
	 */
	public int getRegister(int reg)
	{
		Integer tempReg = registers.get(reg);
		if(tempReg == null)//check to make sure it is not null.  if it is return 0.
		{
			return 0;
		}
		return tempReg;
	}
	
	/**
	 * Return a copy of the SREG, changing the SREG that is returned here will not change the SREG that is inside of the machine state.  You must use the UpdateEvent to edit the machine state SREG
	 * @return
	 */
	public SREG getSREG()
	{
		return (SREG)statusReg.clone();
	}
	public int getStack(int address)
	{
		Integer tempReg = stack.get(address);
		if(tempReg == null)
		{
			return 0;
		}
		return tempReg;
	}
	
	/**
	 * Return the current top of the stack.
	 * @return The integer representation of the memory address of the top of the stack.
	 */
	public int getStackPointer()
	{
		return stackPointer;
	}

	/**
	 * Returns a value from within the heap space.
	 * @param address
	 * @return Returns the value at the address within the heap space, returns null if that address does not exist.
	 */
	public Integer getHeap(int address)
	{
		Integer tempReg = heap.get(address);
		return tempReg;
	}
	
	public void setReturnAddress(int address)
	{
		this.returnAddress = address;
	}


	/**
	 * Returns the current value of the PC.
	 * @return
	 */
	public int getPC()
	{
		return pc;
	}
	
	public int getReturnAddress()
	{
		return returnAddress;
	}
	
	/**
	 * Executes the current instruction at PC.
	 * @throws RuntimeError 
	 */
	public void executeInstruction() throws RuntimeError
	{
		logger.trace("Execute Instruction: Pc value is (" + pc+")");
		programSpace.get(pc).executeWrapper();
		//after this instruction the pc value should be updated.
		if(pc >= programSpace.size() || pc == 0xFFFF)//all Fs should be the return address for the main function.
		{
			finished = true;
		}
	}

	public Integer getFunction(String functionName)
	{
		return functionMapping.get(functionName);
	}
	
	/**
	 * Returns a value from anywhere within the memory space, include the heap and the stack space.
	 * @param address
	 * @return The value located at the provided memory address, null if the address has not been assigned to.
	 */
	public Integer getMemory(int address)
	{
		Integer memValue = null;
		if((memValue = heap.get(address))==null)
		{
			return memValue;
		}
		else if((memValue = stack.get(address))==null)
		{
			return memValue;
		}
		return memValue;
	}
	
	public Integer getLabel(String labelName)
	{
		return labelMapping.get(labelName);
	}
	/**
	 * This function will init the program space so that we have a mapping from a pc integer value in the program space to an instruction, it will also map a function call to a address in the program space. 
	 * @param program The ATmega assembly program to read into the MachineState.
	 */
	public void readAtmegaProgram(ATmegaProgram program)
	{
		logger.debug("Entered into the readATmegaProgram to read the ATmegaProgram object into the machine program state.");
		List<Function> functions = program.getFunctions();
		logger.debug("There are (" + functions.size() +") functions to read into the program space.");
		for(Function func: functions)
		{
			//Get the current size of the programSpace arraylist and use that for the mapping.
			int tempIndex = programSpace.size();
			List<Instr> instructions = func.getInstructions();
			for(Instr instr: instructions)
			{
				logger.trace("Adding new Instruction to ATmegaProgram: <" + instr.getClass().toString() +  "> " + instr.toString());
				if(instr instanceof InstrLabel)
				{
					logger.trace("Adding label: " + instr.toString());
					labelMapping.put(((InstrLabel)instr).getLabel(), programSpace.size());
				}
				programSpace.add(instr);
			}
			functionMapping.put(func.getName(), tempIndex);
			logger.info("Adding Function (" + func.getName() + ") to the program space at index ("+ tempIndex + ")");
		}
	}

	/**
	 * If there are still instructions to be ran, meaning we have not returned from main, return true.
	 * @return
	 */
	public boolean hasNextInstr() {
		return !finished;
	}
	
	private void updateSREG(SREG statusRegisterCopy)
	{
		if(statusRegisterCopy.isC() != statusReg.isC())
		{
			statusReg.setC(statusRegisterCopy.isC());
		}
		if(statusRegisterCopy.isH() != statusReg.isH())
		{
			statusReg.setH(statusRegisterCopy.isH());
		}
		if(statusRegisterCopy.isI() != statusReg.isI())
		{
			statusReg.setI(statusRegisterCopy.isI());
		}
		if(statusRegisterCopy.isN() != statusReg.isN())
		{
			statusReg.setN(statusRegisterCopy.isN());
		}
		if(statusRegisterCopy.isS() != statusReg.isS())
		{
			statusReg.setS(statusRegisterCopy.isS());
		}
		if(statusRegisterCopy.isT() != statusReg.isT())
		{
			statusReg.setT(statusRegisterCopy.isT());
		}
		if(statusRegisterCopy.isV() != statusReg.isV())
		{
			statusReg.setV(statusRegisterCopy.isV());
		}
		if(statusRegisterCopy.isZ() != statusReg.isZ())
		{
			statusReg.setZ(statusRegisterCopy.isZ());
		}
	}
	public boolean isPredefinedFunction(String functionName) {
		return predefinedFunctions.containsKey(functionName);
	}
	public Func getPreDefinedFunction(String functionName)
	{
		return predefinedFunctions.get(functionName);
	}
}
package machine;

import java.util.HashMap;

public class UpdateEvent {
	private final HashMap<Integer, Integer> rd = new HashMap<Integer, Integer>();
	private int pc = -1;
	private final HashMap<Integer,Integer> memory = new HashMap<Integer, Integer>();
	private int stackPointer = -1; //this is the default value.
	private SREG sreg = null;
    
    public UpdateEvent()
    {//Default Constructor
    }

    public void setRd(int reg, int value)
    {
    	rd.put(reg, value & 0xFF);
    }
    
    public void setMemory(int address, int value)
    {
    	memory.put(address, value & 0xFF);
    }
    
    public void setLongMemory(int address, int value)
    {
    	memory.put(address,value & 0xFF);
    	memory.put(address+1, (value & 0xFF00)>>8);
    }
    
    public void setPC(int value)
    {
    	pc = value;
    }
    
    public void setStackPointer(int stackPointer)
    {
    	this.stackPointer = stackPointer;
    }

	/**
	 * @return the updated registers
	 */
	public HashMap<Integer, Integer> getRd() {
		return rd;
	}

	/**
	 * @return the pc
	 */
	public int getPc() {
		return pc;
	}

	/**
	 * @return the memory
	 */
	public HashMap<Integer, Integer> getMemory() {
		return memory;
	}
    
	public int getStackPointer(){
		return stackPointer;
	}

	public SREG getSREG() {
		
		return sreg;
	}
	
	public void setSREG(SREG sreg)
	{
		this.sreg = sreg;
	}
}

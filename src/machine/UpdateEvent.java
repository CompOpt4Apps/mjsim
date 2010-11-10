package machine;

public class UpdateEvent {
	private Pair<Integer,Integer> rd = null;
	private int pc;
	private Pair<Integer,Integer> memory = null;
	private Pair<Integer,Integer> longMemory= null;
	private int stackPointer = -1; //this is the default value.
	private SREG sreg = null;
    
    public UpdateEvent()
    {//Default Constructor
    }

    public void setRd(int reg, int value)
    {
    	rd = new Pair<Integer, Integer>(reg, value);
    }
    
    public void setMemory(int address, int value)
    {
    	memory= new Pair<Integer, Integer>(address, value);
    }
    
    public void setLongMemory(int address, int value)
    {
    	longMemory = new Pair<Integer,Integer>(address, value);
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
	 * @return the rd
	 */
	public Pair<Integer, Integer> getRd() {
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
	public Pair<Integer, Integer> getMemory() {
		return memory;
	}
	
	public Pair<Integer, Integer> getLongMemory()
	{
		return longMemory;
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

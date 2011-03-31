package machine;

import java.util.HashMap;
import java.util.Map;

public class MachineUpdateData {

	private final Map<Integer,Integer> registerUpdates;
	private final Map<Integer, Integer> stackUpdates;
	private final Map<Integer, Integer> heapUpdates;
	private Integer stackPointer = null;
	private SREG sreg = null;
	
	public MachineUpdateData()
	{
		registerUpdates = new HashMap<Integer, Integer>();
		stackUpdates = new HashMap<Integer, Integer>();
		heapUpdates = new HashMap<Integer, Integer>();
	}
	
	public void putReg(int reg, int value)
	{
		registerUpdates.put(reg, value);
	}
	
	public void setSREG(SREG newSREG)
	{
		this.sreg = newSREG;
	}
	
	public void putStack(int address,int value)
	{
		stackUpdates.put(address, value);
	}
	
	public void putHeap(int address,int value)
	{
		heapUpdates.put(address, value);
	}
	
	public Map<Integer,Integer> getRegUpdates()
	{
		return registerUpdates;
	}
	
	public Map<Integer,Integer> getStackUpdates()
	{
		return stackUpdates;
	}
	
	public Map<Integer,Integer> getHeapUpdates()
	{
		return heapUpdates;
	}
	
	public void setStackPointer(int stackPointer)
	{
		this.stackPointer = stackPointer;
	}
	
	public Integer getStackPointer()
	{
		return stackPointer;
	}
	
	public SREG getSREG()
	{
		return sreg;
	}
}

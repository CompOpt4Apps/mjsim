package machine.functions;

import instructions.RuntimeError;
import machine.MachineState;

public class FuncMalloc extends Func {
	private int heapPointer;
	
	public FuncMalloc(MachineState machine)
	{
		super(machine, "malloc");
		heapPointer = 0x0; //Start at 0.
	}
	
	@Override
	public void exec() throws RuntimeError{
		//get the value passed on the stack.
		final int size = this.machine.getRegister(24); 
		//get the current stack pointer
		final int currentStack = this.machine.getStackPointer();
		//check to see of the amount of memory that is being requested can be allocated.
		final int allocSize = allocBlockSize(size);
		if(allocSize+heapPointer > currentStack)
		{
			//throw an exception 
			throw new RuntimeError("Heap and Stack space have collided.");
		}
		final int retVal = heapPointer;
		heapPointer+= allocSize;
	}

	/**
	 * Returns a block size that will fit the size, and is evenly divisable by 2.
	 * @param size
	 * @return
	 */
	private int allocBlockSize(int size)
	{
		if(size %2 != 0)
		{
			return size+1;
		}
		return size;
	}
}

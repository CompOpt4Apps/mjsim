package machine.functions;

import machine.MachineState;

/**
 * Base class for all the supported pre-defined functions in the machine.
 * @author Ryan Moore
 *
 */
public abstract class Func {

	protected final MachineState machine;
	private final String name;
	public Func(MachineState machine, String name)
	{
		this.machine = machine;
		this.name = name;
	}
	
	public String getName()
	{
		return name;
	}
	
	public abstract void exec();
	
	static public String valueToColor(int value)
	{
		switch(value)
		{
			case 1: return "RED";
			case 3: return "YELLOW";
			case 4: return "GREEN";
			case 5: return "BLUE";
			case 0: return "NONE";
			default: return null;
		}
	}
}

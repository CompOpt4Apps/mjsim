package machine.functions;

import instructions.RuntimeError;
import machine.MachineState;

import org.apache.log4j.Logger;

/**
 * Base class for all the supported pre-defined functions in the machine.
 * @author Ryan Moore
 *
 */
public abstract class Func {

	protected final MachineState machine;
	private final String name;
	private static final Logger logger = Logger.getLogger(Func.class);
	public Func(MachineState machine, String name)
	{
		this.machine = machine;
		this.name = name;
	}
	
	public String getName()
	{
		return name;
	}
	
	public abstract void exec() throws RuntimeError;
	
	static public String valueToColor(int value)
	{
		switch(value)
		{
			case 1: return "RED";
			case 3: return "YELLOW";
			case 4: return "GREEN";
			case 5: return "BLUE";
			case 6: return "VIOLET";
			case 0: return "NONE";
			default: logger.fatal("Unknown color value (" +value +")" );
				return null;
		}
	}
}

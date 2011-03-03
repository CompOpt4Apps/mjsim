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
			case 2: return "ORANGE";
			case 3: return "YELLOW";
			case 4: return "GREEN";
			case 5: return "BLUE";
			case 6: return "VIOLET";
			case 7: return "WHITE";
			case 0: return "DARK";
			default: logger.fatal("Unknown color value (" +value +")" );
				return null;
		}
	}
	static public int colorToValue(String str)
	{
		if (str.equals( "RED" ) ) {
		    return 1;
		} else if (str.equals("ORANGE")) {
		    return 2;
		} else if (str.equals("YELLOW")) {
		    return 3;
		} else if (str.equals("GREEN")) {
		    return 4;
		} else if (str.equals("BLUE" )) {
		    return 5;
		} else if (str.equals("VIOLET")) {
		    return 6;
		} else if (str.equals("WHITE")) {
		    return 7;
		} else if (str.equals("DARK")) {
		    return 0;
		} else {
            logger.fatal("Unknown color value (" +str +")" );
            return 0;
		}
	}
}

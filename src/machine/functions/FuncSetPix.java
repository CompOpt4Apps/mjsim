package machine.functions;

import org.apache.log4j.Logger;

import instructions.RuntimeError;
import machine.MachineState;

public class FuncSetPix extends Func {
	
	private static final Logger logger = Logger.getLogger(FuncSetPix.class);
	
	public FuncSetPix(MachineState machine) {
		super(machine, "_Z6DrawPxhhh");// this value was taken from the assembly
										// compiled from gcc.
	}

	@Override
	/**
	 * Will grab the parameters from the machine state.  the values x,y, color are in registers r24,r22, and r20 respectively.
	 */
	public void exec() throws RuntimeError{

		final int x = this.machine.getRegister(24);
		final int y = this.machine.getRegister(22);
		final String color = Func.valueToColor(this.machine.getRegister(20));

        // machine keeps a count
		this.machine.noteMeggyCall();
		if(color == null)
		{
		    logger.debug("Color is null.");
			throw new RuntimeError("Color is null.");
		}
		this.machine.setDisplaySlate(x, y, color);

        System.out.println("Setting pixel (" + x + "," + y + ") to " + color);
	}
}

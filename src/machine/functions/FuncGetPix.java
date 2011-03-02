package machine.functions;

import instructions.RuntimeError;
import machine.MachineState;

public class FuncGetPix extends Func {

	public FuncGetPix(MachineState machine) {
		super(machine, "_Z6ReadPxhh"); // this value was taken from the assembly
								       // compiled from gcc.
	}

	@Override
	/**
	 * Will grab the parameters from the machine state.  the values x and y
	   are in registers r24 and r22 respectively.
	 */
	public void exec() throws RuntimeError{

		final int x = this.machine.getRegister(24);
		final int y = this.machine.getRegister(22);
		//final String color = Func.valueToColor(this.machine.getRegister(20));

        // machine keeps a count
		this.machine.noteMeggyCall();

        System.out.println("Getting pixel ("+x+","+y+") ==>" 
                + this.machine.getGridColor(x, y));

	}
}

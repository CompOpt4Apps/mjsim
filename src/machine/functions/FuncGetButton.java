package machine.functions;

import instructions.RuntimeError;
import machine.MachineState;

import org.apache.log4j.Logger;

public class FuncGetButton extends Func {
	private static final Logger logger = Logger.getLogger(FuncGetButton.class);
	public FuncGetButton(MachineState machine) {
		super(machine, "_Z10GetButtonsv");
	}

	@Override
	public void exec() throws RuntimeError {
		final int button = this.machine.getRegister(24);
		
        System.out.println("Checking button "+ button + " and returning false");
	}

}

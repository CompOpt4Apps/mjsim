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
		//TODO: check for button presses here.
		//this will return all the buttons that are currently pressed in a bit string.
		logger.fatal("This method is not implemented yet.");
	}

}

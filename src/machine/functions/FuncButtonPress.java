package machine.functions;

import instructions.RuntimeError;
import machine.MachineState;

import org.apache.log4j.Logger;

public class FuncButtonPress extends Func {

	private static final Logger logger = Logger.getLogger(FuncButtonPress.class);
	public FuncButtonPress(MachineState machine) {
		super(machine, "_Z16CheckButtonsDownv");
	}

	@Override
	public void exec() throws RuntimeError {
		logger.info("Executing FuncButtonPress...");
	}
}

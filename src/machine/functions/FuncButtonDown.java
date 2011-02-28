package machine.functions;

import instructions.RuntimeError;
import machine.MachineState;
import machine.UpdateEvent;

import org.apache.log4j.Logger;

public class FuncButtonDown extends Func {

	private static final Logger logger = Logger.getLogger(FuncButtonDown.class);
	public FuncButtonDown(MachineState machine) {
		super(machine, "_Z16CheckButtonsDownv");
	}

	@Override
	public void exec() throws RuntimeError {
		logger.info("Executing FuncButtonDown...");
		
		// === to start with just assume that all buttons are down
		
		// create an event object for the machine
		UpdateEvent event = new UpdateEvent();
		
		// Trying just one because multiple seems to confuse things.
		//event.setMemory(machine.getLabel("Button_B"), 1);
		event.setMemory(machine.getLabel("Button_A"), 1);
		//event.setMemory(machine.getLabel("Button_Up"), 1);
		//event.setMemory(machine.getLabel("Button_Down"), 1);
		//event.setMemory(machine.getLabel("Button_Right"), 1);
		//event.setMemory(machine.getLabel("Button_Left"), 1);
		
		// have machine update using event object
    	//machine.updateState(event); // RYAN help!  Why doesn't this work?
	}
}

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
		
        // machine keeps a count
		this.machine.noteMeggyCall();
		
		// create an event object for the machine
		UpdateEvent event = new UpdateEvent();
		
		// Gradeable message to stdout will be generated when one of 
		// the button variables is read in InstrLDS.java.
		event.setMemory(machine.getLabel("Button_A"), machine.checkButton("A"));
		event.setMemory(machine.getLabel("Button_B"), machine.checkButton("B"));
		event.setMemory(machine.getLabel("Button_Up"), 
		    machine.checkButton("Up"));
		event.setMemory(machine.getLabel("Button_Down"), 
		    machine.checkButton("Down"));
		event.setMemory(machine.getLabel("Button_Right"),     
		    machine.checkButton("Right"));
		event.setMemory(machine.getLabel("Button_Left"), 
		    machine.checkButton("Left"));
		
		// have machine update using event object
    	machine.updateState(event);
	}
}

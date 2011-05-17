package instructions;

import machine.MachineState;

import org.apache.log4j.Logger;

public class InstrBRMI extends Instr {

	static final private Logger logger = Logger.getLogger(InstrBRMI.class);
	private final String label;
	
	public InstrBRMI(MachineState machine, String label) {
		super(machine);
		this.label = label;
	}

	@Override
	public String toString() {
		return "BRMI " + label;
	}

	@Override
	public void execute() throws RuntimeError {
		logger.debug("Executing BRMI instruction...");
		if (this.machine.getLabel(label) == null) {
			throw new RuntimeError("Could not find label: " + label);
		}
		if (this.machine.getSREG().isN()) {
			logger.trace("Branching to label: " + label);
			this.event.setPC(this.machine.getLabel(label));
		    logger.debug("Setting PC value to (0x"
				+ Integer.toHexString(this.machine.getLabel(label))
				+ ") for a BRLO.");
		} else {
			logger.trace("No branching to label: " + label);
			this.event.setPC(this.machine.getPC() + 1);
		    logger.debug("Setting PC value to (0x"
				+ Integer.toHexString(this.machine.getPC() + 1)
				+ ") for a BRLO.");
		}

	}

}

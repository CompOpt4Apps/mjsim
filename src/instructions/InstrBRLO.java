package instructions;

import machine.MachineState;

import org.apache.log4j.Logger;

public class InstrBRLO extends Instr {

	private final String label;
	private final static Logger logger = Logger.getLogger(InstrBRLO.class);

	public InstrBRLO(MachineState machine, String label) {
		super(machine);
		this.label = label;
	}

	@Override
	public void execute() throws RuntimeError {
		logger.debug("Executing BRLO instruction...");
		if (this.machine.getLabel(label) == null) {
			throw new RuntimeError("Could not find label: " + label);
		}
		if (this.machine.getSREG().isC()) {
			logger.trace("Branching to label: " + label);
			this.event.setPC(this.machine.getLabel(label));
		} else {
			logger.trace("No branching to label: " + label);
			this.event.setPC(this.machine.getPC() + 1);
		}
		logger.debug("Setting PC value to (0x"
				+ Integer.toHexString(this.machine.getLabel(label))
				+ ") for a BRLO.");
	}

	@Override
	public String toString() {
		return "BRLO " + label;
	}
}

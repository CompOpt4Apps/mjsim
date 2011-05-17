package instructions;

import machine.MachineState;

import org.apache.log4j.Logger;

public class InstrBRLT extends Instr {

	static private final Logger logger = Logger.getLogger(InstrBRLT.class);

	private final String label;

	public InstrBRLT(MachineState machine, String label) {
		super(machine);
		this.label = label;
	}

	@Override
	public void execute() throws RuntimeError {
		logger.debug("Executing BRLT instruction...");
		if (this.machine.getLabel(label) == null) {
			throw new RuntimeError("Could not find label: " + label);
		}
		if (this.machine.getSREG().isS()) {
			logger.trace("Branching to label: " + label);
			this.event.setPC(this.machine.getLabel(label));
		    logger.debug("Setting PC value to (0x"
				+ Integer.toHexString(this.machine.getLabel(label))
				+ ") for a BRLT.");
		} else {
			logger.trace("No branching to label: " + label);
			this.event.setPC(this.machine.getPC() + 1);
		    logger.debug("Setting PC value to (0x"
				+ Integer.toHexString(this.machine.getPC() + 1)
				+ ") for a BRLT.");
		}
	}

	@Override
	public String toString() {
		return "BRLT " + label;
	}

}

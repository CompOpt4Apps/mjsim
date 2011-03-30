package instructions;

import org.apache.log4j.Logger;

import machine.MachineState;

public class InstrBREQ extends Instr {

	private final String label;
	private final static Logger logger = Logger.getLogger(InstrBREQ.class);
	public InstrBREQ(MachineState machine,String label) {
		super(machine);
		this.label = label;
	}

	@Override
	public String toString() {
		return "BREQ " + label;
	}

	@Override
	public void execute() throws RuntimeError {
		logger.debug("Executing BREQ "+label+" instruction...");
		if(this.machine.getLabel(label)==null)
		{
			throw new RuntimeError("Could not find label: " + label);
		}
        logger.debug("Z is "+this.machine.getSREG().isZ());
		if(this.machine.getSREG().isZ())
		{
			this.event.setPC(this.machine.getLabel(label));
		    logger.debug("Setting PC value to (0x" + Integer.toHexString(this.machine.getLabel(label)) + ") for a BREQ.");
		}
		else
		{
			this.event.setPC(this.machine.getPC()+1);
		    logger.debug("Setting PC value to (0x" + Integer.toHexString(this.machine.getPC()+1) + ") for a BREQ.");
		}
	}
}


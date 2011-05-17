package instructions;

import org.apache.log4j.Logger;

import machine.MachineState;

public class InstrJmp extends Instr {
	private static final Logger logger = Logger.getLogger(InstrJmp.class);
	private final String label;
	public InstrJmp(MachineState machine, String label) {
		super(machine);
		this.label = label;
	}

	@Override
	public void execute() throws RuntimeError {
		Integer pcValue = null;
        
        if(this.label.equals("endLabel"))
        {
            logger.debug("Found the endLabel, the simulator will begin the shutdown process.");
            pcValue = new Integer(this.machine.getPC()+1);
        }
        else
        {
            pcValue = this.machine.getLabel(label);
            if(pcValue == null)
		    pcValue = this.machine.getFunction(label);
        }

		if(pcValue==null)
		{
			throw new RuntimeError("Could not find label: " + label);
		}
		logger.debug("Setting PC value to (0x" + Integer.toHexString(pcValue) + ") for a jump.");
		this.event.setPC(pcValue);
	}

	@Override
	public String toString() {
		return "JMP " + label;
	}
}

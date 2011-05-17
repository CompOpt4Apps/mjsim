package instructions;

import machine.MachineState;

import org.apache.log4j.Logger;

public class InstrLabel extends Instr {
	private final String label;
	private static final Logger logger = Logger.getLogger(InstrLabel.class);
    public InstrLabel(MachineState machine,String label) {
		super(machine);
		this.label = label;
	}

	/**
	 * For a label just increment the pc value by 1.
	 * This would be like a nop.
	 */
	@Override
	public void execute() throws RuntimeError {
        logger.debug("Hit label "+ label+".  Incrementing pc by 1.");
		this.event.setPC(this.machine.getPC()+1);
	}

	@Override
	public String toString() {
		return label +":";
	}
	
	public String getLabel()
	{
		return label;
	}

}

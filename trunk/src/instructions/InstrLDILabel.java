package instructions;

import org.apache.log4j.Logger;
import machine.MachineState;

/**
 * Load address of label - Rd <- &Label | PC <- PC+1
 * @author Michael Miller
 *
 */
public class InstrLDILabel extends Instr {
	
	private static final Logger logger = Logger.getLogger(InstrLDILabel.class);
	private int rd;
	private String label;
	private LDIType bits;
	
	public InstrLDILabel(MachineState machine, int rd, String label, LDIType b) throws MalformedInstruction {
		super(machine);
		if(rd < 16 || rd > 31)
		{
			throw new MalformedInstruction("Invalid register number r(" + rd + ")");
		}
		if(null == label)
		{
			throw new MalformedInstruction("Invalid label (null)");
		}
		
		this.rd = rd;
		this.label = label;
		this.bits = b;
	}
	
	@Override
	public String toString() {
		if(LDIType.LO == bits)
			return "LDI r" + rd + ", lo8(" + label + ")";
		else
			return "LDI r" + rd + ", hi8(" + label + ")";
	}

	@Override
	public void execute() throws RuntimeError {
		Integer lbl = this.machine.getFunction(label);
		if(null == lbl && null == (lbl = this.machine.getLabel(label)))
			throw new RuntimeError("Could not find label: " + label);

		lbl += 1;	// TODO: This needs to be fixed, right now it is a sloppy hack.
				// The issue is that labels are given different "addresses" than the instructions
				// for that label, so if there are consecutive labels in a row, this will not work.
		
		if(LDIType.LO == bits)	{
			logger.debug("LDI instructions r(" + rd + ") lo8(" + label + ")");
			this.event.setRd(rd, lbl & 0xFF);
		}	else	{
			logger.debug("LDI instructions r(" + rd + ") hi8(" + label + ")");
			this.event.setRd(rd, lbl >> 8);
		}
		this.event.setPC(this.machine.getPC() + 1);
	}
	
	public enum LDIType
	{
		HI,LO;
	}
}

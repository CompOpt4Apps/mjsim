package instructions;

import org.apache.log4j.Logger;

import machine.MachineState;

/**
 * Load Immediate - Rd <- k | PC <- PC+1
 * @author Ryan Moore
 *
 */
public class InstrLDI extends Instr {
	private static final Logger logger = Logger.getLogger(InstrLDI.class);
	private int rd;
	private int k;
	public InstrLDI(MachineState machine,int rd, int k) throws MalformedInstruction {
		super(machine);
		if(rd < 16 || rd > 31)
		{
			throw new MalformedInstruction("Invalid register number r("+rd+")");
		}
		if(k < 0 || k > 255)
		{
			throw new MalformedInstruction("Invalid immediate value ("+k+")");
		}
		
		this.rd = rd;
		this.k = k;
	}

	public InstrLDI(MachineState machine, int rd, int k, LDIType type) throws MalformedInstruction
	{
		this(machine, rd, getHILO(k,type));
	}
	
	private static int getHILO(int k, LDIType type)
	{
		int value = 0;
		switch(type)
		{
		case LO:
				value = k & 0xFF;
				break;
		case HI: 
				value = (k & 0xFF00) >> 8;
				break;
		}	
		return value;
	}
	
	@Override
	public String toString() {
		return "LDI r" + rd + ", " + k;
	}

	@Override
	public void execute() {
		logger.debug("LDI instructions r("+rd+") value(" + k + ")");
		this.event.setPC(this.machine.getPC()+1);
		this.event.setRd(rd, k);
	}
	public enum LDIType
	{
		HI,LO;
	}
}

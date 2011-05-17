package instructions;

import machine.MachineState;
import machine.SREG;

import org.apache.log4j.Logger;

public class InstrMuls extends Instr {

	final private int rd;
	final private int rr;
	private static final Logger logger = Logger.getLogger(InstrMuls.class);
	public InstrMuls(MachineState machine,int rd,int rr) throws MalformedInstruction{
		super(machine);
		if(rd < 0 || rd > 31)
		{
			throw new MalformedInstruction("Invalid register number rd("+rd+")");
		}

		if(rr < 0 || rr > 31)
		{
			throw new MalformedInstruction("Invalid register number rr("+rr+")");
		}
		this.rd = rd;
		this.rr = rr;
	}

	@Override
	public String toString() {
		return "MULS " + rd +", " + rr;
	}

	@Override
	public void execute() throws RuntimeError {
		logger.debug("Executing MULS instruction...");
		final SREG sreg = new SREG();
		byte rdValue = (byte) (machine.getRegister(rd) & 0xFF );
		byte rrValue = (byte) (machine.getRegister(rr) & 0xFF );
		short retVal = (short) (rdValue * rrValue);
		event.setPC(machine.getPC()+1);
		event.setRd(0, retVal & 0xFF);
		event.setRd(1, (retVal & 0xFF00)>>8);
		if(retVal == 0)
		{
			sreg.setZ(true);
		}
		else
		{
			sreg.setZ(false);
		}
		if((retVal & 0x8000) != 0)
		{
			sreg.setC(true);
		}
		else
		{
			sreg.setC(false);
		}
		event.setSREG(sreg);
	}

}

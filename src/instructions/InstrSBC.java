package instructions;

import org.apache.log4j.Logger;

import machine.MachineState;
import machine.SREG;

public class InstrSBC extends Instr {
	final private int rd;
	final private int rr;
	private final static int bitMask = 0xFF;
	private final static int msbMask = 0x80;
	private static final Logger logger = Logger.getLogger(InstrSBC.class);
	public InstrSBC(MachineState machine, int rd, int rr) throws MalformedInstruction
	{
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
		return "SBC " +rd+", " +rr;
	}

	@Override
	public void execute() throws RuntimeError {
		logger.debug("Executing sbc...");
		SREG newStatus = machine.getSREG();
		int dst = machine.getRegister(rd);
		int src = machine.getRegister(rr);
		int nMsb = (dst & msbMask) & (src & msbMask);
		if(machine.getSREG().isC())
		{
			dst = dst-src-1;			
		}
		else
		{
			dst = dst-src;
		}
		if(Math.abs(src) > Math.abs(dst))
		{
			newStatus.setC(true);
		}
		else
		{
			newStatus.setC(false);
		}
		this.event.setRd(rd, dst);
		this.event.setPC(machine.getPC()+1);
		
		//update the SREG
		//check zero.
		if(dst == 0)
		{
			newStatus.setZ(true);
		}
		else
		{
			newStatus.setZ(false);
		}
		
		//determine the v bit.
		if(nMsb != (dst & msbMask))//check to see if the msb changed to show 2's complement overflow
		{
			newStatus.setV(true);
		}
		else
		{
			newStatus.setV(false);
		}
		
		//check the msb, if it is set, set the N bit in the SREG. 
		if((dst & msbMask) == msbMask)
		{
			newStatus.setN(true);
		}
		else
		{
			newStatus.setN(false);
		}
		
		newStatus.setS(newStatus.isN() ^ newStatus.isV());
		this.event.setSREG(newStatus);
		
	}
}

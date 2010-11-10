package instructions;

import machine.MachineState;
import machine.SREG;

import org.apache.log4j.Logger;

/**
 * Add without Carry - Rd <- Rd + Rr | PC <- PC + 1
 * @author Ryan Moore
 *
 */
public class InstrAdd extends Instr {
	private static final Logger logger = Logger.getLogger(InstrAdd.class);
	private final int rd;
	private final int rr;
	private final static int bitMask = 0xFF;
	private final static int msbMask = 0x80;
	
	public InstrAdd(MachineState machine, int rd, int rr) throws MalformedInstruction {
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
		return "ADD r" + rd + " r" + rr;
	}

	@Override
	public void execute() {
		logger.debug("Executing ADD with registers rd(" + rd + ") and rr("+rr+")");
		SREG newStatus = machine.getSREG();
		int dst = machine.getRegister(rd);
		int src = machine.getRegister(rr);
		int nMsb = (dst & msbMask) & (src & msbMask);
		dst = dst+src;
		if(dst > 255)
		{
			dst&=bitMask;//set only the data less than 255 in dst.
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
		logger.debug("The updated SREG is: " + newStatus.toString());
	}
}

package instructions;

import org.apache.log4j.Logger;

import machine.MachineState;
import machine.SREG;

/**
 * ADC - Add with Carry
 * Rd <- Rd + Rr + C | PC <- PC + 1
 * @author Ryan Moore
 *
 */
public class InstrAdc extends Instr {
	private static final Logger logger = Logger.getLogger(InstrAdc.class);
	private final int rd;
	private final int rr;
	private final static int bitMask = 0xFF;
	private final static int msbMask = 0x80;
	
	public InstrAdc(MachineState machine, int rd, int rr) throws MalformedInstruction {
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
		return "ADC r" + rd + " r" + rr + " + C"; 
	}

	@Override
	public void execute() {
		logger.debug("Executing ADC with registers rd(" + rd + ") and rr("+rr+")");
		SREG newStatus = machine.getSREG();
		int dst = machine.getRegister(rd);
		int src = machine.getRegister(rr);
		int nMsb = (dst & msbMask) & (src & msbMask);
		if(newStatus.isC())
		{
			dst = dst+src+1;//if C is set add 1		
		}
		else
		{
			dst = dst+src;
		}
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

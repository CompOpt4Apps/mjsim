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
	private final static int msbMask = 0x0080;
	private final static int bit7Mask = 0x0040;
	
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
		int result;
		logger.debug("dst = "+dst);
		logger.debug("src = "+src);
		
		if(newStatus.isC())
		{
		    logger.debug("C is set");
			result = dst+src+1;//if C is set add 1		
		}
		else
		{
			result = dst+src;
		}
		logger.debug("result = "+result);
		
		// C bit, 
		// Set if there was carry from the MSB of the result; cleared otherwise
        if ( ( (bit7Mask & dst)!=0 && (bit7Mask & src)!=0)
             || ( (bit7Mask & src)!=0 && (bit7Mask&result)==0 ) 
		     || ( (bit7Mask&result)==0 && (bit7Mask & dst)!=0 ) 
		   )
		{
			newStatus.setC(true);
			logger.trace("Setting C to true");
		}
		else
		{
			newStatus.setC(false);
			logger.trace("Setting C to false");
		}
		this.event.setRd(rd, result);
		this.event.setPC(machine.getPC()+1);
		
		//update the SREG
		//check zero.
		// FIXME: kindof surprised this is not like SBC and CPC
		// but according to AVR manual it isn't
		if(dst == 0)
		{
			newStatus.setZ(true);
			logger.trace("Setting Z to true");
		}
		else
		{
			newStatus.setZ(false);
			logger.trace("Setting Z to false");
		}
		
		//determine the v bit.
		// Rd7 and Rr7 and !R7 + !Rd7 and !Rr7 and R7
        // Set if two’s complement overflow resulted 
        // from the operation; cleared otherwise.
        if ( ((bit7Mask & dst)!=0 && (bit7Mask & src)!=0 
               && (bit7Mask&result)==0) 
		  || ((bit7Mask & dst)==0 && (bit7Mask & src)==0 
		       && (bit7Mask&result)!=0) 
		   )
		{
			newStatus.setV(true);
			logger.trace("Setting V to true");
		}
		else
		{
			newStatus.setV(false);
			logger.trace("Setting V to false");
		}
		
		//check the msb, if it is set, set the N bit in the SREG. 
		if((dst & msbMask) == msbMask)
		{
			newStatus.setN(true);
			logger.trace("Setting N to true");
		}
		else
		{
			newStatus.setN(false);
			logger.trace("Setting N to false");
		}
		
		newStatus.setS(newStatus.isN() ^ newStatus.isV());
		this.event.setSREG(newStatus);
		logger.debug("The updated SREG is: " + newStatus.toString());
	}
}

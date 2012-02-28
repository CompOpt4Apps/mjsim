package instructions;

import org.apache.log4j.Logger;

import machine.MachineState;
import machine.SREG;

public class InstrCPC extends Instr {

	private final static Logger logger = Logger.getLogger(InstrCPC.class);
	private final int rd;
	private final int rr;
	private final static int bitMask = 0xFF;
	private final static int msbMask = 0x0080;
	private final static int bit7Mask = 0x0040;
	public InstrCPC(MachineState machine, int rd, int rr) throws MalformedInstruction {
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
		return "cpc r" + rd+", r"+ rr;
	}

	@Override
	public void execute() throws RuntimeError {
		logger.debug("Executing CPC instruction with registers " + rd + " and " + rr);
		SREG newSREG = new SREG();
		
		//get the values stored in the registers.
		int dst = this.machine.getRegister(rd);
		int src = this.machine.getRegister(rr);
        logger.debug("dst = "+dst+", src = "+src);
		int nMsb = (dst & msbMask) & (src & msbMask);//used for checking to see if the msb has changed.
		int result;
		this.event.setPC(this.machine.getPC()+1);//update pc value.

		if(machine.getSREG().isC())
		{
			result = dst-src-1;			
		}
		else
		{
			result = dst-src;
		}
        logger.debug("result = "+result);


		//check for the C bit.
		if(Math.abs(src) > Math.abs(dst))
		{
			newSREG.setC(true);
			logger.trace("Setting C to true");
		}
		else
		{
			newSREG.setC(false);
		}
		
		//check for the Z bit
		// DIFFERENT than many other instructions
		// Previous value remains unchanged when the result is zero; 
		// cleared otherwise.
		if(result == 0)
		{
			newSREG.setZ(this.machine.getSREG().isZ());
			logger.trace("Keeping Z the same");
		}
		else
		{
			newSREG.setZ(false);
			logger.trace("Setting Z to false");
		}
		
		//check for the N bit
		if((result & msbMask) == msbMask)
		{
			newSREG.setN(true);
			logger.trace("Setting N to true");
		}
		else
		{
			newSREG.setN(false);
			logger.trace("Setting N to false");
		}
		
		//check for the V bit.
		// Rd7 and !Rr7 and !R7 + !Rd7 and Rr7 and R7
        // Set if two’s complement overflow resulted 
        // from the operation; cleared otherwise.
        if ( ((bit7Mask & dst)!=0 && (bit7Mask & src)==0 
              && (bit7Mask&result)==0) 
		  || ((bit7Mask & dst)==0 && (bit7Mask & src)!=0 
		      && (bit7Mask&result)!=0) 
		   )
		{
			newSREG.setV(true);
			logger.trace("Setting V to true");
		}
		else
		{
			newSREG.setV(false);
			logger.trace("Setting V to false");
		}
		
		//determine S
		newSREG.setS(newSREG.isN() ^ newSREG.isV());
        logger.debug("S = "+newSREG.isS());
		
		this.event.setSREG(newSREG);
	}
}

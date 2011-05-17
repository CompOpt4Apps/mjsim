package instructions;

import org.apache.log4j.Logger;

import machine.MachineState;
import machine.SREG;

public class InstrCP extends Instr {

	private final static Logger logger = Logger.getLogger(InstrCP.class);
	private final int rd;
	private final int rr;
//	private final static int bitMask = 0xFF;
	private final static int msbMask = 0x0080;
	private final static int bit7Mask = 0x0040;
	public InstrCP(MachineState machine, int rd, int rr) throws MalformedInstruction {
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
		return "cp r" + rd+", r"+ rr;
	}

	@Override
	public void execute() throws RuntimeError {
		logger.debug("Executing CP instruction with registers " + rd + " and " + rr);
		SREG newSREG = new SREG();
		
		//get the values stored in the registers.
		int dst = this.machine.getRegister(rd);
		int src = this.machine.getRegister(rr);
		
		// need to sign extend these guys?
		//if((dst & msbMask) == msbMask) {    // if negative
		//    dst = dst | 0xFFFFFF00;
		//}
		//if((src & msbMask) == msbMask) {    // if negative
		//    src = src | 0xFFFFFF00;
		//}
        logger.debug("dst = "+dst+", src = "+src);

		int result = dst - src; // & bitMask;
        logger.debug("dst-src = "+ (dst-src)+", result = "+result);
		this.event.setPC(this.machine.getPC()+1);//update pc value.
		
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
		if(result == 0)
		{
			newSREG.setZ(true);
			logger.trace("Setting Z to true");
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

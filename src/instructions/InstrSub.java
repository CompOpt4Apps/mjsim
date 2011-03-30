package instructions;

import org.apache.log4j.Logger;

import machine.MachineState;
import machine.SREG;

public class InstrSub extends Instr {
	final private int rd;
	final private int rr;
	private final static int bitMask = 0xFF;
	private final static int msbMask = 0x80;
	private final static int bit7Mask = 0x40;
	private static final Logger logger = Logger.getLogger(InstrSub.class);
	public InstrSub(MachineState machine, int rd, int rr) throws MalformedInstruction {
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
		return "SUB " + rd + ", " + rr;
	}

	@Override
	public void execute() throws RuntimeError {
		logger.debug("Executing sub...");
		SREG newStatus = machine.getSREG();
		int dst = machine.getRegister(rd);
		int src = machine.getRegister(rr);
		//int nMsb = (dst & msbMask) & (src & msbMask);
		int result = dst-src;
        if ( ( (bit7Mask & dst)==0 && (bit7Mask & src)>0)
             || ( (bit7Mask & src)>0 && (bit7Mask&result)>0 ) 
		     || ( (bit7Mask&result)>0 && (bit7Mask & dst)==0 ) 
		   )
		{
			newStatus.setC(true);
		}
		else
		{
			newStatus.setC(false);
		}
		this.event.setRd(rd, result);
		this.event.setPC(machine.getPC()+1);
		
		//update the SREG
		//check zero.
		if(result == 0)
		{
			newStatus.setZ(true);
		}
		else
		{
			newStatus.setZ(false);
		}
		
		//determine the v bit.
		//if(nMsb != (dst & msbMask))//check to see if the msb changed to show 2's complement overflow
		// Rd7 and !Rr7 and !R7 + !Rd7 and Rr7 and R7
        // Set if two’s complement overflow resulted 
        // from the operation; cleared otherwise.
        if ( ((bit7Mask & dst)>0 && (bit7Mask & src)==0 && (bit7Mask&result)==0) 
		  || ((bit7Mask & dst)==0 && (bit7Mask & src)>0 && (bit7Mask&result)>0) 
		   )
		{
			newStatus.setV(true);
		}
		else
		{
			newStatus.setV(false);
		}
		
		//check the msb, if it is set, set the N bit in the SREG. 
		if((result & msbMask) == msbMask)
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

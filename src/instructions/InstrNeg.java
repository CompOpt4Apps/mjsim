package instructions;

import org.apache.log4j.Logger;

import machine.MachineState;
import machine.SREG;

/**
 * NEG - Two's Complement
 * Rd <- $00 - Rd | Pc <- Pc + 1
 * @author Ryan
 *
 */
public class InstrNeg extends Instr {
	private static final Logger logger = Logger.getLogger(InstrNeg.class);
	private int msb = 0x0080;
	private int rd;
	public InstrNeg(MachineState machine,int rd) throws MalformedInstruction {
		super(machine);
		if(rd < 0 || rd > 31)
		{
			throw new MalformedInstruction("Invalid register number rd("+rd+")");
		}
		this.rd = rd;
	}

	@Override
	public String toString() {
		return "NEG rd("+this.rd+")";
	}

	@Override
	public void execute() {
		logger.debug("Computing the Neg of rd("+rd+")");
		int dst = this.machine.getRegister(rd);

		dst = 0 - dst;
		
		this.event.setRd(rd, dst);
		SREG newSreg = this.machine.getSREG();
		if((dst & msb) == msb)
		{
			newSreg.setN(true);
		}
		else
		{
			newSreg.setN(false);
		}
		if(dst == msb)
		{
			newSreg.setV(true);
		}
		else
		{
			newSreg.setV(false);
		}
		if(dst == 0)
		{
			newSreg.setZ(true);
			newSreg.setC(false);
		}
		else
		{
			newSreg.setZ(false);
			newSreg.setC(true);
		}
		newSreg.setS(newSreg.isN() ^ newSreg.isV());
		this.event.setSREG(newSreg);
		this.event.setPC(this.machine.getPC()+1);
	}
}

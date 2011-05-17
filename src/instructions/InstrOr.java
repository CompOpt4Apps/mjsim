package instructions;

import machine.MachineState;
import machine.SREG;

import org.apache.log4j.Logger;

/**
 * OR - Logical OR
 * RD <- Rd v Rr | PC <- PC + 1
 * @author Ryan Moore
 *
 */
public class InstrOr extends Instr {
	private static final Logger logger = Logger.getLogger(InstrOr.class);
	private int msb = 0x0080;
	private int rd,rr;
	public InstrOr(MachineState machine,int rd, int rr) throws MalformedInstruction {
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
		return "OR rd("+this.rd+") rr("+this.rr+")";
	}

	@Override
	public void execute() {
		logger.debug("Computing the OR of rd("+rd+") and rr("+rr+").");
		int dst = this.machine.getRegister(rd);
		int src = this.machine.getRegister(rr);
		dst = dst | src;
		
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
		newSreg.setV(false);
		if(dst == 0)
		{
			newSreg.setZ(true);
		}
		else
		{
			newSreg.setZ(false);
		}
		newSreg.setS(newSreg.isN() ^ newSreg.isV());
		this.event.setSREG(newSreg);
		this.event.setPC(this.machine.getPC()+1);
	}
}
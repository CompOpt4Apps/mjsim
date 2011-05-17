package instructions;

import org.apache.log4j.Logger;

import machine.MachineState;
import machine.SREG;

/**
 * EOR - Exclusive Or
 * RD <- RD ^ RR | PC <- PC + 1
 * @author Ryan Moore
 *
 */
public class InstrEor extends Instr {
	private static final Logger logger = Logger.getLogger(InstrEor.class);
	private int msb = 0x0080;
	private int rd,rr;
	public InstrEor(MachineState machine,int rd, int rr) throws MalformedInstruction {
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
		return "EOR rd("+this.rd+") rr("+this.rr+")";
	}

	@Override
	public void execute() {
		logger.debug("Computing the exclusive OR of rd("+rd+") and rr("+rr+").");
		int dst = this.machine.getRegister(rd);
		int src = this.machine.getRegister(rr);
		dst = dst ^ src;
		
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

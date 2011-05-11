package instructions;

import machine.MachineState;
import machine.SREG;

import org.apache.log4j.Logger;

/**
 * LSR - Logical Shift Right
 * Rd <- Rd >> 1 | C <- LSB(Rd) | PC <- PC + 1
 * @author Michael Miller
 *
 */
public class InstrLSR extends Instr {
	
	private static final Logger logger = Logger.getLogger(InstrLSL.class);
	private int lsb = 0x0001;
	private int rd;
	
	public InstrLSR(MachineState machine, int rd) throws MalformedInstruction {
		super(machine);
		if(rd < 0 || rd > 31)
		{
			throw new MalformedInstruction("Invalid register number rd(" + rd + ")");
		}
		this.rd = rd;
	}

	@Override
	public String toString() {
		return "LSR rd(" + this.rd + ")";
	}

	@Override
	public void execute() {
		logger.debug("Computing the LSR of rd(" + rd + ").");
		int oldVal = this.machine.getRegister(rd);
		int newVal = oldVal >> 1;
		
		this.event.setRd(rd, newVal);
		SREG newSreg = this.machine.getSREG();
		newSreg.setN(false);
		newSreg.setZ(newVal == 0);
		newSreg.setC((oldVal & lsb) == lsb);
		newSreg.setS(newSreg.isN() ^ newSreg.isV());
		newSreg.setV(newSreg.isN() ^ newSreg.isC());
		
		this.event.setSREG(newSreg);
		this.event.setPC(this.machine.getPC() + 1);
	}
}
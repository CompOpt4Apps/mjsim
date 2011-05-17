package instructions;

import machine.MachineState;
import machine.SREG;

public class InstrTST extends Instr {

	private final int rd;

	public InstrTST(MachineState machine, int rd) throws MalformedInstruction {
		super(machine);
		if ((rd < 0) || (rd > 31)) {
			throw new MalformedInstruction("Invalid register number rd(" + rd
					+ ")");
		}
		this.rd = rd;
	}

	@Override
	public void execute() throws RuntimeError {
		this.event.setPC(this.machine.getPC() + 1);
		final SREG newSreg = new SREG();
		newSreg.setV(false);
		final int regValue = this.machine.getRegister(rd);
		final int msbMask = 0x80;
		if (regValue == 0) {
			newSreg.setZ(true);
		} else {
			newSreg.setZ(false);
		}

		if ((regValue & msbMask) == msbMask) {
			newSreg.setN(true);
		} else {
			newSreg.setN(false);
		}
		newSreg.setS(newSreg.isV() ^ newSreg.isN());

		this.event.setSREG(newSreg);
	}

	@Override
	public String toString() {
		return "TST " + rd;
	}

}

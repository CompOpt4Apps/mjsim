package instructions;

import machine.MachineState;

import org.apache.log4j.Logger;

public class InstrMov extends Instr {

	private final int rd;
	private final int rr;
	private final static Logger logger = Logger.getLogger(InstrMov.class);
	
	public InstrMov(MachineState machine, int rd, int rr) throws MalformedInstruction
	{
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
		return "Mov r"+rd+", r"+rr+"";
	}

	@Override
	public void execute() throws RuntimeError {
		logger.debug("Executing " + this.toString());
		this.event.setPC(this.machine.getPC()+1);
		this.event.setRd(rd, this.machine.getRegister(rr));
	}
}

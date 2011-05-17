package instructions;

import org.apache.log4j.Logger;

import machine.MachineState;

/**
 * PUSH - Push Register on Stack
 * STACK <-Rr | PC <- PC + 1 | SP <- SP - 1
 * @author Ryan Moore
 *
 */
public class InstrPush extends Instr {
	private int register;
	private final static Logger logger = Logger.getLogger(InstrPush.class);
	public InstrPush(MachineState machine,int register) throws MalformedInstruction {
		super(machine);
		if(register < 0 || register > 31)
		{
			throw new MalformedInstruction("Invalid register number r("+register+")");
		}
		this.register = register;
	}

	@Override
	public String toString() {
		return "PUSH r"+register;
	}

	@Override
	public void execute() {
		this.event.setPC(machine.getPC()+1);
		this.event.setMemory(machine.getStackPointer(), this.machine.getRegister(this.register));
		//copy the value in the register into the memory location.
		this.event.setStackPointer(machine.getStackPointer()-1);
		logger.debug("Pushing the value ("+this.machine.getRegister(this.register)+") in r("+this.register+") onto the stack.");
		
		this.machine.noteStore();
	}
}

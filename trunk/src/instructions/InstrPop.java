package instructions;

import org.apache.log4j.Logger;

import machine.MachineState;


/**
 * POP - Pop Register off Stack
 * Rd <- STACK | PC <- PC + 1 | SP <- SP + 1
 * @author Ryan Moore
 *
 */
public class InstrPop extends Instr {
	private int register;
	private static final Logger logger = Logger.getLogger(InstrPop.class);
	public InstrPop(MachineState machine,int register) throws MalformedInstruction {
		super(machine);
		if(register < 0 || register > 31)
		{
			throw new MalformedInstruction("Invalid register number r("+register+")");
		}
		this.register = register;
	}

	@Override
	public String toString() {
		return "POP r" + register;
	}

	@Override
	public void execute() {
		this.event.setPC(this.machine.getPC()+1);
		this.event.setRd(register, this.machine.getStack(this.machine.getStackPointer()+1));//pre-increment the stackPointer.
		//grab the value on the top of the stack and store it into the register.
		this.event.setStackPointer(machine.getStackPointer()+1);
		//popping off the address on the top of the stack pointer adds one to the stack.
		logger.debug("Popping the value ("+this.event.getRd().get(register)+") into register r("+register+")");
		
	    this.machine.noteLoad();

	}
}

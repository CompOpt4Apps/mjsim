package instructions;

import org.apache.log4j.Logger;

import machine.MachineState;
import machine.UpdateEvent;

/**
 * ICALL - Indirect call to subroutine
 * PC <- Z | STACK <- PC + 1 | SP <- SP - 2
 * The return address we store on the stack is PC +1 instead of PC + 2 because all of our instructions are the same size and do not take up more than one slot.
 * @author Michael Miller
 *
 */
public class InstrICall extends Instr {
	private static final Logger logger = Logger.getLogger(InstrICall.class);
	public InstrICall(MachineState machine){
		super(machine);
	}

	@Override
	public String toString() {
		return "ICALL";
	}

	@Override
	public void execute() throws RuntimeError {
		logger.info("Executing InstrICall...");
		// Store the return address which is the PC + 1 onto the stack.
		this.event.setLongMemory(this.machine.getStackPointer() - 1, this.machine.getPC() + 1);
		// Get the address we're jumping to
		int z = this.machine.getRegister(30) | (this.machine.getRegister(31) << 8);
		logger.debug("calling code at Z (0x" + Integer.toHexString(z) +") with return address of (0x" + Integer.toHexString(this.machine.getPC() + 1) + ")");
		// Update the stack pointer an PC
		this.event.setStackPointer(this.machine.getStackPointer() - 2);
		this.event.setPC(z);
	}
}
package instructions;

import org.apache.log4j.Logger;

import machine.MachineState;

/**
 * RET - Return from Subroutine
 * @author Ryan Moore
 *
 */
public class InstrRet extends Instr {
	private static final Logger logger = Logger.getLogger(InstrRet.class);
	
	public InstrRet(MachineState machine) {
		super(machine);
	}

	@Override
	public String toString() {
		return "RET";
	}

	@Override
	public void execute() {
		//need to load the PC from the stack and then 
		int topMost = this.machine.getStack(this.machine.getStackPointer()+1);
		int bottomMost = this.machine.getStack(this.machine.getStackPointer()+2);
		topMost= topMost << 8;
		int realPC = topMost | bottomMost;
		logger.debug("The PC returned from the stack is (0x"+ Integer.toHexString(realPC)+")");
		this.event.setPC(realPC);
		this.event.setStackPointer(this.machine.getStackPointer()+2);
	}

}

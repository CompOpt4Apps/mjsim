package instructions;

import org.apache.log4j.Logger;

import machine.MachineState;
import machine.UpdateEvent;

/**
 * CALL - Long Call to a Subroutine
 * PC <- k | STACK <- PC + 1 | SP <- SP - 2
 * The return address we store on the stack is PC +1 instead of PC + 2 because all of our instructions are the same size and do not take up more than one slot.
 * @author Ryan Moore
 *
 */
public class InstrCall extends Instr {
	private static final Logger logger = Logger.getLogger(InstrCall.class);
	private String functionName;
	public InstrCall(MachineState machine, String function){
		super(machine);
		this.functionName = function;
	}

	@Override
	public String toString() {
		return "CALL " + functionName;
	}

	@Override
	public void execute() throws RuntimeError {
		//this method requires some hacking around the current design.
		//I need to create another UpdateEvent for this call, and not fill in
		//the one that is created in the base abstract class.
		logger.info("Executing InstrCall...");
		
		if(this.machine.isPredefinedFunction(this.functionName))
		{	
			logger.debug("PredefinedFunction");
			this.machine.getPreDefinedFunction(this.functionName).exec();//run the function. all side effects should be in the machine.
			logger.trace("End of PredefinedFunction");
			this.event.setPC(this.machine.getPC()+1);
			return;
		}
		//store the return address which is the pc + 1 onto the stack.
		this.event.setLongMemory(this.machine.getStackPointer()-1, this.machine.getPC()+1);
		logger.debug("calling function " + functionName +" with return address of (0x"+Integer.toHexString(this.machine.getPC()+1)+")");
		this.event.setStackPointer(this.machine.getStackPointer()-2);
		if(this.machine.getFunction(functionName)== null)
		{
			throw new RuntimeError("Could not find function call " + functionName);
		}
		this.event.setPC(this.machine.getFunction(functionName));
	}
}
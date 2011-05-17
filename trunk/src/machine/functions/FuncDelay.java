package machine.functions;

import instructions.RuntimeError;
import machine.MachineState;

import org.apache.log4j.Logger;

public class FuncDelay extends Func {
	private static final Logger logger = Logger.getLogger(FuncDelay.class);
	public FuncDelay(MachineState machine) {
		super(machine, "_Z8delay_msj");
	}

	@Override
	public void exec() throws RuntimeError {
		final int lo = this.machine.getRegister(24);
		final int hi = this.machine.getRegister(25);
		final int duration_ms = lo + hi*256;

        // machine keeps a count
		this.machine.noteMeggyCall();
		this.machine.noteDelay();
		
        System.out.println("Delaying for "+ duration_ms + " milliseconds");	
    }

}

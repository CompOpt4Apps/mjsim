package machine.functions;

import org.apache.log4j.Logger;

import instructions.RuntimeError;
import machine.MachineState;

public class FuncSetAux extends Func {
	
	private static final Logger logger = Logger.getLogger(FuncSetAux.class);
	
    // Max value for the bit array
    static private final int sMaxBitArrayForLEDs = 255;

	public FuncSetAux(MachineState machine) {
		super(machine, "_Z10SetAuxLEDsh");// this value was taken from the 
		                                  // assembly compiled from gcc.
	}

	@Override
	/**
	 * Will grab the parameter from the machine state.  
	   The parameter is a byte-sized bit array.
	 */
	public void exec() throws RuntimeError{

		final int bitarray = this.machine.getRegister(24);

        // machine keeps a count
		this.machine.noteMeggyCall();

        // where in machine state do we set auxiliary lights?
        // Cassie will need this.

        // Check that all input values fall within possible ranges.
        if (!(0<=bitarray && bitarray<=sMaxBitArrayForLEDs)) {
            throw new RuntimeError("bitarray out of bounds, bitarray = "
            +bitarray);
        }   

        // Print a gradeable output message.
        System.out.print(
                "Setting auxiliary LEDs from left to right as follows: ");
        for (int i=1; i<=128; i=i*2) {
            // check if a given bit is set
            if ((bitarray & i)!=0) { 
                System.out.print(" 1 ");
            } else {
                System.out.print(" 0 ");
            }
        }
        System.out.println();
	}
}

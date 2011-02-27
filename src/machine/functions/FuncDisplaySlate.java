package machine.functions;

import instructions.RuntimeError;

import org.apache.log4j.Logger;

import machine.MachineState;

public class FuncDisplaySlate extends Func {

	private static final Logger logger = Logger.getLogger(FuncDisplaySlate.class);
	
	public FuncDisplaySlate(MachineState machine) {
		super(machine, "_Z12DisplaySlatev");
	}

	@Override
	public void exec() throws RuntimeError{
		if(machine == null)
		{
			throw new RuntimeError("The machine object is null and it should not be null");
		}
		for (int i = 0; i < 8; i++) {
			for (int n = 0; n < 8; n++) {
				logger.trace("DisplaySlate index (" + i +"," + n +")");
				// MMS, 2/27/11, at one point we were only printing out
				// the Setting pixel message if the pixel color had changed.
				// This doesn't match with Meggy.java and it makes it 
				// harder for the students to know what is going on.
				// Moved Setting pixel message to the FuncSetPix.java file.
				if (!machine.getDisplaySlate(i, n).equals(
						machine.getGridColor(i, n))) {
					machine.setGridColor(i, n, machine.getDisplaySlate(i, n));
				}
			}

		}

	}
}

package machine.functions;

import instructions.RuntimeError;

import org.apache.log4j.Logger;

import machine.MachineState;

public class FuncDisplaySlate extends Func {

	private static final Logger logger = Logger.getLogger(FuncDisplaySlate.class);
	
	public FuncDisplaySlate(MachineState machine) {
		super(machine, "_Z12DisplaySlatev");
		// TODO Auto-generated constructor stub
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
				if (!machine.getDisplaySlate(i, n).equals(
						machine.getGridColor(i, n))) {
					machine.setGridColor(i, n, machine.getDisplaySlate(i, n));
					System.out.println("Setting pixel (" + i + "," + n
							+ ") to " + machine.getDisplaySlate(i, n));
				}
			}

		}

	}
}

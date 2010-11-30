package machine.functions;

import machine.MachineState;

public class FuncDisplaySlate extends Func {

	public FuncDisplaySlate(MachineState machine) {
		super(machine, "_Z12DisplaySlatev");
		// TODO Auto-generated constructor stub
	}

	@Override
	public void exec() {
		for (int i = 0; i < 8; i++) {
			for (int n = 0; n < 8; n++) {
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

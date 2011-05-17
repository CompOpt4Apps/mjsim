package instructions;

import org.apache.log4j.Logger;

import machine.MachineState;

public class FuncStart extends Instr {
	private final String label;
	private static final Logger logger = Logger.getLogger(FuncStart.class);
    public FuncStart(MachineState machine,String label) {
		super(machine);
		this.label = label;
	}
	
	@Override
	public void execute() {
	    // does nothing, just a place marker in the list of instrs
	    // to group instructions into functions
	}

	@Override
	public String toString() {
		return label +":";
	}
	
	public String getLabel()
	{
		return label;
	}
	
}

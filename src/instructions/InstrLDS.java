package instructions;

import org.apache.log4j.Logger;

import machine.MachineState;

public class InstrLDS extends Instr {

	private final int rd;
	private final String addressPointer;
	private static final Logger logger = Logger.getLogger(InstrLDS.class);
	public InstrLDS(MachineState machine, int rd, String label) throws MalformedInstruction{
		super(machine);
		if(rd < 0 || rd > 31)
		{
			throw new MalformedInstruction("Invalid register number r("+rd+")");
		}
		this.rd = rd;
		this.addressPointer = label;
	}

	@Override
	public String toString() {
		return "LDS " + rd + ", " + addressPointer;
	}

	@Override
	public void execute() throws RuntimeError {
		logger.info("Executing LDS instruction...");
		// use the label to get the address, and then a value from the memory space,
		// and store it into a register.
		Integer address = machine.getLabel(addressPointer);
		if(address == null)
		{
			throw new RuntimeError("Label " + addressPointer + " is not found in the machine state.");
		}
		this.event.setPC(machine.getPC()+1);
		this.event.setRd(rd, machine.getMemory(address));
		
		this.machine.noteLoad();
		
		// Print out the check button message.
		boolean value = false;
		if (machine.getMemory(address)!=0) { value = true; }
		
	    if (addressPointer.equals("Button_B")) {
            System.out.println("Checking button B and returning " + value);
            
        } else if (addressPointer.equals("Button_A")) {
            System.out.println("Checking button A and returning " + value);
            
        } else if (addressPointer.equals("Button_Up")) {
            System.out.println("Checking button Up and returning " + value);
            
        } else if (addressPointer.equals("Button_Down")) {
            System.out.println("Checking button Down and returning " + value);
            
        } else if (addressPointer.equals("Button_Left")) {
            System.out.println("Checking button Left and returning " + value);
            
        } else if (addressPointer.equals("Button_Right")) {
            System.out.println("Checking button Right and returning " + value);
            
        }



	}

}

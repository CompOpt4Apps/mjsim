package instructions;

import machine.MachineState;

import org.apache.log4j.Logger;

/**
 * Implementation for indirect store.
 * STD Z+q,Rr
 * Store Indirect with Displacement
 *    (Z + q) <= Rr
 * Z could be Y or X
 */
public class InstrSTD extends Instr {
	
	private static final Logger logger = Logger.getLogger(InstrSTD.class);
	private final int reg;
	private final char pointer;
	private int q = -1;

	public InstrSTD(MachineState machine, int rr, char pointer, int q) throws MalformedInstruction {
	    super(machine);
		if(rr < 0 || rr > 31)
		{
			throw new MalformedInstruction("Invalid register number rr("+rr+")");
		}
		if(!(pointer == 'X' || pointer == 'Y' || pointer == 'Z'))
		{
			throw new MalformedInstruction("Invalid pointer register " + pointer);
		}
		this.reg = rr;
		this.pointer = pointer;
		if(pointer == 'X')
		{
			throw new MalformedInstruction("Invalid pointer register " + pointer + " with offset.");
		}
		if(q < 0  || q > 63)
		{
			throw new MalformedInstruction("Invalid offset number "+ q);
		}
		this.q = q;
	}
	

	@Override
	/**
	 * Implements storing a value from register to memory.
	   Only implements the default condition atm?
	 */
	public void execute() throws RuntimeError {
		int baseReg = getBaseRegister();
		//logger.debug("baseReg = "+baseReg
		//                   +", val(baseReg+1) = //"+this.machine.getRegister(baseReg+1));
		int address = this.machine.getRegister(baseReg+1) & 0xFF;
		address <<=8;
		address = address + (this.machine.getRegister(baseReg) & 0xFF);

        // add offset to address
	    address+=this.q;
		this.event.setMemory(address, this.machine.getRegister(this.reg));	
		this.event.setPC(this.machine.getPC()+1);

        this.machine.noteStore();
        
		logger.debug("Indirect store from r"+this.reg+" to "+this.pointer
		            +"+"+this.q);
		
		    
	    //TODO need to update the UpdateEvent class to include an addition update field for the X Y and Z registers?
	}

	@Override
	public String toString() {
		return "STD "+this.pointer+"+"+this.q+", r"+this.reg;
	}
	
	private int getBaseRegister()
	{
		switch(pointer)
		{
			case 'X': return 26;
			case 'Y': return 28;
			case 'Z': return 30;
			default: return 0;//This should never happen since this cannot be constructed without a correct pointer.
		}
	}

}

package instructions;

import machine.MachineState;

import org.apache.log4j.Logger;

/**
 * Appears to implement various indirect loads.
 */
public class InstrLD extends Instr {
	
	private static final Logger logger = Logger.getLogger(InstrLD.class);
	private final int reg;
	private final char pointer;
	private int q = -1;
	private InstrLDType type;
	public InstrLD(MachineState machine,int rd, char pointer,InstrLDType type) throws MalformedInstruction {
		super(machine);
		if(rd < 0 || rd > 31)
		{
			throw new MalformedInstruction("Invalid register number rd("+rd+")");
		}
		if(!(pointer == 'X' || pointer == 'Y' || pointer == 'Z'))
		{
			throw new MalformedInstruction("Invalid pointer register " + pointer);
		}
		this.reg = rd;
		this.pointer = pointer;
		this.type = type;
	}

	public InstrLD(MachineState machine, int rd, char pointer, int q) throws MalformedInstruction
	{
		this(machine, rd, pointer, null);
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
	 * Implements loading a value from memory to a register.  Only implements the default condition atm.
	 */
	public void execute() throws RuntimeError {
		int baseReg = getBaseRegister();
		logger.debug("baseReg = "+baseReg);
		int address = this.machine.getRegister(baseReg+1) & 0xFF;
		logger.debug("address after this.machine.getRegister(baseReg+1) & 0xFF;= "+address);
		address <<=8;
		logger.debug("address after address <<=8 = "+address);
		address = address + (this.machine.getRegister(baseReg) & 0xFF);
		logger.debug("address = "+address);

		Integer value = null;
		
		if(type != null)
		{
			switch(type)
			{
				case ADDI: 
					value = this.machine.getMemory(address);
					address++;
					break;
				case MINUSI:
					address--;
					value = this.machine.getMemory(address);
					break;
				case DEFAULT:
					value = this.machine.getMemory(address);
					break;
			}	
		}
		else//This is the displacement (q) case.
		{
			address+=q;
			logger.debug("q = "+q+", address = "+address);
			value = this.machine.getMemory(address);			
			logger.debug("value = "+value);
		}
		
		
		this.event.setPC(this.machine.getPC()+1);

		if(value == null)
		{
			throw new RuntimeError("Invalid address access 0x" + Integer.toHexString(address));
		}
		this.event.setRd(this.reg, value);
		//TODO need to update the UpdateEvent class to include an addition update field for the X Y and Z registers.

        this.machine.noteLoad();

		logger.debug("Indirect load from "+this.pointer 
		             +"+"+this.q+" to r"+this.reg);

	}

	@Override
	public String toString() {
	    if (type==null) {
	        return "LDD r"+this.reg+", "+this.pointer +"+"+this.q;
	    } else {
		    return "LD";
		}
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

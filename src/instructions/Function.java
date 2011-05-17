package instructions;

import java.util.ArrayList;

public class Function {
	private final ArrayList<Instr> instructions;
	private final String name;
	public Function(String name)
	{
		this.name = name;
		instructions = new ArrayList<Instr>();
	}
	
	/**
	 * Returns in String format the name of the function.
	 * @return the String representation of the function.
	 */
	public String getName()
	{
		return name;
	}
	
	/**
	 * Adds an instruction to the current function.
	 * @param instruction The instruction to add to the function.
	 */
	public void addInstr(Instr instruction)
	{
		instructions.add(instruction);
	}
	
	/**
	 * 
	 * @return
	 */
	public ArrayList<Instr> getInstructions()
	{
		return instructions;
	}
}

package instructions;

import java.util.ArrayList;
import java.util.List;

public class ATmegaProgram
{
	final private List<Function> functions;
	private Function currentFunction;
	
	public ATmegaProgram()
    {
		functions = new ArrayList<Function>();
		currentFunction = new Function("main");//this is the first method that will be defined.
    }
	
    /**
     * Creates a new function that will be added to the program.  The first function that is created is the main method which does not need to be created by a call to this function.
     * This is due to the fact that the label for main is inside of the headerInfo area and will not be hit in the rest of the parsing.
     * @param name The name of the function currently being defined.
     */
    public void beginFunction(String name)
    {
    	functions.add(currentFunction);
    	currentFunction = new Function(name);
    }
    /**
     * Adds an instruction to the current function that is being defined.
     * @param instruction
     */
    public void addInstr(Instr instruction)
    {
    	currentFunction.addInstr(instruction);
    }
    
    /**
     * Returns the list of functions that have been generated by the calls to the API.  This should not be used when parsing through the assembly file.
     * @return
     */
    public List<Function> getFunctions()
    {
    	//make sure the current function is inside of the list before returning it.  It should be the very last item in the list, just compare the references.
    	if(functions.size() == 0 || functions.get(functions.size()-1) != currentFunction)//check that the size is zero first, if it is add it regardless.
    	{
    		functions.add(currentFunction);
    	}
    	return functions;
    }	
}

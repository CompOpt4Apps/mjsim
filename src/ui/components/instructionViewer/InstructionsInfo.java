package ui.components.instructionViewer;
import java.util.List;


public class InstructionsInfo {
	final private String desrcription;
	final private List<InstrInfo> instrs;
	
	public InstructionsInfo(String description, List<InstrInfo> instrs)
	{
		this.desrcription = description.trim();
		this.instrs = instrs;
	}
	
	public String getDescription()
	{
		return desrcription;
	}
	
	public List<InstrInfo> getInstrs()
	{
		return instrs;
	}
	
	public String toString()
	{
		StringBuilder retString = new StringBuilder();
		
		retString.append("======Instructions======\n");
		retString.append("Description:\n");
		retString.append(desrcription+"\n");
		retString.append("Instrs:\n");
		for(InstrInfo instr: instrs)
		{
			retString.append(instr.toString() + "\n");
		}
		return retString.toString();
		
	}
	
}

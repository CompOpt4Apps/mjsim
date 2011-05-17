package ui.components;

import java.net.URL;

import org.apache.pivot.util.concurrent.TaskExecutionException;
import org.apache.pivot.wtk.media.Image;

public class PCInstruction {

	private String instruction;
	private int pcValue;
	private Image programCounter;
	private Image breakPoint;
	
	public PCInstruction(String instruction, int pcValue)
	{
		this.instruction = instruction;
		this.pcValue = pcValue;
	}
	
	public Image getProgramCounter() {
		return programCounter;
	}

	public Image getBreakPoint()
	{
		return breakPoint;
	}
	
	public void setBreakPoint(Image breakPoint)
	{
		this.breakPoint = breakPoint;
	}

	public void setBreakPoint(URL breakPoint) 
	{      
		try {
		setBreakPoint(Image.load(breakPoint));
		} catch (TaskExecutionException exception) {
			throw new IllegalArgumentException(exception);
		}
	}
	
	public void setProgramCounter(Image programCounter)
	{
		this.programCounter = programCounter;
	}

	public void setProgramCounter(URL programCounter) 
	{      
		try {
		setProgramCounter(Image.load(programCounter));
		} catch (TaskExecutionException exception) {
			throw new IllegalArgumentException(exception);
		}
	}
	
	public String getInstruction()
	{
		return instruction;
	}
	
	public int getPcValue()
	{
		return pcValue;
	}

	public void clearPCImage() {
		programCounter = null;
	}
	public void clearBreakPointImage() {
		breakPoint = null;
	}
}

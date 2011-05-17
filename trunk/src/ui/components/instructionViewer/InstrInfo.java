package ui.components.instructionViewer;

public class InstrInfo {

	private String name;
	private String description;
	private String shorthand= null;
	private String notes = null;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getShorthand() {
		return shorthand;
	}
	public void setShorthand(String shorthand) {
		this.shorthand = shorthand;
	}
	public String getNotes() {
		return notes;
	}
	public void setNotes(String notes) {
		this.notes = notes;
	}
	
	public String toString()
	{
		return "Name: " + getName() + " || Description: " + getDescription();
	}
}

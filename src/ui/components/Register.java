package ui.components;

public class Register {

	private String register = null;
	private String value = null;
	
	public Register()
	{	
	}
	
	public Register(String register, String value)
	{	
		this.register = register;
		this.value = value;
	}
	
	public String getRegister() {
		return register;
	}
	public void setRegister(String register) {
		this.register = register;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
}

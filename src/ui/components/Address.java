package ui.components;

import java.net.URL;

import org.apache.pivot.util.concurrent.TaskExecutionException;
import org.apache.pivot.wtk.media.Image;

public class Address {
	private Image stackPointer = null;
	private String address = null;
	private int value = 0;

	public Address()
	{	
	}
	
	public Address(String address, int value)
	{
		this.address = address;
		this.value = value;
	}
	
	public Image getStackPointer() {
		return stackPointer;
	}

	public void setStackPointer(Image stackPointer)
	{
		this.stackPointer = stackPointer;
	}

	public void setStackPointer(URL stackPointer) 
	{      
		try {
		setStackPointer(Image.load(stackPointer));
		} catch (TaskExecutionException exception) {
			throw new IllegalArgumentException(exception);
		}
	}

	public String getAddress() {
		//I don't like this but it will format the text in hex.
		
		return "0x"+Integer.toHexString(Integer.parseInt(address));
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getValue() {
		return value;
	}
	public void setValue(int value) {
		this.value = value;
	}

	public void clearImage() {
		stackPointer = null;
		
	}

}

package ui.components;

import java.net.URL;

import machine.MachineState;
import machine.MachineUpdate;
import machine.MachineUpdateData;

import org.apache.log4j.Logger;
import org.apache.log4j.chainsaw.Main;
import org.apache.pivot.beans.BXML;
import org.apache.pivot.beans.Bindable;
import org.apache.pivot.collections.HashMap;
import org.apache.pivot.collections.List;
import org.apache.pivot.collections.Map;
import org.apache.pivot.util.Resources;
import org.apache.pivot.wtk.Action;
import org.apache.pivot.wtk.Component;
import org.apache.pivot.wtk.FileBrowserSheet;
import org.apache.pivot.wtk.TableView;
import org.apache.pivot.wtk.Window;

public class BaseWindow extends Window implements Bindable,MachineUpdate {
	
	private static final Logger logger = Logger.getLogger(BaseWindow.class);
	
	@BXML private FileBrowserSheet fileBrowserSheet;
	@BXML private List<Register> registerTableData;
	@BXML private List<Address> stackTableData;
	@BXML private List<Address> heapTableData;
	private int stackPointer;
	private MachineState machine = null;
	private URL stackImage = Main.class.getClassLoader().getResource("ui/images/sp.png");
	
	@Override
	public void initialize(Map<String, Object> arg0, URL arg1, Resources arg2) {
		logger.info("Initializing window...");		
		
		//get the machine state and then register this class with it.
		machine = MachineState.createMachine("AVRMachine");
		for(int i = 0; i < 32;i++)
		{
			registerTableData.add(new Register(Integer.toString(i),"0"));
		}
		
		machine.addUpdate(this);
	}
	
	public BaseWindow()
	{
		Action.getNamedActions().put("fileOpen", new Action()
		{
			public void perform(Component source)
			{
				logger.info("Opening a file broswer.");
				fileBrowserSheet.open(BaseWindow.this);
			}
		});
		
		Action.getNamedActions().put("exit", new Action(){
			public void perform(Component source)
			{
				logger.info("Performing Shutdown sequence...");
				System.exit(0);
			}
		});
	}

	@Override
	public void update(MachineUpdateData data) {
		java.util.Map<Integer,Integer> regUpdates = data.getRegUpdates();
		
		for(Integer reg:regUpdates.keySet())
		{
			logger.debug("Updating register: " + reg);
			((Register)registerTableData.get(reg)).setValue(Integer.toString(regUpdates.get(reg)));
		}
		
		java.util.Map<Integer,Integer> stackUpdates = data.getStackUpdates();
		
		for(Integer stackMem: stackUpdates.keySet())
		{
			Address add = getStackAddress(stackMem);
			if(add == null)
			{
				//will it always be first?
				stackTableData.insert(new Address(stackMem.toString(),stackUpdates.get(stackMem)) , 0);
			}
			else
			{
				add.setValue(stackUpdates.get(stackMem));
			}
		}
		if(data.getStackPointer() > 0)
		{
			stackPointer = data.getStackPointer();
			if(getStackAddress(stackPointer)!= null)
			{
				getStackAddress(stackPointer).setStackPointer(stackImage);
			}
			else
			{
				Address newAddr = new Address();
				newAddr.setAddress(Integer.toString(stackPointer));
				newAddr.setStackPointer(stackImage);
				stackTableData.insert(newAddr,0);
			}
		}

		this.repaint(true);
	}
	
	private Address getStackAddress(int address)
	{
		Address ret = null;
		for(Address add:stackTableData)
		{
			if(add.getAddress().trim().equals(Integer.toString(address)))
			{
				ret = add;
				break;
			}
		}
		return ret;
	}
}

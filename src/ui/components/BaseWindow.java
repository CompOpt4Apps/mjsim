package ui.components;

import java.net.URL;

import machine.MachineState;
import machine.MachineUpdate;
import machine.MachineUpdateData;

import org.apache.log4j.Logger;
import org.apache.log4j.chainsaw.Main;
import org.apache.pivot.beans.BXML;
import org.apache.pivot.beans.Bindable;
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
	private TableView stackPane;
	private TableView heapPane;
	private List<Address> stackSpace;
	private List<Address> heapSpace;
	private int stackPointer;
	private MachineState machine = null;
	private URL stackImage = Main.class.getClassLoader().getResource("ui/images/sp.png");
	
	@SuppressWarnings("unchecked")
	@Override
	public void initialize(Map<String, Object> arg0, URL arg1, Resources arg2) {
		logger.info("Initializing window.");
		stackPane = (TableView) arg0.get("stackTable");
		heapPane = (TableView) arg0.get("heapTable");

		stackSpace = (List<Address>)stackPane.getTableData();
		heapSpace = (List<Address>)heapPane.getTableData();

		//get the machine state and then register this class with it.
		machine = MachineState.createMachine("AVRMachine");
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
			//update the registers when I have them set up in the gui.
		}
		
		java.util.Map<Integer,Integer> stackUpdates = data.getStackUpdates();
		
		for(Integer stackMem: stackUpdates.keySet())
		{
			Address add = getStackAddress(stackMem);
			if(add == null)
			{
				stackSpace.add(new Address(Integer.toString(stackMem),stackUpdates.get(stackMem)));
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
				stackSpace.insert(newAddr,0);
			}
		}

	}
	
	private Address getStackAddress(int address)
	{
		Address ret = null;
		for(Address add: stackSpace)
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

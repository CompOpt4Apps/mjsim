package ui.components;

import java.net.URL;

import org.apache.log4j.Logger;
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

public class BaseWindow extends Window implements Bindable {
	
	private static final Logger logger = Logger.getLogger(BaseWindow.class);
	
	@BXML private FileBrowserSheet fileBrowserSheet;
	private TableView stackPane;
	private TableView heapPane;
	
	@SuppressWarnings("unchecked")
	@Override
	public void initialize(Map<String, Object> arg0, URL arg1, Resources arg2) {
		logger.info("Initializing window.");
		stackPane = (TableView) arg0.get("stackTable");
		heapPane = (TableView) arg0.get("heapTable");
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("address", "0x3");
		map.put("value","23");
		((List<HashMap<String,String>>)(stackPane.getTableData())).add(map);
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

}

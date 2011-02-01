package ui.components;

import java.net.URL;

import org.apache.log4j.Logger;
import org.apache.pivot.beans.Bindable;
import org.apache.pivot.collections.Map;
import org.apache.pivot.util.Resources;
import org.apache.pivot.wtk.TableView;
import org.apache.pivot.wtk.Window;

public class BaseWindow extends Window implements Bindable {
	
	private static final Logger logger = Logger.getLogger(BaseWindow.class);
	
	private TableView stackPane;
	private TableView heapPane;
	@Override
	public void initialize(Map<String, Object> arg0, URL arg1, Resources arg2) {
		logger.info("Initializing window.");
		stackPane = (TableView) arg0.get("stackTable");
		heapPane = (TableView) arg0.get("heapTable");
		}

}

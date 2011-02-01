package ui;

import org.apache.log4j.Logger;
import org.apache.pivot.beans.*;
import org.apache.pivot.collections.Map;
import org.apache.pivot.wtk.Application;
import org.apache.pivot.wtk.Display;
import org.apache.pivot.wtk.Window;

public class GUIBase implements Application {
	private Window window = null;
	
	private static final Logger logger = Logger.getLogger(GUIBase.class);
	@Override
	public void resume() throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean shutdown(boolean arg0) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void startup(Display arg0, Map<String, String> arg1)
			throws Exception {
		logger.info("Executing startup code in guibase.");
		BXMLSerializer bxmlSerializer = new BXMLSerializer();
		window = (Window) bxmlSerializer.readObject(GUIBase.class,"avrSim.bxml");
		window.open(arg0);
	}

	@Override
	public void suspend() throws Exception {
		// TODO Auto-generated method stub
		
	}

}

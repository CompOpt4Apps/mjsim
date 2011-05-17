package ui;

import java.net.URL;

import org.apache.log4j.Logger;
import org.apache.pivot.beans.BXMLSerializer;
import org.apache.pivot.collections.Map;
import org.apache.pivot.wtk.Application;
import org.apache.pivot.wtk.Display;

import ui.components.BaseWindow;


public class GUIBase implements Application {
	private BaseWindow window = null;
	
	private static final Logger logger = Logger.getLogger(GUIBase.class);
	@Override
	public void resume() throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean shutdown(boolean arg0) throws Exception {
		if(window != null)
		{
			window.close();
		}
		return false;
	}

	@Override
	public void startup(Display arg0, Map<String, String> arg1)
			throws Exception {
		logger.info("Executing startup code in guibase.");
		BXMLSerializer bxmlSerializer = new BXMLSerializer();
		bxmlSerializer.getNamespace().put("application", this);
		URL file = Main.class.getClassLoader().getResource(
		"ui/components/avrSim.bxml");
		if(file == null)
		{
			logger.fatal("Could not find avrSim.bxml");
			System.exit(-1);
		}
		window = (BaseWindow) bxmlSerializer.readObject(file);
		window.open(arg0);
	}

	@Override
	public void suspend() throws Exception {
		// TODO Auto-generated method stub
		
	}

}

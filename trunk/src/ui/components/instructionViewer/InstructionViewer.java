package ui.components.instructionViewer;

import java.net.URL;

import org.apache.log4j.Logger;
import org.apache.pivot.beans.Bindable;
import org.apache.pivot.collections.Map;
import org.apache.pivot.util.Resources;
import org.apache.pivot.wtk.Dialog;
import org.apache.pivot.wtk.Label;
import org.apache.pivot.wtk.TablePane;
	
public class InstructionViewer extends Dialog implements Bindable {

	private static final Logger logger = Logger.getLogger(InstructionViewer.class);
	private TablePane tableInfo;
	private Label descriptionTag;
	public void initialize(Map<String, Object> arg0, URL arg1, Resources arg2) {
		logger.info("Initializing the Instruction Viewer...");
		tableInfo = (TablePane) arg0.get("instrInfoTable");
		descriptionTag = (Label) arg0.get("descriptionTag");
		final TablePane.RowSequence rows = tableInfo.getRows();
		InstructionsInfo info = null;
		try {
			info = InstructionsParser.createInstructionsInfo("ui/components/instructionViewer/instructionInfo.xml");
		} catch (Exception e) {
			logger.fatal("Failed to parse Intruction Information",e);
		}

		if(info == null)
		{
			descriptionTag.setText("Could not parse/find instruction information.");
		}
		else
		{
			descriptionTag.setText(info.getDescription());
			TablePane.Row newRow = new TablePane.Row();
			newRow.add(new Label("Instruction"));
			newRow.add(new Label("Description"));
			newRow.add(new Label("Special Notes"));
			rows.add(newRow);
			for(InstrInfo instrInfo: info.getInstrs())
			{
				newRow = new TablePane.Row();
				newRow.add(new Label(instrInfo.getName()));
				newRow.add(new Label(instrInfo.getDescription()));
				newRow.add(new Label(instrInfo.getNotes()));
				rows.add(newRow);
			}
		}
	}
}

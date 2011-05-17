
package ui.components.instructionViewer;

import java.io.IOException;

import java.net.URL;
import java.util.ArrayList;

import javax.xml.XMLConstants;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.stream.StreamSource;
import javax.xml.validation.SchemaFactory;

import org.apache.log4j.Logger;
import org.apache.log4j.chainsaw.Main;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.ErrorHandler;
import org.xml.sax.SAXException;
import org.xml.sax.SAXParseException;


public class InstructionsParser {

	private final static Logger logger = Logger.getLogger(InstructionsParser.class);
	public static InstructionsInfo createInstructionsInfo(String instructionXmlFile) throws ParserConfigurationException, SAXException, IOException
	{
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		factory.setValidating(true);
		SchemaFactory schemaFactory = SchemaFactory.newInstance(XMLConstants.W3C_XML_SCHEMA_NS_URI);
		URL schemaFile = Main.class.getClassLoader().getResource("ui/components/instructionViewer/dtd/instructions.xsd");
		
		schemaFactory.newSchema(new StreamSource(schemaFile.openStream()));

		DocumentBuilder builder = factory.newDocumentBuilder();
		builder.setErrorHandler(new ErrorHandler() {
			
			@Override
			public void warning(SAXParseException exception) throws SAXException {
				logger.info("XML parsing warning for instructions file. (" + exception.getColumnNumber() + ", " + exception.getLineNumber() + ")",exception);
			}
			
			@Override
			public void fatalError(SAXParseException exception) throws SAXException {
				logger.info("XML parsing fatal error for instructions file.(" + exception.getColumnNumber() + ", " + exception.getLineNumber() + ")",exception);
			}
			
			@Override
			public void error(SAXParseException exception) throws SAXException {
				logger.info("XML parsing error for instructions file. (" + exception.getColumnNumber() + ", " + exception.getLineNumber() + ")",exception);
				
			}
		});
		
		URL file = Main.class.getClassLoader().getResource(instructionXmlFile);
		Document document = builder.parse(file.openStream());
		
		String description = document.getElementsByTagName("description").item(0).getTextContent();
		Node node = document.getElementsByTagName("instructions").item(0);

		NodeList nodeList = node.getChildNodes();
		ArrayList<InstrInfo> instrs = new ArrayList<InstrInfo>();
		for(int i= 0; i < nodeList.getLength();i++)
		{
			Node tempNode = nodeList.item(i);
			if(tempNode.getNodeType() == Node.ELEMENT_NODE)
			{
				instrs.add(createInstrInfo(tempNode));
			}
		}
		return new InstructionsInfo(description, instrs);
	}
	
	private static InstrInfo createInstrInfo(Node node)
	{
		if(!node.getNodeName().equals("instr"))
		{
			return null;
		}
		InstrInfo info = new InstrInfo();
		NodeList nodeList = node.getChildNodes();
		
		for(int i = 0; i < nodeList.getLength();i++)
		{
			Node tempNode = nodeList.item(i);
			if(tempNode.getNodeType() == Node.ELEMENT_NODE)
			{
				if(tempNode.getNodeName().equalsIgnoreCase("name"))
				{
					info.setName(tempNode.getTextContent());
				}
				else if(tempNode.getNodeName().equalsIgnoreCase("description"))
				{
					info.setDescription(tempNode.getTextContent());
				}
				else if(tempNode.getNodeName().equalsIgnoreCase("notes"))
				{
					info.setNotes(tempNode.getTextContent());
				}
				else if(tempNode.getNodeName().equalsIgnoreCase("shorthand"))
				{
					info.setShorthand(tempNode.getTextContent());
				}		
			}
		}
		return info;
	}
}

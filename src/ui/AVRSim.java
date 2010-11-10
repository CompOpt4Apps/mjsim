package ui;

import instructions.ATmegaProgram;
import instructions.RuntimeError;

import java.io.File;

import org.apache.log4j.Logger;

import parse.ReadAssem;

import machine.MachineState;

public class AVRSim {

	private static final Logger logger = Logger.getLogger(AVRSim.class);
	private File assemFile = null;
	private boolean batch= false;
	private MachineState machine;
	private ATmegaProgram program = null;

	public AVRSim(File assemFile,boolean batch)
	{
		this.assemFile = assemFile;
		this.batch = batch;
	}

	public void run()
	{
		logger.info("Simulator is starting.");
		try
		{
			loadAssemFile();
			if(!batch)
			{
				gui();
			}
			else //We are in batch mode, run to the end of the program execution.
			{
				runAssem();
			}
		}catch(Exception e)
		{
			logger.fatal("Encountered fatal error while parsing...",e);
		}
	}

	public void loadAssemFile() throws Exception
	{
		//check to make sure that the assem file is not null.
		//If it is, just return.
		logger.info("Loading the assembly file.");
		initMachine();
		if(assemFile == null)
		{
			return;
		}
		ReadAssem assemLoader = new ReadAssem(assemFile,machine);
		program = assemLoader.getProgram();
		machine.readAtmegaProgram(program);//This will copy the program into the machine program space.
	}

	/**
	 * Only run this is you are not in batch mode.  If in batch mode, just run the Assem.
	 */
	public void gui()
	{
		logger.info("Starting the simulator in gui mode.");
	}

	/**
	 * Will run the assembly to the end of completion.
	 *
	 */
	public void runAssem()
	{
		logger.info("Beginning the batch run.");
		try
		{
			while(machine.hasNextInstr())
			{
				machine.executeInstruction();
			}
		}
		catch(RuntimeError e)
		{
			logger.fatal("Encountered error during runtime.",e);
		}
	}

	public void initMachine()
	{
		this.machine = new MachineState("AVR");
	}
}

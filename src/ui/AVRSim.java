package ui;

import instructions.ATmegaProgram;
import instructions.RuntimeError;

import java.io.File;

import machine.MachineState;

import org.apache.log4j.Logger;
import org.apache.pivot.wtk.DesktopApplicationContext;

import parse.ReadAssem;

public class AVRSim {

	private static final Logger logger = Logger.getLogger(AVRSim.class);
	private File assemFile = null;
	private boolean batch = false;
	private MachineState machine;
	private ATmegaProgram program = null;
	private Integer jumps = null;

	public AVRSim(File assemFile, boolean batch) {
		this.assemFile = assemFile;
		this.batch = batch;
	}

	public AVRSim(File assemFile, Integer jumps) {
		this(assemFile, true);
		this.jumps = jumps;
	}

	/**
	 * Only run this is you are not in batch mode. If in batch mode, just run
	 * the Assem.
	 */
	public void gui() {
		logger.info("Starting the simulator in gui mode.");
		DesktopApplicationContext.main(GUIBase.class,new String[0]);
	}

	public void initMachine() {
		if (jumps == null) {
			this.machine = new MachineState("AVR", batch);
		} else {
			logger.debug("Max jumps:" + jumps);
			this.machine = new MachineState("AVR", jumps);
		}

	}

	public void loadAssemFile() throws Exception {
		// check to make sure that the assem file is not null.
		// If it is, just return.
		logger.info("Loading the assembly file.");
		initMachine();
		if (assemFile == null) {
			return;
		}
		final ReadAssem assemLoader = new ReadAssem(assemFile, machine);
		program = assemLoader.getProgram();
		machine.readAtmegaProgram(program);// This will copy the program into
											// the machine program space.
	}

	public void run() {
		logger.info("Simulator is starting.");
		try {
			loadAssemFile();
			if (!batch) {
				gui();
			} else // We are in batch mode, run to the end of the program
					// execution.
			{
				runAssem();
			}
		} catch (final Exception e) {
			logger.fatal("Encountered fatal error...", e);
		}
	}

	/**
	 * Will run the assembly to the end of completion.
	 * 
	 */
	public void runAssem() {
		logger.info("Beginning the batch run.");
		try {
			while (machine.hasNextInstr()) {
				machine.executeInstruction();
			}
		} catch (final RuntimeError e) {
			logger.fatal("Encountered error during runtime.", e);
		}
	}
}

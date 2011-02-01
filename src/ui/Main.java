package ui;

import java.io.File;

import org.apache.commons.cli.CommandLine;
import org.apache.commons.cli.CommandLineParser;
import org.apache.commons.cli.HelpFormatter;
import org.apache.commons.cli.Options;
import org.apache.commons.cli.ParseException;
import org.apache.commons.cli.PosixParser;
import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;

public class Main {

	// Set up the logger that I will use throughout the program.
	private static final Logger logger = Logger.getLogger(Main.class);

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		String assemblyFile = null;
		boolean batch = false;
		Integer jumps = null;
		// Configure the logger.
		// This is the only way that I was able to find to get the
		// log.conf file from the jar file instead of searching inside of
		// the directory structure.
		PropertyConfigurator.configure(Main.class.getClassLoader().getResource(
				"log.conf"));

		logger.info("Initializing the Command line Parser.");
		final CommandLineParser parser = new PosixParser();

		// Need 2 different arguments both of which are optional
		final Options options = new Options();
		options.addOption("f", true, "initial AVR assembly file to read in");
		options.addOption("b", false, "run in batch mode");
		options.addOption("j", true, "number of jumps allowed on a label");

		logger.info("Processing Command Line Arguments.");
		try {
			final CommandLine line = parser.parse(options, args);

			if (line.hasOption('f')) {
				assemblyFile = line.getOptionValue('f');
				logger.info("Initial assembly file: " + assemblyFile + ".");
			}
			if (line.hasOption('b')) {
				batch = true;
				logger.info("Running in batch mode.");
			}
			if (line.hasOption('j')) {
				try {
					jumps = Integer.parseInt(line.getOptionValue('j'));
				} catch (final NumberFormatException e) {
					logger.fatal(
							"Invalid commandline option: j takes an integer as an argument.",
							e);
					System.exit(1);
				}
			}
			if (!batch && (jumps != null)) {
				System.err
						.println("Invalid commandline combination: j can only be set if j is also set.");
				System.exit(1);
			}

		} catch (final ParseException e) {
			logger.fatal("Unexpected Parse Exception", e);
			final HelpFormatter formatter = new HelpFormatter();
			formatter.printHelp("AVRSim", options);
			System.exit(1);
		}

		// Check to see if a file was passed in, and if so check it to make sure
		// it exists. If it does not exist, error out.
		File assemFile = null;
		if (assemblyFile != null) {
			assemFile = new File(assemblyFile);
			if (!assemFile.exists()) {
				logger.fatal("Assembly File passed in does not exist.");
				System.err.println("Assembly File passed in does not exist.");
				System.exit(1);
			}
		} else if (batch)// This means that the assem is null and we are in
							// batch mode, error out.
		{
			logger.fatal("Cannot be in batch mode without an assembly file.");
			System.err
					.println("Cannot be in batch mode without an assembly file.");
			System.exit(1);
		}
		AVRSim simulator = null;
		if (jumps == null) {
			simulator = new AVRSim(assemFile, batch);
		} else {
			simulator = new AVRSim(assemFile, jumps);
		}
		simulator.run(args);
	}
}

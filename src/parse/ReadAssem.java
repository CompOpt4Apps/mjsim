package parse;

import instructions.ATmegaProgram;
import instructions.Instr;
import instructions.FuncStart;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.util.List;

import machine.MachineState;

import org.apache.log4j.Logger;

public class ReadAssem {
	private static final Logger logger = Logger.getLogger(ReadAssem.class);
	private final File assemFile;
	private final ATmegaProgram program;
	private final MachineState machine;

	public ReadAssem(File assemFile, MachineState machine) {
		this.assemFile = assemFile;
		this.program = new ATmegaProgram();
		this.machine = machine;
	}

	public ATmegaProgram getProgram() throws Exception {
		logger.info("Calling into the parser to fill out the ATmegaProgram object.");
		try {
			final Yylex lexer = new Yylex(new FileReader(assemFile));
			final sim_inst p = new sim_inst(lexer, machine);// added a new
															// constructor.
			// final List<Instr> instructions = (List<Instr>)
			// p.debug_parse().value;// development
			// print
			final List<Instr> instructions = (List<Instr>) p.parse().value;
			logger.info("Filling out the ATmegaProgram now.");
			for (final Instr inst : instructions) {
				if (inst == null) {
					continue;
				}
				if (inst instanceof FuncStart) {
				    program.beginFunction(((FuncStart)inst).getLabel());
				} else {
				    program.addInstr(inst);
				}
			}
		} catch (final FileNotFoundException e) {
			System.out
					.println("An exception occured that should never happen: "
							+ e);
		}
		return program;
		// return TestPrograms.createFunctionTest(machine);
	}
}

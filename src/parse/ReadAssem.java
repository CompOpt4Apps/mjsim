package parse;

import instructions.ATmegaProgram;
import instructions.Instr;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.List;

import machine.MachineState;

import org.apache.log4j.Logger;

public class ReadAssem {
	private static final Logger logger = Logger.getLogger(ReadAssem.class);
	private final File assemFile;
	private final ATmegaProgram program;
	private final MachineState machine;
	public ReadAssem(File assemFile,MachineState machine)
	{
		this.assemFile = assemFile;
		this.program = new ATmegaProgram();
		this.machine = machine;
	}
	public ATmegaProgram getProgram() throws Exception {
		logger.info("Calling into the parser to fill out the ATmegaProgram object.");
		try	{
			Yylex lexer = new Yylex(new FileReader(assemFile));
			sim_inst p = new sim_inst(lexer,machine);//added a new constructor.
			//List<Instr> instructions =
            //(List<Instr>)p.debug_parse().value;//development print
			List<Instr> instructions = (List<Instr>)p.parse().value;
			logger.info("Filling out the ATmegaProgram now.");
			for(Instr inst : instructions)  {
                if(inst == null)
                {
                    continue;
                }
                program.addInstr(inst);
			}
		}	catch(FileNotFoundException e)	{
			System.out.println("An exception occured that should never happen: " + e);
		}
		return program;
//		return TestPrograms.createFunctionTest(machine);
	}
}

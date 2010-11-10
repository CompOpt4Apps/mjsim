package parse;

import org.apache.log4j.Logger;

import machine.MachineState;
import instructions.*;

public class TestPrograms {
	private static final Logger logger = Logger.getLogger(TestPrograms.class);

	static ATmegaProgram createADDTest(MachineState machine)
	{
		logger.info("Creating the ADD test program");
		ATmegaProgram program = new ATmegaProgram();
		try
		{
			program.addInstr(new InstrLDI(machine, 16, 12));
			program.addInstr(new InstrLDI(machine, 17, 100));
			program.addInstr(new InstrAdd(machine, 16, 17));//the result in 16 should be 112
			program.addInstr(new InstrPush(machine,16));
			program.addInstr(new InstrPop(machine, 15));
			program.addInstr(new InstrLDI(machine, 20,250));
			program.addInstr(new InstrLDI(machine, 21,20));
			program.addInstr(new InstrAdd(machine, 20,21));//the result in 20 should be 14
			program.addInstr(new InstrLDI(machine, 23, 2));
			program.addInstr(new InstrLDI(machine, 24, 0));
			program.addInstr(new InstrAdc(machine,23,24));//the result in 23 should be 3 
		}catch(MalformedInstruction e)
		{
			logger.fatal("Bad instruction",e);
			System.exit(1);
		}
		return program;
	}
	
	static ATmegaProgram createStackTest(MachineState machine)
	{
		logger.info("Creating the Stack test program");
		ATmegaProgram program = new ATmegaProgram();
		try
		{
			program.addInstr(new InstrLDI(machine, 16, 12));
			program.addInstr(new InstrPush(machine, 16));
			program.addInstr(new InstrLDI(machine, 17, 100));
			program.addInstr(new InstrPush(machine,17));
			program.addInstr(new InstrAdd(machine, 16, 17));//the result in 16 should be 112
			program.addInstr(new InstrPush(machine,16));
			program.addInstr(new InstrPop(machine, 15));
			program.addInstr(new InstrPop(machine,14));
			program.addInstr(new InstrPop(machine,13));
		}catch(MalformedInstruction e)
		{
			logger.fatal("Bad instruction",e);
			System.exit(1);
		}
		return program;
	}
	
	static ATmegaProgram createLogicalOpTest(MachineState machine)
	{
		logger.info("Creating the LogicalOp test program");
		ATmegaProgram program = new ATmegaProgram();
		try
		{
			program.addInstr(new InstrLDI(machine, 16, 0xA5));
			program.addInstr(new InstrLDI(machine, 17, 0x31));
			program.addInstr(new InstrOr(machine, 16, 17)); //this should equal 0xA5
			program.addInstr(new InstrLDI(machine, 17, 0x4A));
			program.addInstr(new InstrEor(machine, 16, 17));//this should equal FE
			program.addInstr(new InstrNeg(machine,16));//this should equal 1
			program.addInstr(new InstrLDI(machine, 17, 0xFF));
			program.addInstr(new InstrAnd(machine,16,17));//this should equal 1

		}catch(MalformedInstruction e)
		{
			logger.fatal("Bad instruction",e);
			System.exit(1);
		}
		return program;
	}
	
	static ATmegaProgram createFunctionTest(MachineState machine)
	{
		logger.info("Creating the LogicalOp test program");
		ATmegaProgram program = new ATmegaProgram();
		try
		{
			program.addInstr(new InstrLDI(machine, 16, 0xA5));
			program.addInstr(new InstrPush(machine, 16));
			program.addInstr(new InstrCall(machine,"test"));
			program.addInstr(new InstrPop(machine,18));//this value should be 0xA5
			program.addInstr(new InstrLDI(machine, 24, 1));
			program.addInstr(new InstrLDI(machine,22,1));
			program.addInstr(new InstrLDI(machine,20,1));
			program.addInstr(new InstrCall(machine, "_Z6DrawPxhhh"));//testing to see if this will call the correct code.
			program.addInstr(new InstrRet(machine));
			program.beginFunction("test");
			program.addInstr(new InstrLDI(machine, 16, 12));
			program.addInstr(new InstrPush(machine,16));
			program.addInstr(new InstrPop(machine, 17));//this value should be 12
			program.addInstr(new InstrRet(machine));

		}catch(MalformedInstruction e)
		{
			logger.fatal("Bad instruction",e);
			System.exit(1);
		}
		return program;
	}	
}

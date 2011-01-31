package instructions;

import machine.MachineState;
import machine.UpdateEvent;

import org.apache.log4j.Logger;

/**
 * This is the base class for all the other Instructions.
 * @author Ryan Moore
 */
public abstract class Instr
{
	protected final MachineState machine;
	protected UpdateEvent event;
	/**
	 * Base constructor which should always be called.
	 * @param machine The Machine state that the instruction is operating on.
	 * @param actions The List of AVRActions that want to receive UpdateEvents when
	 * this instruction executes.
	 */
    public Instr(MachineState machine)
    {
    	this.machine = machine;
    }

    /**
     * All Instructions must have a different toString.
     */
    public abstract String toString();
    
    /**
     * This function will guarantee that a new update event is made
     * and that it is sent to all the AVRActions inside of the
     * actions list.
     * 
     * This is final because the behavior of this should never be changed.
     * @throws RuntimeError 
     */
    public final void executeWrapper() throws RuntimeError
    {
    	event = new UpdateEvent();
    	execute();
    	//for every action, send the updateEvent.
    	machine.updateState(event);
    }
    
    /**
     * The execute function defines how the instruction will interact with
     * the MachineState.  There are 2 requirements when using this method.  
     * The first is that is must update the MachineState that was passed in 
     * at construction (machine), and it must also update the UpdateEvent that
     * is implicitly constructed with each invocation of the execute function(event).
     * Any children of this class will not have to explicitly send the UpdateEvent, it
     * is controlled by the object and is done whenever the execute function is called.
     * 
     * NOTE: when filling out the instruction read from http://www.atmel.com/dyn/resources/prod_documents/doc0856.pdf
     * @throws RuntimeError 
     */
    public abstract void execute() throws RuntimeError;
}

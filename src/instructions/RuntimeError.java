package instructions;

public class RuntimeError extends Exception {
	/**
	 * 
	 */
	private static final long serialVersionUID = -5262880413037323655L;

	public RuntimeError(String message)
	{
		super(message);
	}
}

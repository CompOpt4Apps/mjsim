package machine;

public class Pair<T,Q> {
	private T right;
	private Q left;
	public Pair(Q left, T right)
	{
		this.right = right;
		this.left = left;
	}
	
	public T getRight()
	{
		return right;
	}
	
	public Q getLeft()
	{
		return left;
	}
}

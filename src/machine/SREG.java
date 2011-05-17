package machine;

/**
 * Status Register
 * The fields are all described in the AVR documentation.
 * @author Ryan Moore
 */
public class SREG implements Cloneable{
	boolean I;
	boolean T;
	boolean H;
	boolean S;
	boolean V;
	boolean N;
	boolean Z;
	boolean C;
	
	public SREG()
	{
		clear(); //init all the values to false;
	}
	
	public void clear()
	{
		I = T = H = S = V = N = Z = C = false;
	}

	public boolean isI() {
		return I;
	}

	public void setI(boolean i) {
		I = i;
	}

	public boolean isT() {
		return T;
	}

	public void setT(boolean t) {
		T = t;
	}

	public boolean isH() {
		return H;
	}

	public void setH(boolean h) {
		H = h;
	}

	public boolean isS() {
		return S;
	}

	public void setS(boolean s) {
		S = s;
	}

	public boolean isV() {
		return V;
	}

	public void setV(boolean v) {
		V = v;
	}

	public boolean isN() {
		return N;
	}

	public void setN(boolean n) {
		N = n;
	}

	public boolean isZ() {
		return Z;
	}

	public void setZ(boolean z) {
		Z = z;
	}

	public boolean isC() {
		return C;
	}

	public void setC(boolean c) {
		C = c;
	}
	
	public Object clone()
	{
		SREG reg = new SREG();
		if(this.isC())
		{
			reg.setC(true);
		}
		if(this.isI())
		{
			reg.setI(true);
		}
		if(this.isT())
		{
			reg.setT(true);
		}
		if(this.isH())
		{
			reg.setH(true);
		}
		if(this.isS())
		{
			reg.setS(true);
		}
		if(this.isV())
		{
			reg.setV(true);
		}
		if(this.isN())
		{
			reg.setN(true);
		}
		if(this.isZ())
		{
			reg.setZ(true);
		}
		return reg;
	}
	
	public String toString()
	{
		return "I:"+I +" T:"+T+" H:"+H+" S:"+S+" V:"+V+" N:"+N+" Z:"+Z+" C:"+C;
	}
}


import meggy.Meggy;

class PA5RecursiveMethodIntToByte {
    public static void main(String[] whatever){
        {   
            new Recurser().recurse((byte)1);
        }
    }
}

class Recurser {
    public void recurse(byte x)
    {
        if (x < (byte)3)
        {
            Meggy.setPixel((byte)5, (byte)2, Meggy.Color.GREEN);
            this.recurse2((byte)(x + (byte)1));
        }
        else
        {
            // do nothing
        }
    }
    
    public void recurse2(byte x)
    {
        if (x < (byte)3)
        {
            Meggy.setPixel((byte)5, (byte)2, Meggy.Color.GREEN);
            this.recurse3((byte)(x + (byte)1));
        }
        else
        {
            // do nothing
        }
    }
    
    public void recurse3(byte x)
    {
        if (x < (byte)3)
        {
            Meggy.setPixel((byte)5, (byte)2, Meggy.Color.GREEN);
        }
        else
        {
            // do nothing
        }
    }
}

import meggy.Meggy;

class varDecls {

    public static void main(String[] whatever){
        {
        new Cloud().rain((byte)3,(byte)7);
        if(new Cloud().inBounds(true)) {
          new Cloud().colors(5);
        } else {
          new Cloud().colors(3);
        }
        Meggy.setPixel((byte)3, (byte)0, Meggy.Color.YELLOW);

        }
    }
}

class Cloud {
    
    public void rain(byte x, byte y) {
        Meggy.setPixel(x, y, Meggy.Color.BLUE);
    }
    
    public boolean inBounds(boolean x) {
        return x;
    }

    public int colors(int x) {
        if(x == 5) {
          Meggy.setPixel((byte)x, (byte)x, Meggy.Color.DARK);
        } else {
          Meggy.setPixel((byte)x, (byte)x, Meggy.Color.WHITE);
        }
        return 5;
    }
}

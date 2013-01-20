package machine.functions;

import instructions.RuntimeError;

import org.apache.log4j.Logger;

import machine.MachineState;

import java.io.FileWriter;
import java.io.BufferedWriter;
import java.io.IOException;

public class FuncDisplaySlate extends Func {

    private static final Logger logger = Logger.getLogger(FuncDisplaySlate.class);
    private int picture_index;
    
    public FuncDisplaySlate(MachineState machine) {
        super(machine, "_Z12DisplaySlatev");
        picture_index = 0;
    }

    @Override
    public void exec() throws RuntimeError{
        if(machine == null)
        {
            throw new RuntimeError("The machine object is null and it should not be null");
        }
        for (int i = 0; i < 8; i++) {
            for (int n = 0; n < 8; n++) {
                logger.trace("DisplaySlate index (" + i +"," + n +")");
                // MMS, 2/27/11, at one point we were only printing out
                // the Setting pixel message if the pixel color had changed.
                // This doesn't match with Meggy.java and it makes it 
                // harder for the students to know what is going on.
                // Moved Setting pixel message to the FuncSetPix.java file.
                try {
                    if (!machine.getDisplaySlate(i, n).equals(
                            machine.getGridColor(i, n))) {
                        machine.setGridColor(i, n, 
                            machine.getDisplaySlate(i, n));
                        //save an image of what the Meggy looks like
                        java.io.File file = new java.io.File("mjsimPictures/");
                        if(! file.exists()){
                            boolean wasDirectoryMade = file.mkdir();
                            if(! wasDirectoryMade) {
                                System.out.println("Could not create mjsimPictures/");
                            }
                        }
        
                        FileWriter fstream 
                                = new FileWriter("mjsimPictures/" 
                                    + picture_index + ".ppm");
                        //increase the index so the next picture is saved with a unique name
                        picture_index++;
                        BufferedWriter out = new BufferedWriter(fstream);

                        StringBuffer buffer = new StringBuffer();
                        //header for PPM files. 
                        //"P3" means PPM, followed by width, height, and max value for a color
                        buffer.append("P3 88 88 255 \n");
        
                        //now we need to output what each pixel looks like
                        for (int j = 0; j < 8; j++)
                        {
                            buffer.append(printRow(j));
                        }
        
                        out.write(buffer.toString());
                        out.close();
                    }
                             
                } catch( IOException e) {
                    System.err.println("Issue creating mjsimPictures/*.ppm");
                }
            }
        }

    }

    //prints out a row on the meggy device. Rows are 8 meggy pixels long, which converts to 88 by 10 pixels in the image file
    private String printRow(int row)
    {
        StringBuffer buff = new StringBuffer();
        //need to iterate 10 times to make the row 10 pixels high
        for (int j = 0; j < 10; j++){
            //for each meggy pixel in this row
            for (int i = 0; i < 8; i++)
            {
                int[] r = colorToRGB(machine.getGridColor(row,i));
                //print out the color ten times, so the meggy pixel is 10 normal pixels long
                for (int k = 0; k < 10; k++)
                {
                    buff.append(r[0] + " " + r[1] + " " + r[2] + " ");
                }
                //this draws the grid lines
                buff.append("0 0 0 ");
            }
            //new line tells PPM to move onto next row
            buff.append('\n');
        }
        //draw another grid line
        for (int k = 0; k < 88; k++)
        {
            buff.append("0 0 0 ");
        }
        buff.append('\n');
        return buff.toString();
    }

    //this method converts the Meggy.Color strings to RGB
    private int[] colorToRGB(String color)
    {
        int[] r = new int[3];
        r[0] = 0;
        r[1] = 0;
        r[2] = 0;

        if (color.equals("DARK"))
        {
            r[0] = 50;
            r[1] = 50;
            r[2] = 50;
        }
        else if (color.equals("RED"))
        {
            r[0] = 255;
            r[1] = 0;
            r[2] = 0;
        }
        else if (color.equals("ORANGE"))
        {
            r[0] = 255;
            r[1] = 165;
            r[2] = 0;
        }
        else if (color.equals("YELLOW"))
        {
            r[0] = 255;
            r[1] = 255;
            r[2] = 0;
        }
        else if (color.equals("GREEN"))
        {
            r[0] = 0;
            r[1] = 255;
            r[2] = 0;
        }
        else if (color.equals("BLUE"))
        {
            r[0] = 0;
            r[1] = 0;
            r[2] = 255;
        }
        else if (color.equals("VIOLET"))
        {
            r[0] = 255;
            r[1] = 0;
            r[2] = 255;
        }
        else if (color.equals("WHITE"))
        {
            r[0] = 255;
            r[1] = 255;
            r[2] = 255;
        }
        return r;
    }
}

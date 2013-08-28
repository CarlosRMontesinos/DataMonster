import processing.serial.*;
import cc.arduino.*;

class DataMonster extends PApplet{

  private Arduino arduino;

  private static final int TOTAL_NUM_JOINTS = 5;
  private int[] pinNum;

  DataMonster(int iSerialPort)
  {
    pinNum = new int[TOTAL_NUM_JOINTS];
    
    // Setting up interface with Ardtruino board 
    arduino = new Arduino(this, Arduino.list()[iSerialPort], 57600);
    
    // Mapping joint to arduino pins / array[joint] = pin
    pinNum[0] = 3;
    pinNum[1] = 5;
    pinNum[2] = 6;
    pinNum[3] = 9;
    pinNum[4] = 10;
    
  }

  public void moveJoint(int jointNum, int valueSteps)
  {
    arduino.analogWrite(pinNum[jointNum], valueSteps);
  }
}




import processing.serial.*;
import cc.arduino.*;

class DataMonster extends PApplet {

  private Arduino m_oArduino;

  public static final int TOTAL_NUM_JOINTS = 5;

  // Arduino pin assignments
  public static final int JOINT_0_PIN = 3;
  public static final int JOINT_1_PIN = 5;
  public static final int JOINT_2_PIN = 6;
  public static final int JOINT_3_PIN = 9;
  public static final int JOINT_4_PIN = 10;

  private int[] pinNum;

  private Servo[] m_oJoinArray;

  DataMonster(int iSerialPort)
  {  
    // Setting up interface with Ardtruino board 
    print("Print List:");

    m_oArduino = new Arduino(this, Arduino.list()[iSerialPort], 57600);

    m_oJoinArray = new Servo[TOTAL_NUM_JOINTS] ;

    m_oJoinArray[0] = new Servo(JOINT_0_PIN, m_oArduino);
    m_oJoinArray[1] = new Servo(JOINT_1_PIN, m_oArduino);
    m_oJoinArray[2] = new Servo(JOINT_2_PIN, m_oArduino);
    m_oJoinArray[3] = new Servo(JOINT_3_PIN, m_oArduino);
    m_oJoinArray[4] = new Servo(JOINT_4_PIN, m_oArduino);

  }

  public void moveJoint(int _iJointNum, float _fAngle)
  {
    if ( 0 <= _iJointNum && _iJointNum <TOTAL_NUM_JOINTS )
      m_oJoinArray[_iJointNum].setAngle(_fAngle);
    else
      print("ERROR: joint #: " + _iJointNum + " doesn't exist");
  }
}



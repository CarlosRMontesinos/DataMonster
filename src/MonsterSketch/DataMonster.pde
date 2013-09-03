import processing.serial.*;
import cc.arduino.*;

class DataMonster extends PApplet {

  ///////////////////////////
  // Private Members
  ///////////////////////////
  private Arduino m_oArduino;

  private int[] pinNum;
  private Servo[] m_oJoinArray;
  private boolean m_bIsCalib;

  ///////////////////////////
  // Private Methods
  ///////////////////////////



  ///////////////////////////
  // Public Members
  ///////////////////////////
  public static final int TOTAL_NUM_JOINTS = 5;

  // Arduino pin assignments
  public static final int JOINT_0_PIN = 3;
  public static final int JOINT_1_PIN = 5;
  public static final int JOINT_2_PIN = 6;
  public static final int JOINT_3_PIN = 9;
  public static final int JOINT_4_PIN = 10;


  ///////////////////////////
  // Public methods / Interface
  ///////////////////////////
  DataMonster(int iSerialPort) {  
    // Setting up interface with Ardtruino board 
    print("Print List:");

    m_oArduino = new Arduino(this, Arduino.list()[iSerialPort], 57600);

    m_oJoinArray = new Servo[TOTAL_NUM_JOINTS] ;

    // Create joints for the robot
    m_oJoinArray[0] = new Servo(JOINT_0_PIN, m_oArduino);
    m_oJoinArray[1] = new Servo(JOINT_1_PIN, m_oArduino);
    m_oJoinArray[2] = new Servo(JOINT_2_PIN, m_oArduino);
    m_oJoinArray[3] = new Servo(JOINT_3_PIN, m_oArduino);
    m_oJoinArray[4] = new Servo(JOINT_4_PIN, m_oArduino);

    // Check robot calibration / WARNING: The calibration routine is still under develpment
    m_bIsCalib = true;

    // Calibrate the robot joints
    m_oJoinArray[0].setPwmLimits(65, 160);
    m_oJoinArray[1].setPwmLimits(113, 175);
    m_oJoinArray[2].setPwmLimits(113, 175);
    m_oJoinArray[3].setPwmLimits(55, 150);
    m_oJoinArray[4].setPwmLimits(55, 175);
  }

  boolean isCalibrated()
  {
    return  m_bIsCalib;
  }

  public boolean moveJoint(int _iJointNum, float _fAngle) {
    if ( 0 <= _iJointNum && _iJointNum <TOTAL_NUM_JOINTS ) {
      // Try to move the joint
      if ( m_oJoinArray[_iJointNum].setAngle(_fAngle) ) {
        print("ERROR: joint angle out of bounds.\n");
        return true;
      }
    }
    else {
      print("ERROR: joint #: " + _iJointNum + " doesn't exist\n");
      return true;
    }
    return false;
  }

  public boolean moveJoint(int _iJointNum, int _sSteps) {
    if ( 0 <= _iJointNum && _iJointNum <TOTAL_NUM_JOINTS ) {
      // Try to move the joint
      if ( m_oJoinArray[_iJointNum].setSteps(_sSteps) ) {
        print("ERROR: joint angle out of bounds.\n");
        return true;
      }
    }
    else {
      print("ERROR: joint #: " + _iJointNum + " doesn't exist\n");
      return true;
    }

    return false;
  }
}


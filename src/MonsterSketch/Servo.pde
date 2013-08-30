// Using Processing for Arduino library V2 found in:
// http://playground.arduino.cc/Interfacing/Processing
import cc.arduino.*;

class Servo {//extends PApplet{

  ///////////////////////////
  // Private Members
  ///////////////////////////
  private int m_iPinNum = 0;
  private Arduino m_oArduino;
  private static final int MIN_PWM = 0;
  private static final int MAX_PWM = 255;
  private static final int MIN_ANGLE = 0;
  private static final float MAX_ANGLE = PI;
  private float PWM_TO_RAD = 81.4873; // WARNING: This is an approximation assuming the mapping [0 - 255] <-> [-PI/2 - PI/2] 

  private float m_fPwmMin = 128;
  private float m_fPwmMax = 128;
  private float m_fPwmMidPoint = 128;

  private  float m_fAngMax = 0;
  private  float m_fAngMin = 0;

  ///////////////////////////
  // Private Methods
  ///////////////////////////

  // Set the PWM percent
  // [0 - 255] -> [0% - 100%] 
  private void setPwm(int _iPwmVal) {
    if ( MIN_PWM <= _iPwmVal && _iPwmVal <= MAX_PWM)
      m_oArduino.analogWrite(m_iPinNum, _iPwmVal);
    else
      m_oArduino.analogWrite(m_iPinNum, (int)(MAX_PWM/2));
  }

  ///////////////////////////
  // Public Members
  ///////////////////////////


  ///////////////////////////
  // Public methods / Interface
  ///////////////////////////

  // Constructor
  Servo(int _iPinNum, Arduino _oArduino) {
    
    // Setting up important values
    PWM_TO_RAD = MAX_PWM / MAX_ANGLE;
    
    m_oArduino = _oArduino;
    setPin(_iPinNum);
  }

  // Sets the physical pin number for
  // the Servo's PWM signal 
  void setPin(int _iPinNum) {
    m_iPinNum = _iPinNum;
    m_oArduino.pinMode(m_iPinNum, m_oArduino.OUTPUT);
  }

  // Returns the physical pin number
  // to which the servo is attached in
  // Arduino board
  int getPin() {
    return m_iPinNum;
  }

  // Arduino board
  void setPwmLimits(int _iMin, int _iMax) {
    m_fPwmMin = (float)(_iMin);
    m_fPwmMax = (float)(_iMax);
    m_fPwmMidPoint = (m_fPwmMax-m_fPwmMin)/2.0;

    // Calculate angle offset
    m_fAngMax = (m_fPwmMax-m_fPwmMidPoint)/PWM_TO_RAD;
    m_fAngMin = (m_fPwmMin-m_fPwmMidPoint)/PWM_TO_RAD;
    
    print("m_fAngMax: " + m_fAngMax + "\n");
    print("m_fAngMin: " + m_fAngMin + "\n");
  }

  // Set angle from 0 - 180 deg // THIS MAY CHANGE IN THE FUTURE
  // For now angle and PWM are a 1:1 mapping. We'll change this in a future calibration routine
  boolean setAngle(float _fAngle) {
    if ( m_fAngMin <= _fAngle && _fAngle <= m_fAngMax )  {
      int iPwnVal = (int)(_fAngle*PWM_TO_RAD);
      setPwm( iPwnVal );
    }
    else {
      return true;
    }

    return false;
  }    

  boolean setSteps(int _iSteps) {
    if ( m_fPwmMin <= _iSteps && _iSteps <= m_fPwmMax )  {
      setPwm( _iSteps );
    }
    else {
      return true;
    }

    return false;
  }

  // Invert PWM signal 

  // Calibrate

    // Smoothing function
}


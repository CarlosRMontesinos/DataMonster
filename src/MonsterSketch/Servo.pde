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
    private static final int MAX_ANGLE = 180;
        
    ///////////////////////////
    // Private Methods
    ///////////////////////////
   
    // Set the PWM percent
    // [0 - 255] -> [0% - 100%] 
    private void setPwm(int _iPwmVal){
      if( MIN_PWM <= _iPwmVal && _iPwmVal <= MAX_PWM)
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
      m_oArduino = _oArduino;
      setPin(_iPinNum);
    }
    
    // Sets the physical pin number for
    // the Servo's PWM signal 
    void setPin(int _iPinNum){
      m_iPinNum = _iPinNum;
    }
    
    // Returns the physical pin number
    // to which the servo is attached in
    // Arduino board
    int getPin(){
      return m_iPinNum;
    }

    // Set angle from 0 - 180 deg // THIS MAY CHANGE IN THE FUTURE
    // For now angle and PWM are a 1:1 mapping. We'll change this in a future calibration routine
    void setAngle(float _fAngle){
      if( MIN_ANGLE <= _fAngle && _fAngle <= MAX_ANGLE )
        setPwm( (int)(_fAngle) );
      else
        setPwm( (int)(MAX_ANGLE/2) );
    }    
    
    // Invert PWM signal 

    // Calibrate
    
    // Smoothing function


}

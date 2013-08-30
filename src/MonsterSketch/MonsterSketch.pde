////////////////////////////
// Global Variables
////////////////////////////
ServoVis myServoVis;
DataMonster myDataMonster;
int gi = 128;
boolean incDec = true;

float g_fAngle = 0;
float g_fOneDegInRad = 0;
int g_iJointSelect;
int g_iJointCounter;
long g_iJointUpdateTimerCounter;
static final int JOINT_UPDATE_TIMER_COUNTER_LIMIT = 10;

void setup() {
  size(800, 700);
  smooth();

  // Initialize global variables
  int iSerialPort = 1;
  //create a new DataMonster object that passes the port number
  myDataMonster = new DataMonster(iSerialPort);
  //create a new servo at location (X, Y) of upper left corner
  myServoVis = new ServoVis(100, 600);

  gi = 128;
  g_fAngle = 0;
  g_fOneDegInRad = TWO_PI/360;
  g_iJointSelect = 0; 
  g_iJointCounter = 0;
  g_iJointUpdateTimerCounter = 0;
}


void draw() {

  // Update the joint position every 100 draw cycles
  g_iJointUpdateTimerCounter++;
  if ( (g_iJointUpdateTimerCounter%JOINT_UPDATE_TIMER_COUNTER_LIMIT) == 0) {

    // Reset background
    background(0);

    // myDataMonster.movejoint passes the servo number and servo signal
    myDataMonster.moveJoint(g_iJointSelect, gi);
    //myDataMonster.moveJoint(g_iJointSelect, g_fAngle);
   
    
    //print("Joint: " + g_iJointSelect + " Command: " + g_fAngle + " \n");
    print("Joint: " + g_iJointSelect + " Command: " + gi + " \n");
    // print("Count: " + g_iJointUpdateTimerCounter%JOINT_UPDATE_TIMER_COUNTER_LIMIT + "\n");
    //servoVis.display passes the servo input variable for that servo.
    myServoVis.display(gi);
  }
}

void mousePressed() {
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      gi += 1;
      g_fAngle += g_fOneDegInRad;
    } 
    else if (keyCode == DOWN) {
      gi -= 1;
      g_fAngle -= g_fOneDegInRad;
    }
    else if (keyCode == LEFT) {
      gi = 0;
      g_fAngle = 0;
      g_iJointCounter--;
    } 
    else if (keyCode == RIGHT) {
      g_fAngle = 0;
      g_iJointCounter++;
    }
  }
  
  if (gi < 0)
    gi = 0;
  if (gi > 255)
    gi = 255;


  if (g_fAngle < -HALF_PI)
    g_fAngle = HALF_PI;
  if (g_fAngle > HALF_PI)
    g_fAngle = HALF_PI;


  g_iJointSelect = g_iJointCounter % myDataMonster.TOTAL_NUM_JOINTS;
  print("Joint: " + g_iJointSelect + "\n");
}


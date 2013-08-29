////////////////////////////
// Global Variables
////////////////////////////
ServoVis myServoVis;
DataMonster myDataMonster;
int gi = 0;
boolean incDec = true;

int g_iJointSelect;
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
  
  g_iJointSelect = 0; 
  g_iJointUpdateTimerCounter = 0;
}


void draw() {

  // Update the joint position every 100 draw cycles
  g_iJointUpdateTimerCounter++;
  if( (g_iJointUpdateTimerCounter%JOINT_UPDATE_TIMER_COUNTER_LIMIT) == 0){
    
    // Reset background
    background(0);
  
    // Update joint value
    if (incDec == true){
      gi++;
    }
    else{
      gi--;
    }
    if (gi==120){
      incDec = false;
    }
    if (gi ==80){
      incDec=true; 
    }
  
    // myDataMonster.movejoint passes the servo number and servo signal
    myDataMonster.moveJoint(g_iJointSelect, gi);
    print("Count: " + g_iJointUpdateTimerCounter%JOINT_UPDATE_TIMER_COUNTER_LIMIT + "\n");
    //servoVis.display passes the servo input variable for that servo.
    myServoVis.display(gi);
  }
}

void mousePressed(){
  
  g_iJointSelect++;
  if (myDataMonster.TOTAL_NUM_JOINTS == g_iJointSelect){
    g_iJointSelect = 0;
  }
  print("Joint: " + g_iJointSelect + "\n");
}

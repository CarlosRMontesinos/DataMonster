////////////////////////////
// Global Variables
////////////////////////////
ServoVis myServoVis;
DataMonster myDataMonster;
int gi = 0;
boolean incDec = true;

//Number of joints (servos)
int g_iNumJoints;
//array to hold servo visualizations
ServoVis[] servos;

int g_iJointSelect;
long g_iJointUpdateTimerCounter;
static final int JOINT_UPDATE_TIMER_COUNTER_LIMIT = 10;

void setup() {
  size(800, 700);
  smooth();

// Set the number of servos(joints)
g_iNumJoints = 5;
  // Initialize global variables
  int iSerialPort = 1;
  //create a new DataMonster object that passes the port number
  myDataMonster = new DataMonster(iSerialPort);


  //create a new ServoVis array
  servos = new ServoVis[g_iNumJoints];

  for (int i = 0; i< g_iNumJoints ; i++) {
    servos[i] = new ServoVis((100*(i+1)), height-(height/10));
  }

  g_iJointSelect = 0; 
  g_iJointUpdateTimerCounter = 0;
}


void draw() {


  // Update the joint position every 100 draw cycles
  g_iJointUpdateTimerCounter++;
  if ( (g_iJointUpdateTimerCounter%JOINT_UPDATE_TIMER_COUNTER_LIMIT) == 0) {

  // Reset background
  background(255);
  
    // Update joint value
    if (incDec == true) {
      gi++;
    }
    else {
      gi--;
    }
    if (gi==120) {
      incDec = false;
    }
    if (gi ==80) {
      incDec=true;
    }

    // myDataMonster.movejoint passes the servo number and servo signal
    myDataMonster.moveJoint(g_iJointSelect, gi);
    print("Count: " + g_iJointUpdateTimerCounter%JOINT_UPDATE_TIMER_COUNTER_LIMIT + "\n");
    //servoVis.display passes the servo input variable for that servo.
    for (int i = 0; i< g_iNumJoints ; i++) {
      servos[i].display(gi);
    }
  }
}

void mousePressed() {

  g_iJointSelect++;
  if (myDataMonster.TOTAL_NUM_JOINTS == g_iJointSelect) {
    g_iJointSelect = 0;
  }
  print("Joint: " + g_iJointSelect + "\n");
}


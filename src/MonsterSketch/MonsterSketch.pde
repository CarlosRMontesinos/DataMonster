////////////////////////////
// Global Variables
////////////////////////////
DataMonster myDataMonster;
int gi = 0;
boolean incDec = true;

int g_iJointSelect;
long g_iJointUpdateTimerCounter;
static final int JOINT_UPDATE_TIMER_COUNTER_LIMIT = 10;

void setup() {
  size(512, 200);

  // Initialize global variables
  int iSerialPort = 1;
  myDataMonster = new DataMonster(iSerialPort);
  g_iJointSelect = 0; 
  g_iJointUpdateTimerCounter = 0;
  
}

void draw() {
  //background(constrain(mouseX / 2, 0, 255));

  // Update the joint position every 100 draw cycles
  g_iJointUpdateTimerCounter++;
  if( (g_iJointUpdateTimerCounter%JOINT_UPDATE_TIMER_COUNTER_LIMIT) == 0){
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
  
    // Select which joint to move based on the a mouse click
    myDataMonster.moveJoint(g_iJointSelect, gi);
    print("Count: " + g_iJointUpdateTimerCounter%JOINT_UPDATE_TIMER_COUNTER_LIMIT + "\n");
  }
}

void mousePressed(){
  
  g_iJointSelect++;
  if (myDataMonster.TOTAL_NUM_JOINTS == g_iJointSelect){
    g_iJointSelect = 0;
  }
  print("Joint: " + g_iJointSelect + "\n");
}

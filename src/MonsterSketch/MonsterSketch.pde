ServoVis myServoVis;
DataMonster myDataMonster;
int gi = 0;
boolean incDec = true;





void setup() {
  size(800, 700);
  smooth();
  int iSerialPort = 4;
  
  //create a new DataMonster object that passes the port number
  myDataMonster = new DataMonster(iSerialPort);
  //create a new servo at location (X, Y) of upper left corner
  myServoVis = new ServoVis(100, 600);
}


void draw() {
  background(0);

  if (incDec == true) {
    gi++;
  }
  else {
    gi--;
  }
  if (gi==255) {
    incDec = false;
  }
  if (gi ==0) {
    incDec=true;
  }


  // myDataMonster.movejoint passes the servo number and servo signal
  myDataMonster.moveJoint(1, gi);
  //servoVis.display passes the servo input variable for that servo.
  myServoVis.display(gi);
}


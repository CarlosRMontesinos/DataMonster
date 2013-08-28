
DataMonster myDataMonster;
int gi = 0;
boolean incDec = true;
void setup() {
  size(512, 200);

  int iSerialPort = 4;
  myDataMonster = new DataMonster(iSerialPort);
}

void draw() {
  background(constrain(mouseX / 2, 0, 255));

if (incDec == true){
  gi++;
}
else{
    gi--;
}
      if (gi==255) {
incDec = false;
  }
  if (gi ==0){
   incDec=true; 
  }



  myDataMonster.moveJoint(1, gi);
}


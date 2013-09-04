class MonsterVis {
  float m_CameraX;
  float m_CameraY;

  MonsterVis(int jointNumber, int increments) {
    m_CameraX = 0;
    m_CameraY = 0;
  }

  public void cameraPos() {
    if (keyPressed == true) {
      if (key == 'a') {
        m_CameraX = m_CameraX-1;
      }
      else if (key == 'd') {
        m_CameraX = m_CameraX+1;
      }
      else if (key == 'w') {
        m_CameraY = m_CameraY-1;
      }
      else if (key == 's') {
        m_CameraY = m_CameraY+1;
      }
    }
  }

  public void display() {
fill(200);
    pushMatrix();
    //move to center of screen to draw
    translate(width*2/3, height*2/3);
    //rotate by the ammount spec'd in the camera controls
    rotateX(PI/90 * m_CameraY);
    rotateY(PI/90 * m_CameraX);
    
    //Draw sub-base
    translate(50,0);
    box(250,10,150);
    translate(-50,-15);
    /////////////////////
    //rotate command for base
    /////////////////
    rotate(0);
    ///////////////
    //draw base platform
    box(150, 10, 150);
    translate(0, -25);
    box(50, -40, 25);
    
    ///////////////////////
    //Rotate command for lower arm
    //////////////////////
    rotate(PI*6/7);
    ////////////////
    //draw lower arm
    translate(-90, 0);
    box(200, 20, 18);
    translate(-90,0);
  //////////////////////
  //Rotate command for upper arm
  ///////////////
  rotate(PI/4);
  translate(120,0);
  box(250,15,7);
  
  translate (120,0);
  ////////////////////
  //rotate command for neck
  ////////////////////
  rotate(0);
  /////////////////
  //rotate command for head
  ////////////////
  rotate(-PI/3);
  ///////
  translate (45,0);
  box(90,20,5);
  
    popMatrix();
  }
}


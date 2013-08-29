

class ServoVis {
  private int x = 0;
  private int y = 0;
  

  ServoVis (int i_x, int i_y) {
    x = i_x;
    y = i_y;
  }

  void display(int servInput) {

    fill(40);
    stroke(0);
    rect(x, y, 75, 30);
    ellipseMode(CENTER);
    pushMatrix();
    fill(255);
    float angle = map(servInput, 0, 255, 0, PI);
    translate(x+60, y+15);
    rotate(angle);
    ellipse(0, 0, 25, 25);
    ellipse(0, 0, 10, 65);
    ellipse(0, 0, 45, 10);
    ellipse(0, 0, 5, 5); 
    popMatrix();
  }
}


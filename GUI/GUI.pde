PFont f;

int yaw;
int pitch;

float ball_x = 0;
float ball_y = 0;
float ball_x_mod = 3;
float ball_y_mod = 3;

void setup() {
  size(550, 500);
  frameRate(20);
  f = createFont("Source Code Pro Black", 14);
  textFont(f);
  ball_x = (width*.04) +30;
  ball_y = (height*.23) + 30;
}

boolean collisionDetection(int inx, int iny, int x, int y, int xs, int ys) {
  if (inx >= x && inx <= xs && iny >= y && iny <= ys) {
    return true;
  } else {
    return false;
  }
}

void draw() {
  background(0);
  fill(255);
  rect(width*(.02727/4), height*(.03/4), width - (width*(.02727)/2), height - (height*(.03)/2), 7);
  fill(0);
  textAlign(LEFT);
  textSize(width*.025454);
  text("Yaw: " + yaw, width*(.05454), height*(.06));
  text("Pitch: " + pitch, width*(.05454), height*(.16));
  fill(0);
  textAlign(RIGHT);
  text("m o v e m e n t :", width - (width*.06), (height*.07));
  fill(250);
  rect(width/2, height*.08, width/2.27, height*.01);
  fill(0);
  text("i n t e r a c t i o n :", width - (width*.06), (height*.4));
  textAlign(LEFT);
  text("c o n s o l e", width *.05, height *.28);
  fill(255);
  rect(width/2, height*.41, width/2.27, height*.01);
  rect(width*.032, height *.22, (width/2.5), height-(height*.28));
  rect(width*.04, height *.23, width/2.5, height-(height*.28));
  
  fill(0);
  textAlign(LEFT);
  text("c o n s o l e", width *.06, height *.28);

}

void keyPressed() {
  if (key == 'A') {
    yaw += 5;
    if (yaw > 90) {
      yaw = 90;
    }
  } else if (key == 'a') {
      yaw += 1;
    if (yaw > 90) {
      yaw = 90;
    }
  }
  
  if (key == 'D') {
    yaw -= 5;
    if (yaw < -90) {
      yaw = -90;
    }
  } else if (key == 'd') {
    yaw -= 1;
    if (yaw < -90) {
      yaw = -90;
    }
  }
  
  if (key == 'W') {
    pitch += 5;
  } else if (key == 'w') {
    pitch += 1;
  }
  
  if (key == 'S') {
    pitch -= 5;
  } else if (key == 's') {
    pitch -= 1;
  }
}

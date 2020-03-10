import controlP5.*;
ControlP5 cp5;
public float numberboxValue = 100;
PFont f;
import processing.serial.*;
Serial myPort;
import processing.sound.*;
SoundFile file;

float ball_x = 0;
float ball_y = 0;
float ball_x_mod = 3;
float ball_y_mod = 3;

int movement_color_r = 250;
int movement_color_g = 250;
int movement_color_b = 250;

int sandwich_color_r = 250;
int sandwich_color_g = 250;
int sandwich_color_b = 250;

boolean mouseToggle = false;

float selector_x = 255;
float selector_y = 100;

float selector_xs [];
float selector_ys [];

PImage img; 

int command_sel = 0; 
int buffer = 0;

void setup() {
  size(550, 500);
  myPort = new Serial(this, Serial.list()[1], 9600);

  frameRate(120);
  f = createFont("Source Code Pro Black", 14);
  textFont(f);
  img = loadImage("Sandwich bot.png");
  ball_x = (width*.04) +30;
  ball_y = (height*.23) + 30;
  selector_y = height* .16;
  selector_x = width*.4636;
  //file = new SoundFile(this, "02 Green Hill Zone.mp3");
  //file.loop();
}

boolean collisionDetection(float inputx, float inputy, float x, float y, float xs, float ys) {
  if (inputx >= x && inputx <= xs && inputy >= y && inputy <= ys) {
    return true;
  } else {
    return false;
  }
}

void draw() {
  background(0);
  fill(255);
  rect(width*(.02727/4), height*(.03/4), width - (width*(.02727)/2), height - (height*(.03)/2), 7);
  fill(movement_color_r, movement_color_g, movement_color_b);
  //movement bar
  rect(width/2, height*.08, width/2.27, height*.01);
  fill(sandwich_color_r, sandwich_color_g, sandwich_color_b);
  //interactions bar
  rect(width/2, height*.61, width/2.27, height*.01);
  //console outer bar
  if (selector_x == width*.06) {
    fill(178, 255, 178);
  } else {
    fill(250);
  }
  rect(width*.032, height *.22, (width/2.5)+(width*.018), height-(height*.28)+height*.02);
  
  fill(255);
  //console inner rect
  rect(width*.04, height *.23, width/2.5, height-(height*.28));
  rect(width*.04, height *.30, width/2.5, height*.01);
  
  fill(0);
  textSize(width*.025454);
  textAlign(RIGHT);
  text("i t e m s :", width - (width*.06), (height*.07));
  textSize(width*.02);
  text("p l a c e   i t e m   # 0 1", width - (width*.06), height *.16);  
  text("p l a c e   i t e m   # 0 2", width - (width*.06), height *.22);  
  text("p l a c e   i t e m   # 0 3", width - (width*.06), height *.28);
  text("p l a c e   i t e m   # 0 4", width - (width*.06), height *.34);  
  text("p l a c e   i t e m   # 0 5", width - (width*.06), height *.40);  
  text("p l a c e   i t e m   # 0 6", width - (width*.06), height *.46);
  text("p l a c e   a l l   i t e m s", width - (width*.06), height *.52);
  text("p l a c e   s a u c e   # 0 1", width - (width*.06), height *.69);  
  text("p l a c e   s a u c e   # 0 2", width - (width*.06), height *.75);  
  text("p l a c e   s a u c e   # 0 3", width - (width*.06), height *.81);
  text("p l a c e   a l l   s a u c e s", width - (width*.06), height *.87);
    
  textSize(width*.025454);
  text("s a u c e s :", width - (width*.06), (height*.60));
  textSize(width*.02);
  //text("p l a c e   i t e m   # 0 1", width - (width*.06), height *.49);
  //text("p l a c e   i t e m   # 0 2", width - (width*.06), height *.55);
  //text("p l a c e   i t e m   # 0 3", width - (width*.06), height *.61);
  //text("p l a c e   s a u c e   # 0 1", width - (width*.06), height *.7);
  //text("p l a c e   s a u c e   # 0 2", width - (width*.06), height *.7);
  //text("p l a c e   s a u c e   # 0 3", width - (width*.06), height *.7);
  //text("c o m m e n c e   a u t o m a t e d", width - (width*.06), height *.79);
  //text("s a n d w i c h   a s s e m b l y", width - (width*.06), height *.83);
 
  if (command_sel != 0) {
    textAlign(LEFT);
    buffer += 1;
    if (buffer < 360) {
      if (command_sel >=1 && command_sel <= 11) {
        text("  p l a c e   i t e m   # 0 " + ((command_sel/2)+1), width*.06, height*.35); 
      } if (command_sel == 13) {
        text("  p l a c i n g   s a u c e . .", width*.06, height*.35); 
      }
    }
    if (buffer >= 360) {
      text("  t a s k   c o m p l e t e", width*.06, height*.35);
      buffer = 360;
      command_sel = 2;
    }
  }
  
  textSize(width*.025454);
  textAlign(LEFT);
  
  text("c o n s o l e", width *.06, height *.28);
  image(img, width*(.018), height*(.006), img.width/2.7, img.height/2.7);
  

  text(">", selector_x, selector_y);
  if (selector_y <= height*.28 && selector_y >= height *.16) {
    movement_color_r = 178;
    movement_color_g = 255;
    movement_color_b = 178;
    sandwich_color_r = 250;
    sandwich_color_g = 250;
    sandwich_color_b = 250;
  } else {
    sandwich_color_r = 178;
    sandwich_color_g = 255;
    sandwich_color_b = 178;
    movement_color_r = 250;
    movement_color_g = 250;
    movement_color_b = 250;
  } if (selector_x == width*.06) {
    movement_color_r = 250;
    movement_color_g = 250;
    movement_color_b = 250;
    sandwich_color_r = 250;
    sandwich_color_g = 250;
    sandwich_color_b = 250;
  }
  
}

void keyPressed() {
  
  if (key == ENTER) {
    if (selector_y == height*.16) {
      command_sel = 1;
      myPort.write("a");
      selector_y = height * .35;
      selector_x = width*.06;
    } if (selector_y == height*.22) {
      command_sel = 3;
      myPort.write("b");
      selector_y = height * .35;
      selector_x = width*.06;
    } if (selector_y == height*.28) {
      command_sel = 5;
      myPort.write("c");
      selector_y = height * .35;
      selector_x = width*.06;
    } if (selector_y == height*.34) {
      command_sel = 7;
      myPort.write("d");
      selector_y = height * .35;
      selector_x = width*.06;
    } if (selector_y == height*.40) {
      command_sel = 9;
      myPort.write("e");
      selector_y = height * .35;
      selector_x = width*.06;
    } if (selector_y == height*.46) {
      command_sel = 11;
      myPort.write("f");
      selector_y = height * .35;
      selector_x = width*.06;
    }if (selector_y == height*.52) {
      command_sel = 13;
      myPort.write("g");
      selector_y = height * .35;
      selector_x = width*.06;

    } if ((selector_y <= height*.61)&&(selector_y >= height*.49)) {
      myPort.write("h");
      command_sel = 7;
      selector_y = height * .35;
      selector_x = width*.06;
    }
  }
  
  if (key == CODED) {
    if (command_sel%2 == 0) {
      command_sel = 0;
      buffer = 0;
    }
    if (command_sel == 0) {
      if (keyCode == UP) {
        
        if ((selector_y <= height*.52)&&(selector_y > height*.16)) {
          selector_y -= height*.06;
        } else if (selector_y == height*.69){
          selector_y -= height*.17;
        } else if ((selector_y <= height*.87)&&(selector_y > height*.69)) {
          selector_y -= height*.06;
        } if (selector_x == width*.06) {
          selector_y = height*.87;
          selector_x = width*.4636;
        }
        
      }
      
      if (keyCode == DOWN) {
        
        if (selector_x != width *.06) {
          if (selector_y < height*.52) {
            selector_y += height*.06;
          } else if (selector_y == height*.52){
            selector_y += height*.17;
          } else if (selector_y > height*.52 && selector_y < height*.87){
            selector_y += height*.06;
          } 
        }
        
      }
    }
  }
}

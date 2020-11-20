
int locX = 350;
int locY = 350;
int size = 20;                //Integer values set for x, y, speed, and size of square
int speed = 5;

int square;                  //set the shape of the square as an integer so it can move as an object

boolean goUP = true;
boolean goDOWN = true;
boolean goRIGHT = true;                     //Boolean statements for movement and powerups
boolean goLEFT = true;
boolean PowerUp = true;

String t = "WARNING: Wormhole Detected Ahead. Approach with Caution!!!";                //text when entering redzone

float lasttimecheck;
float timeinterval;                                //% second challenge

void setup() {
  size(700, 700);
  background(255);
  fill(255, 0, 0);                             //background and square
  rect(0, 0, 40, 700);

}

void draw() {
  fill(0);
  background(0);
  fill(255, 0, 0);
  rect(0, 0, 700, 40);                            //background so it redraws itself
  fill(255);                                      //Redzone
  square(locX, locY, size);

  if (locY < 40) {
    textSize(22);
    stroke(10);                          //If inside redzone it will display text
    fill(0);
    text(t, 10, 35);
  }
}

void keyPressed() {

  if (key == 'p') {
      
    lasttimecheck = millis();
    timeinterval = 5000;                        //Powerup with time
    PowerUp = true;
    speed = 10;
    locY = locY - speed;
    locY = locY + speed;
    locX = locX - speed;
    locX = locX + speed;
  } 

  if(millis() > lasttimecheck + timeinterval){
    PowerUp = false;                                          //5 second challenge
    speed = 5;
  }

  if (locY < 0) {
    locY = 700;
    goUP = true;
  } else if (keyCode == UP) {                  //Up arrow key with wrap
    goUP = true;
    locY = locY - speed;
  } 

  if (locY > 700) {
    locY = 0;
    goDOWN = true;
  } else if (keyCode == DOWN) {                               //Down arrow key with wrap
    goDOWN = true;
    locY = locY + speed;
  } 

  if (locX > 700) {
    locX = 0;
    goRIGHT = true;
  } else if (keyCode == RIGHT) {
    goRIGHT = true;                              //Right arrow key with wrap
    locX = locX + speed;
  } 

  if (locX < 0) {
    locX = 700;
    goLEFT = true;                             //Left arrow key with wrap
  } else if (keyCode == LEFT) {
    goLEFT = true;
    locX = locX - speed;
  }
}

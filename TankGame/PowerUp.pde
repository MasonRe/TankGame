class PowerUp {
  // Member Varibales
  float x, y, w, h, speed;
  PImage obs1;
  char idir;

  //constructor
  PowerUp(float w, float h) {

    this. w = w;
    this. h = h;
    speed = 5;
    
    if(int(random(4))==2) {
      type = 'h';
      x = random(width);
      y= -100;
    }else if

    idir = 'w';
    obs1 = loadImage("Power.png");
  }

  void display() {
if(type == 'h') {
  fill(0,200,0);
  ellipse(x,y,w,h);
  fill(2555);
  text(health);
}
  }

  void move() {
 y = y +speed;
  }
  boolean reachedEdge() {
return || x > width+w/2 || y < 0-w/2 || y> height+w/2) {
    }
  }
}

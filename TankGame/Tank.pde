class Tank {
  // Member Varibales
  float x, y, w, h, speed, health;
  PImage iTankW;
  char idir;
  int turretCount, laserCount;

  //constructor
  Tank() {
    x = 250;
    y = 120;
    w = 100;
    h = 100;
    speed = 10.0;
    health = 3.0;
    iTankW = loadImage("tank.png");
    idir = 'w';
    turretCount = 1;
    laserCount = 100;
  }

  void display() {
    rectMode(CENTER);
     if(idir == 'w') {
      image(iTankW,x,y);
  } else if (idir == 'a'){
    image(iTankW,x,y);
  }else if (idir == 's'){
    image(iTankW,x,y);
  }else if (idir == 'd'){
    image(iTankW,x,y);
  }
  }

  void move(char dir) {
    if (dir == 'w') {
      y = y - speed;
      idir = 'w';
    } else if (dir == 's') {
      y = y + speed;
      idir = 's';
    } else if (dir == 'a') {
      x = x - speed;
      idir = 'a';
    } else if (dir == 'd') {
      x = x + speed;
      idir = 'd';
    }
  }


  void fire() {
  }
  boolean intersect(Obstacle o) {
    float distance = dist(x, y, o.x, o.y);
    if (distance < 100) {
      return true;
    } else {
      return false;
    }
  }
}

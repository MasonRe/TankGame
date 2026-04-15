class Tank {
  // Member Varibales
  float x, y, w, h, speed, health;
  PImage iTankW, iTankA, iTankS, iTankD;
  char idir;

  //constructor
  Tank() {
    x = 250;
    y = 120;
    w = 100;
    h = 100;
    speed = 10.0;
    health = 3.0;
    idir = 'w';
    iTankW = loadImage("tank.png");
  }

  void display() {
    fill(128);
    rectMode(CENTER);
    rect(x, y, w, h);
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

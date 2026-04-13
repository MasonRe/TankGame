class Tank {
  // Member Varibales
  float x, y, w, h, speed, health;
  PImage iTankW, iTankA, iTankS, iTankD;
  char idir;

  //constructor
  Tank() {
    this.x = x;
    this. y = y;
    this. w = w;
    this. h = h;
    this. speed = speed;
    this. health = health;
    indir = 'w';
  }

  void display() {
    fill(128);
    rectMode(CENTER); 
    rect(x, y, w, h);
  }

  void move() {
    x=x+speed;
  }
}

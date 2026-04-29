class PowerUp {

  float x, y, w, h, speed;
  char type; // 'h' = health, 's' = speed

  PImage img;

  // constructor
  PowerUp() {
   w= 100;
   h= 100;

    speed = 5;

    // random type
    if (int(random(1))==2) {
      type = 'h';
      x= random(width);
      y = -100
    } else if (int(random(3))==1) {
      type = 's';
    }

    img = loadImage("Power.png");
  }

  void display() {
    if(type == 'h'){
      fill(0,200,0);
      ellipse(x,y,w,h,speed);

  }

  void move() {
    y += speed;
  }

  boolean reachedEdge() {
    return (y > height + h);
  }

  // collision with tank
  boolean intersect(Tank t) {
    float d = dist(x, y, t.x, t.y);
    return d < (w/2 + t.w/2);
  }

  // apply benefit
  void applyEffect(Tank t) {
    if (type == 'h') {
      t.health += 20;   // health boost
    } else if (type == 's') {
      t.speed += 1;     // speed boost
    }
  }
}

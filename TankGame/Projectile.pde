class Projectile {
  // Member Varibales
  float x, y, w, h, speed;
  float vx, vy;
  char dir;

  //constructor
  Projectile(float x, float y, float vx, float vy) {
    this.x = x;
    this. y = y;
    this. vx = vx;
    this. vy = vy;
    this. w = 10;
    this. h = 10;
    speed = 10;
    dir = 'u';
  }

  void display() {
    fill(255, 0, 127);
    rect(x, y, w, h);
  }

  void move() {
    y = y + vy;
    x = x + vx;
  }
  boolean intersect(Obstacle o) {
    float distance = dist(x, y, o.x, o.y);
    if (distance < 100 ) {
      return true;
    } else {
      return false;
    }
  }
  //boolean reachedEdge() {
    //if (x < 0-w/2 || x > width+w/2 || y < 0-w/2 || y> height+w/2) {
  //  }
  //}
}

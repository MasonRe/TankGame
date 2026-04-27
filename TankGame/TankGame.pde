// Mason Rees | April 1st | Tank Game
Tank t1;
ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
ArrayList<PowerUp> powerups = new ArrayList<PowerUp>();
PImage bg;
float mag = 100;
int score;
Timer objTimer, puTimer;

void setup () {
  size(500, 500);
  score = 0;
  bg = loadImage("bg1.png");
  t1 = new Tank();
  objTimer = new Timer(1000);
  objTimer.start();
  puTimer = new Timer (5000);
  puTimer.start();
  //obstacles.add(new Obstacle(300, 200, 100, 100, int(random(1, 10))));
}
  for (int i = 0; i < powerups.size(); i++) {
    PowerUp pu = powerups.get(i);
    pu.display();
    pu.move();
    if (pu.reachedEdge()) {
      powerups.remove(i);
    }
  }
void draw() {
  //background("background.png");
  bg = loadImage("background.png");
  imageMode(CORNER);
  image(bg, 0, 0);

  if ((objTimer.isFinished())) {
    obstacles.add(new Obstacle(-100, 200, 100, 100, int(random(1, 10)), 10));
    objTimer.start();
  }

  if ((puTimer.isFinished())) {
    powerups.add(new PowerUp(100, 100));
    puTimer.start();
  }

  for (int i = 0; i < obstacles.size(); i++) {
    Obstacle o = obstacles.get(i);
    o1.display();
    o1.move();
    if (o.reachedEdge()) {
      obstacles.remove(i);
    }
  }
  // Render and Detect Collision
  for (int i = 0; i < projectiles.size(); i++) {
    Projectile p = projectiles.get(i);
    for (int j = 0; j<obstacles.size(); j++) {
      Obstacle o = obstacles.get(j);
      if (p.intersect(o)) {
        projectiles.remove(i);
        score = score + 100;
        obstacles.remove(j);
      }
    }
    p.display();
    p.move();
    if (p.reachedEdge()) {
      projectiles.remove(i);
    }
  }
  t1.display();
  scorePanel();
  printIn("");


  void keyPressed() {
    if (key == 'w') {
      t1.move('w');
    } else if (key == 'a') {
      t1.move('a');
    } else if (key == 's') {
      t1.move('s');
    } else if (key == 'd') {
      t1.move('d');
    }
  }

  void mousePressed() {
    float dx = mouseX - t1.x;
    float dy = mouseY - t1.y;
    float d = sqrt(dx *dx + dy * dy);
    dx /= d;
    dy /= d;
    mag--;
    if (mag > 0) {
      float speed = 3;
      projectiles.add (new Projectile(t1.x, t1.y, speed * dx, speed * dy));
    }
  }

  void scorePanel() {
    fill(127, 225);
    rectMode(CENTER);
    noStroke();
    rect(width/2, 15, width, 30);
    fill(255);
    textSize(30);
    textAlign(CENTER);
    text("Score:" + score, width/2, 25);
  }

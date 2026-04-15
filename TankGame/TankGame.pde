// Mason Rees | April 1st | Tank Game
Tank t1;
ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
ArrayList<Obstacle> obstacles = new ArrayList<Obstacles>();
PImage bg;
int score;

void setup () {
  size(500, 500);
  score = 0;
  bg = loadImage("bg1.png");
  t1 = new Tank();
 obstacles.add(new Obstacle(300,200,100,100,int(random(1,10))));
}

void draw() {
  //background("background.png");
  bg = loadImage("background.png");
  imageMode(CORNER);
  image(bg, 0, 0);
  
  
  for (int i = 0; i < obstacles.size(); i++) {
  Obstacle p = obstacles.get(i);
  o.display();
}
  for (int i = 0; i < projectiles.size(); i++) {
    Projectile o = projectiles.get(i);
    p.display();
    p.move();
  }
  t1.display();
  o1.display();
  o1.move();
  scorePanel();
}

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
  projectiles.add(new Projectile(t1.x, t1.y, 4, 10));
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

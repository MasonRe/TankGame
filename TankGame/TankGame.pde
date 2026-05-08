// 1 April 2026 | TankGame | Mason Rees

Tank t1;

ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
ArrayList<PowerUp> powerups = new ArrayList<PowerUp>();

PImage bg;

int score;

Timer objTimer, puTimer;

void setup() {
  size(500, 500);

  score = 0;

  bg = loadImage("bg1.png");

  t1 = new Tank();

  objTimer = new Timer(1000);
  objTimer.start();

  puTimer = new Timer(5000);
  puTimer.start();
}

void draw() {
  background(127);

  imageMode(CORNER);
  image(bg, 0, 0);

  // SPAWN OBSTACLES
  if (objTimer.isFinished()) {
    obstacles.add(new Obstacle(100, 100, int(random(1, 10)), 10));

    objTimer.start();
  }

  // SPAWN POWERUPS
  if (puTimer.isFinished()) {
    powerups.add(new PowerUp());

    puTimer.start();
  }

  // POWERUPS
  for (int i = 0; i < powerups.size(); i++) {
    PowerUp pu = powerups.get(i);

    pu.display();
    pu.move();

    // remove if off screen
    if (pu.reachedEdge()) {
      powerups.remove(i);
      i--;

      continue;
    }

    // collision with tank
    if (pu.intersect(t1)) {

      // HEALTH
      if (pu.type == 'h') {
        t1.health = t1.health + 100;
      }

      // AMMO
      else if (pu.type == 'a') {
        t1.laserCount = t1.laserCount + 100;
      }

      // EXTRA TURRET
      else if (pu.type == 't') {
        t1.turretCount = t1.turretCount + 1;
      }

      powerups.remove(i);
      i--;
    }
  }

  // OBSTACLES
  for (int i = 0; i < obstacles.size(); i++) {
    Obstacle o = obstacles.get(i);

    o.display();
    o.move();

    if (o.reachedEdge()) {
      obstacles.remove(i);
      i--;
    }

    // tank collision
    if (t1.intersect(o)) {
      t1.health = t1.health - 1;
    }
  }

  // PROJECTILES
  for (int i = 0; i < projectiles.size(); i++) {
    Projectile p = projectiles.get(i);

    for (int j = 0; j < obstacles.size(); j++) {
      Obstacle o = obstacles.get(j);

      if (p.intersect(o)) {
        score = score + 100;

        projectiles.remove(i);
        obstacles.remove(j);

        i--;

        break;
      }
    }

    if (i >= 0 && i < projectiles.size()) {
      p.display();
      p.move();

      if (p.reachedEdge()) {
        projectiles.remove(i);
        i--;
      }
    }
  }

  t1.display();
 
  scorePanel();

  println("Objects in Memory: " + obstacles.size());
  println("Projectiles in Memory: " + projectiles.size());
}

void keyPressed() {
  if (key == 'w') {
    t1.move('w');

  } else if (key == 's') {
    t1.move('s');

  } else if (key == 'd') {
    t1.move('d');

  } else if (key == 'a') {
    t1.move('a');
  }
}

void mousePressed() {
  // direction toward mouse
  float dx = mouseX - t1.x;
  float dy = mouseY - t1.y;
  float mag = sqrt(dx * dx + dy * dy);
  if (mag > 0) {
    dx /= mag;
    dy /= mag;
    float speed = 5;
    
    if (t1.turretCount == 1 && t1.laserCount > 0) {
      projectiles.add(
        new Projectile(t1.x, t1.y, dx * speed, dy * speed)
      );
      t1.laserCount--;
    }

    else if (t1.turretCount >= 2 && t1.laserCount > 1) {
      projectiles.add(
        new Projectile(t1.x - 20, t1.y, dx * speed, dy * speed)
      );
      projectiles.add(
        new Projectile(t1.x + 20, t1.y, dx * speed, dy * speed)
      );
      t1.laserCount = t1.laserCount - 2;
    }
  }
  println(projectiles.size());
}

void scorePanel() {
  fill(127, 200);
  rectMode(CENTER);
  noStroke();
  rect(width/2, 15, width, 30);
  fill(255);
  textSize(18);
  textAlign(CENTER);
  text("Score: " + score, width/2, 25);
  text("Health: " + t1.health, width/2 - 150, 25);
  text("Ammo: " + t1.laserCount, width/2 + 150, 25);
}

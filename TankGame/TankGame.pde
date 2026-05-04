// Mason Rees | April 1st | Tank Game
PImage bg1;
Tank t1;
Heart h1;
ArrayList<PowerUp> powerups;
ArrayList<Projectile> projectiles;
ArrayList<Obstacle> obstacles;

void setup() {
  size(500, 500);
  bg1 = loadImage("bg1.png");
  t1 = new Tank();
  powerups = new ArrayList<PowerUp>();
  projectiles = new ArrayList<Projectile>();
  obstacles = new ArrayList<Obstacle>();
  h1 = new Heart(random(50, 450), random(50, 450), 40, 40, 20);

  for (int i = 0; i < 5; i++) {
    obstacles.add(new Obstacle(random(50, 450), random(50, 450)));
  }
}

void draw() {
  if (bg1 != null) background(bg1);
  else background(50);

  if (t1.health > 0) {
    t1.display();

   
    if (frameCount % 40 == 0) {
      powerups.add(new PowerUp(random(width), -50, 60, 60, 20, random(2, 5)));
    }

   
    if (frameCount % 600 == 0) {
      obstacles.add(new Obstacle(random(50, 450), random(50, 450)));
    }

   
    for (int i = projectiles.size() - 1; i >= 0; i--) {
      Projectile p = projectiles.get(i);
      p.move();
      p.display();

      boolean ProjectileRemoved = false;
      for (int j = powerups.size() - 1; j >= 0; j--) {
        if (dist(pu.x, pu.y, powerups.get(j).x, powerups.get(j).y) < 30) {
          powerups.remove(j);
          ProjectileRemoved = true;
          break;
        }
      }

      if (!ProjectileRemoved) {
        for (int k = obstacles.size() - 1; k >= 0; k--) {
          if (dist(p.x, p.y, obstacles.get(k).x, obstacles.get(k).y) < 25) {
            obstacles.remove(k);
            ProjectileRemoved = true;
            break;
          }
        }
      }

      if (ProjectileRemoved || p.y < 0 || p.y > height || p.x < 0 || p.x > width) {
        projectiles.remove(i);
      }
    }

   
    for (int i = powerups.size() - 1; i >= 0; i--) {
      PowerUp pu = powerups.get(i);
      pu.move();
      pu.display(t1.PowerUpImg);
      if (t1.hitPowerUp(pu)) {
        t1.health -= pu.val;
        powerups.remove(i);
      } else if (pu.y > height + 50) {
        powerups.remove(i);
      }
    }

   
    for (Obstacle obs : obstacles) {
      obs.display(wallImg);
      if (dist(t1.x, t1.y, obs.x, obs.y) < (t1.w/2 + obs.w/2 - 10)) {
        if (t1.idir == 'w') t1.y += t1.speed;
        if (t1.idir == 's') t1.y -= t1.speed;
        if (t1.idir == 'a') t1.x += t1.speed;
        if (t1.idir == 'd') t1.x -= t1.speed;
      }
    }

   
    h1.display(t1.heartImg);
    if (t1.hitHeart(h1)) {
      t1.health += h1.val;
      h1.reset();
    }

    fill(255);
    textSize(20);
    text("Health: " + (int)t1.health, 20, 30);
  } else {
    background(0);
    fill(255, 0, 0);
    textAlign(CENTER);
    textSize(40);
    text("GAME OVER", width/2, height/2);
  }
}

void keyPressed() {
  t1.move(key);
}

void mousePressed(char dir) {
  projectiles.add(new Projectile(t1.x, t1.y, t1.dir));
}

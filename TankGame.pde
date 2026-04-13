// Mason Rees | April 1st | Tank Game
Tank t1;
Obstacle o1
PIamge bg;



void setup () {
  size(500,500);
  bg = loadImage("bg1.png");
  t1 = new Tank();
  o1 = new Obstacle(400,100,100,50,5,100);
  
}

void draw() {
  backgorund(127);
  imageMode(CORNER)
  image(bg,0,0);
  tl.display();
  o1.display
 
}

void keyPressed() {
  if(key == 'w') {
    t1.move('w')
  }
} 

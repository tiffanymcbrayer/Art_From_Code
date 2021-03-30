
float x, y;
float time;

void setup() {
  size(600, 600);
  background(255);
  time = 0;
  x = 0;
  y = 0;
}

void draw() {

  background(164, 43, 16);
  background(0);
  time += 0.01;
  x = 0;
  y = 0;
  while (x<width) {
    noFill();
    
    stroke( 89, 45, 20);
    bezier(-100, 450, x, 450+400 * noise(x/50, time), x,450+ 400 * noise(x/25, time), width+100, 450);
    
    stroke(140, 82, 48);
    bezier(-100, 350, x,350+ 400 * noise(x/50, time), x,350+ 400 * noise(x/25, time), width+100, 350);
    
    stroke(191, 121, 80);
    bezier(-100, 250, x,250+ 400 * noise(x/50, time), x,250+ 400 * noise(x/25, time), width+100, 250);
    
    stroke(38, 11, 1);
    bezier(-100, 150, x,150+ 400 * noise(x/50, time), x,150+ 400 * noise(x/25, time), width+100, 150);
    
    stroke( 217, 153, 130);
    bezier(-100, 50, x,50+ 400 * noise(x/50, time), x,50+ 400 * noise(x/25, time), width+100, 50);
    
    stroke(89, 45, 20);
    bezier(-100, -50, x, -50+400 * noise(x/50, time), x,-50+ 400 * noise(x/25, time), width+100, -50);
   
    x += 1;
    y +=1;
  }
}

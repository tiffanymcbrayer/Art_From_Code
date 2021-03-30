//Tiffany McBrayer 
// collage 

PImage model1;
PImage model2;
PImage model3;
PImage water;
PImage dye;
PImage workers;
PImage crowd;
PImage cotton;
PImage receipts;
PImage smoke;

void setup() {
  size(600, 800);
  model1 = loadImage("model1.png");
  model2 = loadImage("model2.png");
  model3 = loadImage("model3.png");
  water = loadImage("water.png");
  dye = loadImage("dye.png");
  workers = loadImage("workers.png");
  crowd = loadImage("crowd.png");
  cotton = loadImage("cotton.png");
  receipts = loadImage("receipts.png");
  smoke = loadImage("smoke.png");
}

void draw() {
  // render images to the screen
  background(168, 148, 131);  

  noStroke();

  // smoke towers 
  fill(100, 100, 100);
  ellipse(39, 577, 28, 15);
  quad(25, 800, 55, 800, 55, 575, 25, 575);
  fill(184, 184, 184);
  quad(30, 800, 60, 800, 60, 575, 30, 575);
  fill(170, 170, 170);
  ellipse(45, 575, 29, 15);

  fill(100, 100, 100);
  ellipse(414, 677, 28, 15);
  quad(400, 800, 435, 800, 435, 675, 400, 675);
  fill(184, 184, 184);
  quad(405, 800, 435, 800, 435, 675, 405, 675);
  fill(170, 170, 170);
  ellipse(420, 675, 29, 15);

  fill(255);
  quad(40, 20, 40, 440, 270, 440, 270, 20);
  fill(237, 232, 224);
  quad(45, 25, 45, 390, 265, 390, 265, 25);

  pushMatrix();
  scale(.4);
  tint(225);
  image(model1, 100, 70); 
  popMatrix();

  fill(255);
  quad(210, 335, 210, 795, 380, 795, 380, 335);
  fill(237, 232, 224);
  quad(215, 340, 215, 765, 375, 765, 375, 340);

  fill(255);
  quad(395, 160, 395, 580, 580, 580, 580, 160);
  fill(237, 232, 224);
  quad(400, 165, 400, 530, 575, 530, 575, 165);

  fill(255);
  quad(307, 27, 307, 220, 452, 220, 452, 27);

  fill(255);
  quad(13, 596, 13, 745, 199, 745, 199, 596);

  pushMatrix();
  scale(.7);
  tint(255, 160);
  image(water, 70, 580); 
  popMatrix();

  pushMatrix();
  tint(255);
  scale(.55);
  image(model3, 250, 640); 
  popMatrix();

  pushMatrix();
  scale(.7);
  image(model2, 530, 250);
  popMatrix();

  pushMatrix();
  tint(255, 200);
  image(dye, 400, 540); 
  popMatrix();

  pushMatrix();
  tint(255);
  scale(.8);
  image(workers, 390, 40); 
  popMatrix();

  pushMatrix();
  scale(.3);
  image(crowd, 60, 2000); 
  popMatrix();

  pushMatrix();
  scale(.4);
  image(cotton, 1100, 1500); 
  popMatrix();

  pushMatrix();
  scale(.4);
  rotate(PI/8);
  image(cotton, 1700, 900); 
  popMatrix();

  // tape 
  fill(255, 255, 255, 100);
  quad(456, 708, 443, 729, 530, 760, 550, 738);
  quad(280, 58, 303, 76, 343, 21, 322, 3);
  quad(206, 694, 222, 717, 163, 777, 145, 759);
  quad(182, 19, 203, 0, 281, 41, 266, 66);
  quad(520, 153, 533, 129, 596, 167, 588, 193);

  pushMatrix();
  tint(255, 250);
  scale(.5);
  image(receipts, 450, 590); 
  popMatrix();

  pushMatrix();
  tint(255, 150);
  image(smoke, -100, 65); 
  image(smoke, 275, 165); 
  popMatrix();


  ////using this to find points 
  //fill(1);
  //textSize(20);
  //text(mouseX, mouseX, mouseY-10);
  //text(mouseY, mouseX, mouseY+30);
  //if (mousePressed == true) {
  //  println(mouseX, mouseY);
  //}
}

void keyPressed() {
  if (key == 'x') saveFrame("check_in_07_collage.png");
}

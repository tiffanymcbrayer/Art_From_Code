
float x, y;
float treeH;
float yadd;
float time = 0;

float n;


float add;

float add2;

void setup() {
  size(600, 600);
  background(255);
}

void draw() {

  background(0);
  // time += .01;

  add2 = 10;

  // texture 
  for (int x = 0; x < width+(add2*3); x+=(add2*2)) {
    for (int y = 0; y < height+(add2*3); y+=(add2*2)) {
      float n = noise(x * 0.005, y * 0.005);
      push();
      translate(x, y);
      rotate(TWO_PI * n);
      scale(n*8, n*9);
      noStroke();
      fill(y+100, 0, (x*3)+100, 10);
      fill(166, 166, 166,20);
      ellipse(0, 0, 5, 5);

      pop();
    }
  }

  add = 2;
  x = 350;
  y = 500;
  treeH = 100;
  for (int i = int(y); i < y+treeH; i+=2) {
    // outside mults range, inside mult amount of cauxios 
    float n = noise(i * 0.025)*10;
    float n2 = noise(i * 0.025)*200;
    stroke(129+(n2*3), 90, 140);
    line(x, i, x+n+add, i-n2);
    line(x, i, x-n-add, i-n2);
    add+=1;
  }

  add = 2;
  x = 50;
  y = 0;
  treeH = 100;
  for (int i = int(y+treeH); i > y; i-=2) {
    // outside mults range, inside mult amount of cauxios 
    float n = noise(i * 0.025)*10;
    float n2 = noise(i * 0.025)*200;
    stroke(129+(n2*3), 90, 140);
    line(x, i, x+n+add, i+n2);
    line(x, i, x-n-add, i+n2);
    add+=1;
  }

  add = 2;
  x = 200;
  y = 450;
  treeH = 150;
  for (int i = int(y); i < y+treeH; i+=2) {
    // outside mults range, inside mult amount of cauxios 
    float n = noise(i * 0.025)*30;
    float n2 = noise(i * 0.005)*300;
    stroke(129+(n*3), 90, 140);
    line(x, i, x+n+add, i-n2);
    line(x, i, x-n-add, i-n2);
    add+=1;
  }

  add = 2;
  x = 500;
  y = 0;
  treeH = 150;
  for (int i = int(y+treeH); i > y; i-=2) {
    // outside mults range, inside mult amount of cauxios 
    float n = noise(i * 0.025)*30;
    float n2 = noise(i * 0.005)*300;
    stroke(129+(n*3), 90, 140);
    line(x, i, x+n+add, i+n2);
    line(x, i, x-n-add, i+n2);
    add+=1;
  }

  add = 2;
  x = 500;
  y = 475;
  treeH = 125;
  for (int i = int(y); i < y+treeH; i+=3) {
    // outside mults range, inside mult amount of cauxios 
    float n = noise(i * 0.025)*30;
    float n2 = noise(i * 0.03)*300;
    stroke(242+(n*3), 135, 5);
    line(x, i, x+n+add, i-n2);
    line(x, i, x-n-add, i-n2);
    add+=2;
  }

  add = 2;
  x = 200;
  y = 0;
  treeH = 125;
  for (int i = int(y+treeH); i > y; i-=3) {
    // outside mults range, inside mult amount of cauxios 
    float n = noise(i * 0.025)*30;
    float n2 = noise(i * 0.03)*300;
    stroke(242+(n*3), 135, 5);
    line(x, i, x+n+add, i+n2);
    line(x, i, x-n-add, i+n2);
    add+=2;
  }

  add = 2;
  x = 50;
  y = 450;
  treeH = 150;
  for (int i = int(y); i < y+treeH; i+=4) {
    // outside mults range, inside mult amount of cauxios 
    float n = noise(i * 0.03)*30;
    float n2 = noise(i * 0.04)*350;
    stroke(242+(n*2), 116, 5+(n*2));
    line(x, i, x+n+add, i-n2);
    line(x, i, x-n-add, i-n2);
    add+=1;
  }

  add = 2;
  x = 350;
  y = 0;
  treeH = 150;
  for (int i = int(y+treeH); i > y; i-=4) {
    // outside mults range, inside mult amount of cauxios 
    float n = noise(i * 0.03)*30;
    float n2 = noise(i * 0.04)*350;
    stroke(242+(n*2), 116, 5+(n*2));
    line(x, i, x+n+add, i+n2);
    line(x, i, x-n-add, i+n2);
    add+=1;
  }

  //add = 2;
  //x = 200;
  //y = 100;
  //treeH = 250;
  //for (int i = int(y); i < treeH; i+=5) {
  //  // outside mults range, inside mult amount of cauxios 
  //  float n = noise(i * 0.025)*100;
  //  float n2 = noise(i * 0.04)*300;
  //  stroke(129+(n*3), 90, 140);
  //  line(x,i,200+n+add,i-n2);
  //  line(x,i,200-n-add,i-n2);
  //  add+=2;
  //}


  //for(int y = height; y >300; y-=2) { 
  //for (int x=0; x<=width; x++) {
  //  y = random(300,600);
  //  n = noise(x);
  //  //n = noise(frameCount*100, random(y));
  //  x = map(n, 0, 1, 0,200);
  //  yadd = random(50,100);
  //  line(300,y,300+x,y-yadd);
  //  line(300,y,300-x,y-yadd);
  //}
  // }
}

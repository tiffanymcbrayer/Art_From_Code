Jellyfish j;
int num_jellys;
ArrayList<Jellyfish> jellys;

void setup() {
  size(600, 600);
  background(0);

  num_jellys = 40;
  jellys = new ArrayList<Jellyfish>();
  for (int i = 0; i < num_jellys; i++) {
    jellys.add(new Jellyfish(random(width), random(100, height-150), random(40, 50), random(30, 40), random(3, 5), random(30, 50), random(.2, 1), random(.2, 1), int(random(1, 5))));
  }
}

void draw() {
  background(0);



  fill(97, 108, 140);
  quad(0, 50, 0, height-50, width, height-50, width, 50);
  stroke(0);
  strokeWeight(3);
  quad(25, 0, 0, 50, width, 50, width-25, 0);

  line(25, height-125, 25, 0);
  line(width-25, height-125, width-25, 0);
  line(0, 3, width, 3);

  //sand 
  fill(166, 128, 81);
  strokeWeight(2);
  quad(0, height-50, 25, height-125, width-25, height-125, width, height-50);

  float x = 20;
  for (int i = 0; i < 11; i++) {
     stroke(215, 164, 98);
     strokeWeight(2); 
     bezier(x, height-52, x+10, height-75, x+40, height-100, x+50, height-122);
     float xAdd = 50;
     x += xAdd;
  }  


  noStroke();
  fill(200, 200, 200, 100);
  quad(0, height-50, 0, 50, width, 50, width, height-50);

  

  for (int i = 0; i < jellys.size(); i++) {
    jellys.get(i).update();
    jellys.get(i).checkEdges();
    jellys.get(i).display();
    jellys.get(i).keyReleased();
  }
  

  stroke(0);
  strokeWeight(3);
  line(0, 50, width, 50);
}

void keyPressed() {
  if (key == 'x') saveFrame("check_in_16_###tiffany.png");
}

class Jellyfish {
  
  float x, y;
  float headL, headW;
  float headLadd, headWadd;
  float legs;
  float speedx, speedy;
  float speedxdub, speedydub;
  float legLenght;
  float legMover;
  float legAdd;
  int colorChoose;
  
  
  
  Jellyfish(float _x, float _y, float _headL, float _headW, float _legs, float _legLenght, float _speedx, float _speedy, int _colorChoose) {
    x = _x;
    y = _y;
    headL = _headL;
    headW = _headW;
    headLadd = .2;
    headWadd = .2;
    legs = _legs;
    legLenght = _legLenght;
    speedx = _speedx;
    speedy = _speedy;
    legAdd = .2;
    colorChoose = _colorChoose;
    speedxdub = speedx;
    speedydub = speedy;
    
  }
  
  void checkEdges() {
    if (x > width - (headW/2.0)) speedxdub *= -1;
    if (x < (headW/2.0)) speedxdub *= -1;
    if (y > height - (headL/2.0)- legLenght-80) speedydub *= -1; 
    if (y < (headL/2.0)+30) speedydub *= -1;
    
    if(headW > 50) headWadd = -.2;
    if(headW < 40) headWadd = .2;
    if(headL > 40) headLadd = -.2;
    if(headL < 30) headLadd = .2;
    
    if (legMover > 5) legAdd -= .2;
    if (legMover < -5) legAdd += .2;
  }
  
  void update() {
    //x += speedx;
    //y += speedy;
    
    x += speedxdub;
    y += speedydub;
    
    headW += headWadd;
    headL += headLadd;
    legMover += legAdd;
    if (speedxdub > 3) speedxdub = speedx;
    if (speedydub > 3) speedydub = speedy;
  }  
  
  void keyReleased() {
    if (key == 's') {
      speedxdub += .01;
      speedydub += .01;
    }
  }
  
  void display() {
    
    // four random colors jellyfish could be 
    
    float yShadow = height - 110;
    // 186,53,237
    if (colorChoose == 1) {
      stroke(186,53,237,75);
      strokeWeight(5);
      noFill();
      float legSpacer = 20.0/(legs-1);
      float legStarting = x-(20.0/2);
      for (int i = 0; i < legs; i++){
        stroke(186,53,237,75);
        bezier(legStarting, y+5, legStarting+legMover, y+5+legLenght/3.0, legStarting-legMover, y+5+legLenght*2/3.0, legStarting, y+5+legLenght);
        stroke(100,100,100,75);
        bezier(legStarting, yShadow+5, legStarting+legMover, yShadow+5+legLenght/3.0, legStarting-legMover, yShadow+5+legLenght*2/3.0, legStarting, yShadow+5+legLenght);
        legStarting += legSpacer;
      }
      noStroke();
      fill(186,53,237, 200);
      ellipse(x,y,headW, headL);
      ellipse(x-5,y-5,headW-25, headL-20);
      ellipse(x-5,y+5,headW-25, headL-20);
      ellipse(x+5,y-5,headW-25, headL-20);
      ellipse(x+5,y+5,headW-25, headL-20);
      //shadow
      fill(100,100,100,100);
      ellipse(x,yShadow,headW, headL);
    }
    
    // 235,204,234
    if (colorChoose == 2) {
      strokeWeight(5);
      noFill();
      float legSpacer = 20.0/(legs-1);
      float legStarting = x-(20.0/2);
      for (int i = 0; i < legs; i++){
        stroke(235,204,234,75);
        bezier(legStarting, y+5, legStarting+legMover, y+5+legLenght/3.0, legStarting-legMover, y+5+legLenght*2/3.0, legStarting, y+5+legLenght);
        stroke(100,100,100,75);
        bezier(legStarting, yShadow+5, legStarting+legMover, yShadow+5+legLenght/3.0, legStarting-legMover, yShadow+5+legLenght*2/3.0, legStarting, yShadow+5+legLenght);
        legStarting += legSpacer;
      }
      noStroke();
      fill(235,204,234, 200);
      ellipse(x,y,headW, headL);
      ellipse(x-5,y-5,headW-25, headL-20);
      ellipse(x-5,y+5,headW-25, headL-20);
      ellipse(x+5,y-5,headW-25, headL-20);
      ellipse(x+5,y+5,headW-25, headL-20);
      //shadow
      fill(100,100,100,100);
      ellipse(x,yShadow,headW, headL);
    }
    
    // 193,113,223
    if (colorChoose == 3) {
      strokeWeight(5);
      noFill();
      float legSpacer = 20.0/(legs-1);
      float legStarting = x-(20.0/2);
      for (int i = 0; i < legs; i++){
        stroke(193,113,223,75);
        bezier(legStarting, y+5, legStarting+legMover, y+5+legLenght/3.0, legStarting-legMover, y+5+legLenght*2/3.0, legStarting, y+5+legLenght);
        stroke(100,100,100,75);
        bezier(legStarting, yShadow+5, legStarting+legMover, yShadow+5+legLenght/3.0, legStarting-legMover, yShadow+5+legLenght*2/3.0, legStarting, yShadow+5+legLenght);
        legStarting += legSpacer;
      }
      noStroke();
      fill(193,113,223, 200);
      ellipse(x,y,headW, headL);
      ellipse(x-5,y-5,headW-25, headL-20);
      ellipse(x-5,y+5,headW-25, headL-20);
      ellipse(x+5,y-5,headW-25, headL-20);
      ellipse(x+5,y+5,headW-25, headL-20);
      //shadow
      fill(100,100,100,100);
      ellipse(x,yShadow,headW, headL);
    }
    //195,234,245
    if (colorChoose == 4) {
      strokeWeight(5);
      noFill();
      float legSpacer = 20.0/(legs-1);
      float legStarting = x-(20.0/2);
      for (int i = 0; i < legs; i++){
        stroke(195,234,245,75);
        bezier(legStarting, y+5, legStarting+legMover, y+5+legLenght/3.0, legStarting-legMover, y+5+legLenght*2/3.0, legStarting, y+5+legLenght);
        stroke(100,100,100,75);
        bezier(legStarting, yShadow+5, legStarting+legMover, yShadow+5+legLenght/3.0, legStarting-legMover, yShadow+5+legLenght*2/3.0, legStarting, yShadow+5+legLenght);
        legStarting += legSpacer;
      }
      noStroke();
      fill(195,234,245, 200);
      ellipse(x,y,headW, headL);
      ellipse(x-5,y-5,headW-25, headL-20);
      ellipse(x-5,y+5,headW-25, headL-20);
      ellipse(x+5,y-5,headW-25, headL-20);
      ellipse(x+5,y+5,headW-25, headL-20);
      //shadow
      fill(100,100,100,100);
      ellipse(x,yShadow,headW, headL);
    }
    
  }
  
}

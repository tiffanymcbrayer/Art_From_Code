// Art From Code: Fall 2020 
// Miami Beach Boardwalk 

float time = 0;

Car c1, c2, c3, c4, c5, c6;
float x, y;
float theta1, theta2, theta3, theta4, theta5, theta6;

float tubeTimer = 0;
int tubeCounter = 0;
int tubeNums;
ArrayList<Tube> tubes;

HotAirBalloon balloon;
float baloonTimer= 0;

int umNums;
ArrayList<Umbrella> umbrellas;

int peopleNums;
ArrayList<People> peoples;
People beachPerson1;
People beachPerson2;

TrackLines lines;

float timeWater;
float xWater;

IceCreamStand stand;

float slideTimer = 0.0;

PImage mountain;
PImage Woodensign;

PFont chalkboard;
PFont icecream;

FerrisWheel fw;
float xFW, yFW;
float radiusFW;
float thetaFW;

ArrayList<Towels> towels;

void setup() {

  size(600, 700);
  background(239, 200, 196);
  
  mountain = loadImage("mountain.png"); 
  Woodensign = loadImage("Woodensign.png");

  towels = new ArrayList<Towels>();
  towels.add(new Towels(177,485, random(-2, -6), int(random(1, 3))));
  towels.add(new Towels(289,487, random(-2, -6), int(random(1, 3))));
  towels.add(new Towels(375,490, random(-2, -6), int(random(1, 3))));
  towels.add(new Towels(435,489, random(-2, -6), int(random(1, 3))));
  towels.add(new Towels(480,484, random(-2, -6), int(random(1, 3))));
  towels.add(new Towels(504,487, random(-2, -6), int(random(1, 3))));
  towels.add(new Towels(150, 525, random(-2, -6), int(random(1, 3))));
  towels.add(new Towels(179, 522, random(-2, -6), int(random(1, 3))));
  towels.add(new Towels(223, 512, random(-2, -6), int(random(1, 3))));
  towels.add(new Towels(248, 514, random(-2, -6), int(random(1, 3))));
  towels.add(new Towels(320, 520, random(-2, -6), int(random(1, 3))));
  towels.add(new Towels(370,520, random(-2, -6), int(random(1, 3))));
  towels.add(new Towels(475,520, random(-2, -6), int(random(1, 3))));
  towels.add(new Towels(525,517, random(-2, -6), int(random(1, 3))));
  towels.add(new Towels(558,520, random(-2, -6), int(random(1, 3))));

  balloon = new HotAirBalloon(475, 400);
  lines = new TrackLines();
  stand = new IceCreamStand();
  fw = new FerrisWheel(230, 200, 200);

  x = 0;
  y = 0;
  c1 = new Car(x, y+162.5, 1);
  c2 = new Car(x, y, 1);
  c3 = new Car(x, y+162.5, 3);
  c4 = new Car(x, y+162.5, 1);
  c5 = new Car(x, y+650, 2);
  c6 = new Car(x, y+200, 4);
  theta1 = PI/2;
  theta2 = 2.62*PI/2;
  theta3 = 3.58*PI/2;
  theta4 = 1.22*PI/2;
  theta5 = 2*PI - (3.5*PI/2);
  theta6 = 2.17*PI/2;

  tubeNums = 1;
  tubes = new ArrayList<Tube>();
  tubes.add(new Tube(random(.5, 1), random(.5, 1))) ;

  umNums = 12;
  umbrellas = new ArrayList<Umbrella>();
  for (int i = 0; i < umNums; i++) {
    umbrellas.add(new Umbrella(0, 0, random(20, 26), random(8, 12)));
  }

  peopleNums = 10;
  peoples = new ArrayList<People>();
  for (int i = 0; i < peopleNums; i++) {
    peoples.add(new People(random(100, 500), random(340, 400), .4, .05));
  }
  beachPerson1 = new People(550, 525, -.4, .05);
  beachPerson2 = new People(150, 480, .4, .05);

  chalkboard = createFont("chalkboard", 32);
  icecream = createFont("Trattatello", 32);
}

void keyReleased() {
  if (key == ' ') {
    tubes.add(new Tube(random(.5, 1), random(.5, 1)));
  }
  if (keyCode == DOWN) {
    if (balloon.balloonY < 250) balloon.balloonY+=10;
  }
  if (keyCode == UP) {
    if (balloon.balloonY > 50 )balloon.balloonY-=10;
  }
}

 
void draw() {  
  
  background(239, 200, 196);
  time+= 1;
  
  // Timer that adds tubes at the beginning 
  if (tubeCounter <= 2) tubeTimer+=.1;
  else {tubeTimer = 0;}
  if (tubeTimer > 14 && tubeTimer < 14.1) {
    tubes.add(new Tube(random(.5, 1), random(.5, 1)));
    tubeCounter++;
  }
  if (tubeTimer >15) tubeTimer = 0;
  
  
  // MOUNTAIN
  image(mountain,0,0);
  
  // SUN
  noStroke();
  fill(243, 243, 207);
  ellipse(550, 10, 60, 60);
  
  
///////////////// ROLLER COASTER START /////////////////

  // BACK ROW ROLLER COASTER
  // lines and arcs (yellow)
  lines.display2();
  noFill();
  stroke(10, 10, 100);
  stroke(242, 183, 5);
  strokeWeight(2);
  arc(400, 400, 650, 650, PI*1.2, PI*1.8);
  arc(65, 139, 200, 200, 1.24* PI/5, PI -(PI/7));
  // CARS 
  // car 5
  push();  
  translate(400, 400);
  rotate(theta5);
  scale(.50);
  if (time/10 >= 55 && time/10 <= 96.5) {
    c5.display();
  }
  pop();
  if (theta5 < 0) theta5 = 2*PI;
  theta5-= .005;
  // car 6
  push(); 
  translate(65, 140);
  rotate(theta6);
  scale(.50);
  if (time/10 >= 96.5) {
    c6.display();
  }
  pop();
  if (theta6 > 2*PI) theta6 = 0;
  theta6+= .015;

  // FRONT ROW ROLLER COASTER
  // lines and arcs (blue)
  lines.display();
  strokeWeight(3.5);
  stroke(10, 10, 100);
  stroke(4, 178, 217);
  arc(115, 175, 250, 250, PI, PI*1.82);
  line(221, 110, 282, 225);
  arc(397, 175, 250, 250, 1.26* PI/5, PI -(PI/7.5));
  line(485, 262, 489, 257);
  arc(596, 324, 250, 250, 2.355*PI/2, PI*1.6);
  // CARS
  // car 1
  push();
  translate(115, 175);
  rotate(theta1);
  scale(.75);
  if (time/10 <= 23.3) {
    c1.display();
  }
  if (time/10 >= 17.5 ) {
    theta1+=.002;
  }
  if (time/10 >= 19) {
    theta1+=.002;
  }
  pop();
  if (theta1 > 2*PI) theta1 = 0;
  theta1+= .01;
  // car 2 (no theta bc goes in straight line)
  push();
  translate(215, 104);
  rotate(theta2);
  scale(.75);
  if (time/10 >= 23.3 && time/10 <= 31) {
    c2.display();
    c2.move1();
  }
  pop();
  // car 3
  push();
  translate(395, 179);
  rotate(theta3);
  scale(.75);
  if (time/10 >= 31 && time/10 <= 44) {
    c3.display();
  }
  pop();
  if (theta3 < 0) theta3 = 2*PI;
  theta3-= .015;
  // car 4
  push();
  translate(595, 320);
  rotate(theta4);
  scale(.75);
  if (time/10 >= 44 && time/10 <= 55) {
    c4.display();
    theta4-= .003;
  }
  pop();
  if (theta4 > 2*PI) theta4 = 0;
  theta4+= .015;

  // resetting the cars to start from beginning
  if (time/10 == 110) {
    time = 0;
    theta1 = PI/2;
    theta2 = 2.62*PI/2;
    theta3 = 3.58*PI/2;
    theta4 = 1.22*PI/2;
    theta5 = 2*PI - (3.5*PI/2);
    theta6 = 2.17*PI/2;
    c2.original1();
  }

///////////////// ROLLER COASTER END /////////////////

  // FENCE
  noStroke();
  fill(100, 100, 100, 100);
  bezier(0, 445, width/3, 460, 2*width/3, 460, width, 445);
  rect(0, 445, width, -15);
  // wooden floor
  float counter = 0.0;
  for (int i = 320; i < 430; i+=2) {
    strokeWeight(2+counter);
    if (i%2 == 0) stroke(201, 156, 97,175);
    if (i%4 == 0) stroke(170, 110, 59,175);
    if (i%6 == 0) stroke(162, 102, 57,175);
    if (i%8 == 0) stroke(143, 86, 48,175);
    if (i%10 == 0) stroke(137, 84, 48,175);
    if (i%20 == 0) stroke(182, 125, 73,175);
    line(0, i, width, i);
    counter +=.04;
  }
  
  
  // HOT AIR BALLOON
  noStroke();
  balloon.display();
  image(Woodensign,505, 255);
  //rect(505, 260, 90, 40, 5);
  textAlign(CENTER, CENTER);
  textFont(chalkboard, 13);
  fill(250);
  text("Hot Air Balloon Ride!", 510, 238, 80, 80);
  strokeWeight(4);
  stroke(217, 160, 96);
  line(527, 238, 527, 262);
  line(572, 226, 572, 262);

  // ICE CREAM STAND
  noStroke();
  push();
  translate(0, 30);
  scale(.80);
  stand.display();
  pop();
  textAlign(CENTER, CENTER);
  textFont(icecream, 16);
  fill(240, 145, 160);
  text("Ice Cream", 11, 225, 80, 80);

  // FERRIS WHEEL 
  fw.display();
  fw.update();

  
  // PEOPLE on board walk
  noStroke();
  checkPeopleCollision();
  checkICcollision(0, 308, 85, 52);
  if (balloon.onBalloon == true) {
    baloonTimer+=.05;
  }
  for (int i = 0; i < peoples.size(); i++) {
    if (icecream(peoples.get(i).x, peoples.get(i).y, 0, 308, 85, 52) == true) peoples.get(i).icecream = true;

    if (hab(peoples.get(i).x, peoples.get(i).y, balloon.x, balloon.y, 20) == true && balloon.balloonY >200) {
      balloon.onBalloon = true;
    }
    if (baloonTimer> 0 && baloonTimer <= 20) balloon.balloonY-= .05;
    if (baloonTimer> 25 && baloonTimer <= 45) balloon.balloonY+= .05;
    if (baloonTimer > 45) {
      balloon.onBalloon = false;
      baloonTimer = 0;
    }

    peoples.get(i).display();
    peoples.get(i).move();
    peoples.get(i).checkEdges();
  }


  // FENCE cont
  fill(182, 125, 73);
  strokeWeight(3.5);
  stroke(140, 74, 50);
  bezier(0, 430, width/3, 440, 2*width/3, 440, width, 430);
  noFill();
  bezier(0, 410, width/3, 420, 2*width/3, 420, width, 410);
  strokeWeight(5);
  for (int i = 0; i*40 < width/2; i++) {
    line(i*40, 405+i, i*40, 445+i);
  }
  for (int i = 0; i*40 < width/2; i++) {
    line(320+(i*40), 405-i+7, 320+(i*40), 445-i+7);
  }

  // TOWELS 
  for (int i = 0; i < towels.size(); i++) {
    towels.get(i).display();
  }
  
  // UMBRELLAS top row 
  for (int i = 0; i < umbrellas.size(); i++) {
    push();
    if (i == 1) {
      translate(200, 450);
      rotate(.15);
    }
    if (i == 3) {
      translate(350, 450);
      rotate(-.15);
    }
    if (i == 7) {
      translate(500, 450);
      rotate(.12);
    }
    if (i == 9) {
      translate(580, 460);
      rotate(.14);
    }
    if (i == 10) {
      translate(280, 445);
      rotate(.1);
    }
    if (i == 11) {
      translate(420, 445);
      rotate(-.1);
    }
    umbrellas.get(i).display();
    pop();
  }
  
  // PEOPLE on beach top
  noStroke();
  beachPerson2.display();
  beachPerson2.move();
  beachPerson2.checkBeachEdge2();
  
  // UMBRELLAS bottom row 
  for (int i = 0; i < umbrellas.size(); i++) {
    push();
    if (i == 0) {
      translate(170, 485);
      rotate(.1);
    }
    if (i == 2) {
      translate(235, 475);
      rotate(-.1);
    }
    if (i == 4) {
      translate(340, 480);
      rotate(.1);
    }
    if (i == 5) {
      translate(390, 480);
      rotate(.13);
    }
    if (i == 6) {
      translate(455, 480);
      rotate(-.12);
    }
    if (i == 8) {
      translate(540, 480);
      rotate(-.15);
    }
    umbrellas.get(i).display();
    pop();
  }

  // WATER  
  timeWater += 0.01;
  xWater = 0;
  while (xWater < width) {
    stroke(147, 188, 179);
    strokeWeight(1);
    float n = 535 + 30 * noise(xWater/100, timeWater);
    line(xWater, n, xWater, height);
    stroke(216, 229, 238);
    point(xWater, n);
    if (xWater < width/4) point(xWater, n+100);
    if (xWater > width/4 && xWater < 2*width/4) point(xWater, n+50);
    if (xWater > 2*width/4 && xWater < 3*width/4) point(xWater, n+75);
    if (xWater > 3*width/4 && xWater < width) point(xWater, n+110);
    xWater++;
  }
  
  // PEOPLE on beach bottom
  noStroke();
  beachPerson1.display();
  beachPerson1.move();
  beachPerson1.checkBeachEdge1();


  // SLIDE 
  fill(100);
  noStroke();
  quad(35, 440, 39, 460, 61, 450, 51, 445);
  stroke(100);
  strokeWeight(2);
  line(60, 450, 60, 540);
  line(50, 450, 50, 530);
  line(50, 465, 60, 465);
  line(50, 502, 60, 502);
  
  // TUBES
  checkTubeToTubeCollision();
  for (int i = 0; i < tubes.size(); i++) {
    tubes.get(i).display2();
    tubes.get(i).slideMove();

    // SLIDE cont 
    noFill();
    strokeWeight(25);
    stroke(74, 172, 224);
    arc(40, 470, 50, 40, HALF_PI-.6, TWO_PI-2);
    arc(40, 504, 50, 40, HALF_PI-.6, TWO_PI-1);
    arc(40, 535, 50, 40, HALF_PI, TWO_PI-1);
    strokeWeight(3);
    stroke(30, 81, 137);
    arc(40, 470, 73, 62, HALF_PI-.7, TWO_PI-1.9);
    arc(40, 504, 73, 62, HALF_PI-.7, TWO_PI-2.6);
    arc(40, 535, 73, 62, HALF_PI+.4, TWO_PI-2.6);
    fill(30, 81, 137);
    ellipse(38, 480, 10, 2);
    ellipse(38, 514, 10, 2);
    ellipse(40, 555, 17, 15);

    if (tubes.get(i).y2 >= 500) {
      tubes.get(i).display();
      tubes.get(i).move();
      tubes.get(i).checkEdges();
    }
  }

  // covering the umbrellas not used from loop 
  noStroke();
  fill(239, 200, 196);
  ellipse(0,20,50,60);

  //fill(0);
  //text(mouseX, mouseX+15, mouseY);
  //text(mouseY, mouseX+15, mouseY+20);
}


///////////////// COLLISION FUNCTIONS /////////////////

// People collide w/ ice cream stand - display an ice cream cone 
boolean icecream(float x, float y, float rx, float ry, float rw, float rh) {
  if (x >= rx && x <= rx + rw && y >= ry && y <= ry + rh) return true;
  return false;
}

// People collide w/ ice cream stand - reverse direction of people speed 
void checkICcollision(float rx, float ry, float rw, float rh) {
  for (int i = 0; i < peoples.size(); i++) {
    if (peoples.get(i).x <= rx+rw && peoples.get(i).x >= rx && peoples.get(i).y < ry+rh) peoples.get(i).speedy *= -1;
    if (peoples.get(i).y <= ry+rh && peoples.get(i).y >= ry && peoples.get(i).x < rx+rw) peoples.get(i).speedx *= -1;
  }
}

// People collide w/ hot air balloon - display person in basket & balloon moves on timer 
boolean hab(float x, float y, float xCenter, float yCenter, float radius) {
  float d = dist(x, y, xCenter, yCenter);
  if (d < radius) return true;
  return false;
}

// Tube collides w/ slide - reverse direction of tube speed
void checkTubeSlidecollision(float rx, float ry, float rw, float rh) {
  for (int i = 0; i < tubes.size(); i++) {
    if (tubes.get(i).x <= rx+rw && tubes.get(i).x >= rx && tubes.get(i).y < ry+rh) tubes.get(i).speedy *= -1;
    if (tubes.get(i).y <= ry+rh && tubes.get(i).y >= ry && tubes.get(i).x < rx+rw) tubes.get(i).speedx *= -1;
  }
}

// People collide w/ another person - reverse direction of people speed 
void checkPeopleCollision() {
  if (peoples.size() > 1) {
    for (int i = 0; i < peoples.size(); i++) {
      for (int j = i+1; j < peoples.size(); j++) {
        float dx = peoples.get(j).x - peoples.get(i).x;
        float dy = peoples.get(j).y - peoples.get(i).y;
        float dist = sqrt(dx * dx + dy * dy);
        if (dist < 5) {
          peoples.get(i).speedx *= -1;
          peoples.get(i).speedy *= -1;
          peoples.get(j).speedx *= -1;
          peoples.get(j).speedy *= -1;
        }
      }
    }
  }
}

// Tube collides w/ another tube - reverse direction of tube speed 
void checkTubeToTubeCollision() {
  if (tubes.size() > 1) {
    for (int i = 0; i < tubes.size(); i++) {
      for (int j = i+1; j < tubes.size(); j++) {
        float dx = tubes.get(j).x - tubes.get(i).x;
        float dy = tubes.get(j).y - tubes.get(i).y;
        float dist = sqrt(dx * dx + dy * dy);
        if (dist < (tubes.get(j).tubeWidth + tubes.get(i).tubeWidth)) {
          tubes.get(i).speedx *= -1;
          tubes.get(i).speedy *= -1;
          tubes.get(j).speedx *= -1;
          tubes.get(j).speedy *= -1;
        }
      }
    }
  }
}

///////////////// CAR CLASS /////////////////

class Car {

  float x, y;
  float orientation;
  float origX, origY;

  Car(float _x, float _y, int _orientation) {
    x = _x;
    y = _y;
    origX = x;
    origY = y;
    orientation =_orientation;
  }
  
  void move1() {
    x -= 2*1.4;
    y -= .25;
  }
  
  void original1() {
    x = origX;
    y = origY;
  }

  void display() {
    
    if (orientation == 1){
      // car 
      fill(3, 90, 166);
      noStroke();
      rect(x-1,y,31,15);
      rect(x+10,y,+20,30,5);
      rect(x,y,-30,15);
      ellipse(x-20,y+15,20,20);
      
      //person
      fill(251,224,137);
      ellipse(x,y+20,20,18);
      
      //wheels
      fill(19,37,54);
      circle(x-20,y,10);
      circle(x+20,y,10);
    }
    if (orientation == 2){
      // car 
      fill(3, 90, 166);
      noStroke();
      rect(x,y,31,15);
      rect(x-30,y,20,30,5);
      rect(x,y,-30,15);
      ellipse(x+20,y+15,20,20);
      
      //person
      fill(251,224,137);
      ellipse(x,y+20,20,18);
      
      //wheels
      fill(19,37,54);
      circle(x-20,y,10);
      circle(x+20,y,10);
    }
    if (orientation == 3){
      //car
      fill(3, 90, 166);
      noStroke();
      rect(x,y,-30,-15);
      rect(x-10,y,-20,-30,5);
      rect(x,y,30,-15);
      ellipse(x+20,y-15,20,20);
      
      //person
      fill(251,224,137);
      ellipse(x,y-20,20,18);
      
      //wheels
      fill(19,37,54);
      circle(x-20,y,10);
      circle(x+20,y,10);
    }
    if (orientation == 4){
      //car
      fill(3, 90, 166);
      noStroke();
      rect(x,y,-30,-15);
      rect(x+30,y,-20,-30,5);
      rect(x,y,30,-15);
      ellipse(x-20,y-15,20,20);
      
      //person
      fill(251,224,137);
      ellipse(x,y-20,20,18);
      
      //wheels
      fill(19,37,54);
      circle(x-20,y,10);
      circle(x+20,y,10);
    }
  }
}

///////////////// FERRIS WHEEL CLASS /////////////////


class FerrisWheel {

  float x, y;
  float radius;
  float theta;
  float theta2;

  FerrisWheel(float _x, float _y, float _radius) {
    x = _x;
    y = _y;
    radius= _radius;
    theta = 0.0;
    theta2 = 0.0;
  }
  void update() {
    theta += .005;
    theta2 += .005;
  }

  void display() {

    fill(192, 56, 47);
    
    noFill();
    stroke(237,98,95);
    circle(x, y, 40);
    circle(x, y, radius);
    circle(x, y, radius-30);
    triangle(x,y,x-50,y+130,x+50,y+130);
    
    for (int i = 0; i <8; i++) {
      push();
      translate(x, y);
      rotate(theta+((PI/4)*i));
      car();
      line(0,0,(radius/2.9),(radius/2.9));
      pop();
    }
  }

  void car() {
    stroke(255, 133, 155);
    fill(255, 133, 155);
    ellipse(radius/2+17, 0,7,7);
    stroke(237,98,95);
    fill(237,98,95);
    rect(radius/2+5, 0, 10, 10,2);
    rect(radius/2+5, 0, 10, -10,2);
  }
}

///////////////// HOT AIR BALLOON CLASS /////////////////

class HotAirBalloon {

  float x, y;
  float time;
  float balloonY;
  boolean onBalloon;
  boolean up;
  boolean down;
  HotAirBalloon(float _x, float _y) {
    x = _x;
    y = _y; 
    time = 0.0;
    balloonY = 100;
    onBalloon = false;
  }

  void moveDown() {
      if (balloonY <= 200) {
        balloonY+=.1;
      }
  }

  void display() {
    time += 0.01;

    float n = balloonY + 100 * noise(x/100, time);
    strokeWeight(2);
    stroke(217, 160, 96);
    line(x, n, x, y);
    noStroke(); 
    fill(10, 30, 110);
    fill(255, 133, 155);

    fill(237, 98, 95);
    ellipse(x, n-60, 60, 80);
    fill(117, 198, 219);
    ellipse(x, n-60, 50, 80);
    fill(237, 98, 95);
    ellipse(x, n-60, 40, 80);
    fill(117, 198, 219);
    ellipse(x, n-60, 30, 80);
    fill(237, 98, 95);
    ellipse(x, n-60, 15, 80);

    if (onBalloon == true) {
      fill(255, 133, 155);
      circle(x, n-7, 10);
    }
    fill(177, 116, 84);
    rect(x-15, n-5, 30, 20, 5);
    stroke(140, 74, 50);
    strokeWeight(1);
    line(x-14,n+6,x-5,n+14);
    line(x-14,n+1,x-1,n+14);
    line(x-14,n-4,x+4,n+14);
    line(x-9,n-4,x+9,n+14);
    line(x-4,n-4,x+13,n+13);
    line(x+1,n-4,x+13,n+8);
    line(x+6,n-4,x+13,n+3);
    
    line(x+14,n+6,x+5,n+14);
    line(x+14,n+1,x+1,n+14);
    line(x+14,n-4,x-4,n+14);
    line(x+9,n-4,x-9,n+14);
    line(x+4,n-4,x-13,n+13);
    line(x-1,n-4,x-13,n+8);
    line(x-6,n-4,x-13,n+3);
    
    stroke(177, 116, 84);
    strokeWeight(1);
    line(x-14, n-4, x-25, n-40);
    line(x+14, n-4, x+25, n-40);
    line(x-8, n-4, x-14, n-30);
    line(x+8, n-4, x+14, n-30);
  }
}

///////////////// ICE CREAM STAND CLASS /////////////////

class IceCreamStand{
  
  IceCreamStand(){}
  
  void display() {
    fill(240,145,160);
    rect(40,360,50,30);
    fill(198,111,122);
    fill(142,56,65);
    rect(40,360,50,4);
    fill(92,53,43);
    rect(35,360,60,-8);
    fill(10);
    rect(45,390,40,3);
    
    //wheels
    circle(85,395,5);
    circle(45.5,398,4);
    noFill();
    stroke(10);
    strokeWeight(3);
    circle(85,395,20);
    strokeWeight(2);
    circle(45,398,14);
    line(85,385,85,405);
    line(75,395,95,395);
    line(77,402,90,390);
    line(77,388,90,400);
    strokeWeight(1.5);
    line(45,391,45,405);
    line(38,398,52,398);
    line(40,403,50,393);
    line(40,394,50,402);
    
    
    line(40,352,40,340);
    line(90,352,90,340);
    
    strokeWeight(8);
    stroke(198,111,122);
    line(37,315,33,340);
    line(93,315,97,340);
    stroke(255);
    line(45,315,41,340);
    line(85,315,89,340);
    stroke(198,111,122);
    line(51,315,49,340);
    line(79,315,81,340);
    stroke(255);
    line(59,315,57,340);
    line(71,315,73,340);
    stroke(198,111,122);
    line(65,315,65,340);
    
    //awning 
    noStroke();
    fill(255);
    rect(32.5,290,65,25);
  }
}

///////////////// PEOPLE CLASS /////////////////

class People {

  float x, y;
  float speedx, speedy;
  float bounce;
  float time;
  boolean icecream;
  People(float _x, float _y, float _speedx, float _speedy) {
    x = _x;
    y = _y;
    speedx = _speedx;
    speedy = _speedy;
    time = 0.0;
    int randomSpeed = int(random(4));
    if (randomSpeed %2 == 0) speedx *= -1;
    icecream = false;
  }

  void display() {
    time += 0.01;
    float n = y + 20 * noise(x/50, time);
    fill(255, 133, 155);
    triangle(x, n, x-8, n+15, x+8, n+15);
    ellipse(x, n-7, 10, 10);
    if (icecream == true) {
      fill(246, 191, 131);
      triangle(x-8, n+8, x-11, n+2, x-5, n+2);
      fill(244, 183, 187);
      circle(x-8, n-1, 7);
    }
  }

  void move() {
    x+= speedx;
    y+= speedy;
  }

  void checkEdges() {
    if (x > width-10) {
      speedx *= -1;
      x = width-10;
    }
    if (x < 10) {
      speedx *= -1;
      x = 10;
    }
    if (y > 415 - 15) {
      speedy *= -1;
      y = 415 - 15;
    }
    if (y < 320 - 12) {
      speedy *= -1;
      y = 320 - 12;
    }
  }

  void checkBeachEdge1() {
    if (x > width-10) {
      speedx *= -1;
      x = width-10;
    }
    if (x < 110) {
      speedx *= -1;
      x = 110;
    }
    if (y > 525) {
      speedy *= -1;
      y = 525;
    }
    if (y < 500) {
      speedy *= -1;
      y = 500;
    }
  }

  void checkBeachEdge2() {
    if (x > width-10) {
      speedx *= -1;
      x = width-10;
    }
    if (x < 115) {
      speedx *= -1;
      x = 115;
    }
    if (y > 490) {
      speedy *= -1;
      y = 490;
    }
    if (y < 475) {
      speedy *= -1;
      y = 475;
    }
  }
}

///////////////// TOWELS CLASS /////////////////

class Towels {
  
  float x,y;
  float tilt;
  int c;
  
  Towels(float _x, float _y, float _tilt, int _c){
    x = _x;
    y = _y;
    tilt = _tilt;
    c = _c;
  }
  
  void display() {
    noStroke();
    if (c == 1) fill(237,98,95);
    if (c == 2) fill(117,198,219);
    quad(x-4-tilt, y-12+tilt, x-13+tilt, y+12+tilt, x+4+tilt, y+12-tilt, x+13-tilt,y-12-tilt);
    stroke(255);
    strokeWeight(2.3);
    line(x-tilt, y-12, x-8+tilt, y+11);
    line(x+7-tilt, y-12, x-1+tilt, y+11);
  }
}

///////////////// TRACK LINES CLASS /////////////////

class TrackLines {

  TrackLines() {}

  void display() {
    // creating the track
    strokeWeight(2);
    stroke(11, 11, 110, 120);
    stroke(128, 221, 242);
    line(0, 320, 0, 130);
    line(25, 320, 25, 90);
    line(50, 320, 50, 68);
    line(75, 320, 75, 55);
    line(100, 320, 100, 50);
    line(125, 320, 125, 50);
    line(150, 320, 150, 55);
    line(175, 320, 175, 68);
    line(200, 320, 200, 85);
    line(225, 320, 225, 120);
    line(250, 320, 250, 166);
    line(275, 320, 275, 215);
    line(300, 320, 300, 255);
    line(325, 320, 325, 280);
    line(350, 320, 350, 292);
    line(375, 320, 375, 300);
    line(400, 320, 400, 300);
    line(425, 320, 425, 298);
    line(450, 320, 450, 289);
    line(475, 320, 475, 274);
    line(500, 320, 500, 244);
    line(525, 320, 525, 223);
    line(550, 320, 550, 210);
    line(575, 320, 575, 204);
    line(600, 320, 600, 200);
    
    stroke(128, 221, 242,200);
    
    line(-50,320,20,94);
    line(-25,320,55,66);
    line(0,320,83,56);
    line(25,320,110,51);
    line(50,320,134,54);
    line(75,320,156,59);
    line(100,320,178,70);
    line(125,320,200,85);
    line(150,320,217,108);
    line(175,320,233,135);
    line(200,320,250,165);
    line(225,320,265,194);
    line(250,320,280,223);
    line(275,320,297,251);
    line(300,320,316,272);
    line(325,320,337,286);
    line(350,320,356,295);
    line(375,320,383,301);
    line(400,320,408,300);
    line(425,320,435,295);
    line(450,320,464,282);
    line(475,320,498,247);
    line(500,320,535,217);
    line(525,320,562,206);
    line(550,320,580,201);
    line(575,320,675,0);
    line(600,320,700,0);
    
    line(25,320,-75,0);
    line(50,320,-50,0);
    line(75,320,10,110);
    line(100,320,27,88);
    line(125,320,48,71);
    line(150,320,69,60);
    line(175,320,91,53);
    line(200,320,117,52);
    line(225,320,142,54);
    line(250,320,170,65);
    line(275,320,201,87);
    line(300,320,253,172);
    line(325,320,306,264);
    line(350,320,338,287);
    line(375,320,368,298);
    line(400,320,394,302);
    line(425,320,419,300);
    line(450,320,442,293);
    line(475,320,463,283);
    line(500,320,484,266);
    line(525,320,502,242);
    line(550,320,521,226);
    line(575,320,542,213);
    line(600,320,564,205);
    line(625,320,593,201);    
  }
  
  void display2() {
    
    strokeWeight(1.5);
    stroke(11, 11, 110, 100);
    stroke(242, 203, 5);
    line(12.5,320,12.5,225);
    line(37.5,320,37.5,235);
    line(62.5,320,62.5,240);
    line(87.5,320,87.5, 238);
    line(112.5,320,112.5,229);
    line(137.5,320,137.5,210);
    line(162.5,320,162.5,179);
    line(187.5,320,187.5,156);
    line(212.5,320,212.5,135);
    line(237.5,320,237.5,120);
    line(262.5,320,262.5,106);
    line(287.5,320,287.5,97);
    line(312.5,320,312.5,88);
    line(337.5,320,337.5,82);
    line(362.5,320,362.5,79);
    line(387.5,320,387.5,77);
    line(412.5,320,412.5,77);
    line(437.5,320,437.5,79);
    line(462.5,320,462.5,83);
    line(487.5,320,487.5,89);
    line(512.5,320,512.5,97);
    line(537.5,320,537.5,107);
    line(562.5,320,562.5,120);
    line(587.5,320,587.5,134);
    
    line(-12.5,320,18,229);
    line(25-12.5,320,40,238);
    line(50-12.5,320,63,241);
    line(75-12.5,320,90,238);
    line(100-12.5,320,119,226);
    line(125-12.5,320,159,185);
    line(150-12.5,320,192,152);
    line(175-12.5,320,227,125);
    line(200-12.5,320,254,112);
    line(225-12.5,320,284,99);
    line(250-12.5,320,312,89);
    line(275-12.5,320,338,84);
    line(300-12.5,320,364,80);
    line(325-12.5,320,391,78);
    line(350-12.5,320,415,78);
    line(375-12.5,320,439,80);
    line(400-12.5,320,463,83);
    line(425-12.5,320,485,89);
    line(450-12.5,320,509,96);
    line(475-12.5,320,531,104);
    line(500-12.5,320,552,115);
    line(525-12.5,320,575,128);
    line(550-12.5,320,585,142);
    line(575-12.5,320,675-12.5,0);
    line(600-12.5,320,700-12.5,0);
    
    line(25-12.5,320,-75-12.5,0);
    line(50-12.5,320,6,225);
    line(75-12.5,320,36,238);
    line(100-12.5,320,62,241);
    line(125-12.5,320,87,239);
    line(150-12.5,320,110,231);
    line(175-12.5,320,130,217);
    line(200-12.5,320,149,196);
    line(225-12.5,320,168,175);
    line(250-12.5,320,186,157);
    line(275-12.5,320,206,142);
    line(300-12.5,320,229,126);
    line(325-12.5,320,249,115);
    line(350-12.5,320,271,105);
    line(375-12.5,320,292,95);
    line(400-12.5,320,316,88);
    line(425-12.5,320,338,83);
    line(450-12.5,320,362,81);
    line(475-12.5,320,387,78);
    line(500-12.5,320,411,78);
    line(525-12.5,320,437,80);
    line(550-12.5,320,463,84);
    line(575-12.5,320,490,90);
    line(600-12.5,320,519,100);
    line(625-12.5,320,548,114);
    line(650-12.5,320,575,132);
    
  }
}

///////////////// TUBE CLASS /////////////////

class Tube {

  float x, y;
  float speedx, speedy;
  float tubeWidth;
  float x2, y2;
  boolean visible;

  Tube(float _speedx, float _speedy) {
    x = 40;
    y = 560;
    speedx = _speedx;
    speedy = _speedy;
    tubeWidth = 15;
    x2 = 50;
    y2 = 445;
    visible = true;
  }

  void checkEdges() {
    if (x > width-tubeWidth) {
      speedx *= -1;
      x = width-tubeWidth;
    }
    if (x < tubeWidth) {
      speedx *= -1;
      x = tubeWidth;
    }
    if (y < height - 140+(tubeWidth/2)) {
      speedy *= -1;
      y = height - 140+(tubeWidth/2);
    }
    if (y > height - (tubeWidth/2)) {
      speedy *= -1;
      y = height - (tubeWidth/2);
    }
  }

  void move() {
    x+= speedx;
    y+= speedy;
  }

  void display() {

    noStroke();
    fill(93, 156, 188);
    ellipse(x, y, tubeWidth*2, tubeWidth);
    fill(119, 195, 242);
    ellipse(x, y-3, 5*3, 5);

    fill(255, 133, 155, 200);
    triangle(x-5, y-10, x, y+5, x+9, y-2);
    ellipse(x-8, y-13, 8, 8);
  }

  void slideMove() {
    x2--;
    y2+=.5;
    if (x2 < 25) {
      //x2 = 25;
      //y2 = 457;
      visible = false;
    }
  }

  void display2() {
    if (visible == true) {
      noStroke();
      fill(93, 156, 188);
      ellipse(x2, y2, tubeWidth*2, tubeWidth);
      fill(119, 195, 242);
      ellipse(x2, y2-3, 5*3, 5);

      fill(255, 133, 155, 200);
      triangle(x2+5, y2-10, x2, y2+5, x2-9, y2-2);
      ellipse(x2+8, y2-13, 8, 8);
    }
  }
}

///////////////// UMBRELLA CLASS /////////////////

class Umbrella {
  
  float x,y;
  float shadowW,shadowH;
  
  Umbrella(float _x, float _y, float _shadowW, float _shadowH) {
    x = _x;
    y = _y;
    shadowW = _shadowW;
    shadowH = _shadowH;
  }
  
  void display(){
    
    stroke(100);
    strokeWeight(1.5);
    line(x,y,x,y+40);
    noStroke();
    
    fill(237,98,95);
    triangle(x,y, x-15,y+18, x-25,y+15);
    fill(117,198,219);
    triangle(x,y,x-5,y+20,x-15,y+18);
    fill(237,98,95);
    triangle(x,y, x-5,y+20,x+5,y+20);
    fill(117,198,219);
    triangle(x,y,x+5,y+20,x+15,y+18);
    fill(300);
    ellipse(x,y-5,10,5);
    fill(237,98,95);
    triangle(x,y,x+15,y+18, x+25,y+15);
    
    fill(100,100,100,150);
    ellipse(x-5,y+40,shadowW,shadowH);   
  }
}

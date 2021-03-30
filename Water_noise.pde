
float x, y;
float time;

void setup() {
  size(600, 600);
  background(255);
  time = 0.0;
}

void draw() {
  background(255);
  time += 0.01;
  x = 0;
  y = 0;
  //a while loop
  while ( x < width) {
    stroke(145, 190, 212);
    stroke(51, 69, 97);
    strokeWeight(0.2);
    
    line(x, -50+ 200 * noise(x/100, time), x, -height);
    line(x, 450 + 200 * noise(x/100, time), x, height); 
    line(450 + 200 * noise(y/100, time), y, width, y); 
    line(-50+ 200 * noise(y/100, time), y, -width, y); 
    
    line(x, 200 * noise(x/100, time), x, -height);
    line(x, 400 + 200 * noise(x/100, time), x, height); 
    line(400 + 200 * noise(y/100, time), y, width, y); 
    line(200 * noise(y/100, time), y, -width, y); 
    
    line(x, 50+ 200 * noise(x/100, time), x, -height);
    line(x, 350 + 200 * noise(x/100, time), x, height); 
    line(350 + 200 * noise(y/100, time), y, width, y); 
    line(50+ 200 * noise(y/100, time), y, -width, y); 
    
    line(x, 100+ 200 * noise(x/100, time), x, -height);
    line(x, 300 + 200 * noise(x/100, time), x, height); 
    line(300 + 200 * noise(y/100, time), y, width, y); 
    line(100+ 200 * noise(y/100, time), y, -width, y); 
    
    line(x, 150+ 200 * noise(x/100, time), x, -height);
    line(x, 250 + 200 * noise(x/100, time), x, height); 
    line(250 + 200 * noise(y/100, time), y, width, y); 
    line(150+ 200 * noise(y/100, time), y, -width, y); 
    
    line(x, 175+ 200 * noise(x/100, time), x, -height);
    line(x, 225 + 200 * noise(x/100, time), x, height); 
    line(225 + 200 * noise(y/100, time), y, width, y); 
    line(175+ 200 * noise(y/100, time), y, -width, y); 
    
    x += 1;
    y +=1;
  }
}

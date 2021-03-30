
float ymoveh = 50;
float ymovem = 150;
float ymoves = 250;

void setup() {
  size(600, 400);
  
}

void draw() {
  //background(mapped_back);
  float h = hour();
  float m = minute();
  float s = second();
  float totalS =  s;
  //float totalS = (h*3600) + (m*60) + s;
  
  float mapped_s = map(s,0,59,0,width);
  float mapped_m = map(m,0,59,0,width);
  float mapped_h = map(h%12,0,12,0,width);
  
  float mapped_back = map(totalS, 0, 59, 0, 255);
  
  background(100, 100,mapped_back);
  
  // hour hills
  noStroke();
  fill(196,188,219);
  bezier(0,150,mapped_h-10,50,mapped_h+10,50, width,150);
  circle(mapped_h,50,40);
  rect(0,150,width,100);
  fill(203,196,225);
  bezier(0,200,width-mapped_h-10,100,width-mapped_h+10,100, width,200);
  fill(212,205,231);
  bezier(0,200,mapped_h-10,150,mapped_h+10,150, width,200);
  rect(0,200,width,100);
  
  // minute hills
  fill(188,206,238);
  bezier(0,250,mapped_m-10,150,mapped_m+10,150, width,250);
  circle(mapped_m,150,40);
  rect(0,250,width,100);
  fill(195,217,242);
  bezier(0,300,width -mapped_m+10,200,width - mapped_m+10,200, width,300);
  fill(218,229,245);
  bezier(0,300,mapped_m+10,250,mapped_m+10,250, width,300);
  rect(0,300,width,100);
  
  // second hills
  fill(229,190,214);
  bezier(0,350,mapped_s-10,250,mapped_s+10,250, width,350);
  circle(mapped_s,250,40);
  rect(0,350,width,100);
  fill(237,198,221);
  bezier(0,400,width -mapped_s+10,300,width - mapped_s+10,300, width,400);
  fill(242,217,232);
  bezier(0,400,mapped_s+10,350,mapped_s+10,350, width,400);
  
  // hour bubble
  fill(mapped_back, 100, 100);
  if (ymoveh < -10) ymoveh = 50;
  ymoveh--;
  circle(mapped_h, ymoveh,20);
  
  // minutes bubbles
  if (ymovem < -10) ymovem = 150;
  ymovem--;
  circle(mapped_m, ymovem, 20);
  
  // seconds bubbles 
  if (ymoves < -10) ymoves = 250;
  ymoves--;
  circle(mapped_s, ymoves, 20);
  
  // circle where text will go
  fill(196,188,219);
  circle(mapped_h,50,40);
  fill(188,206,238);
  circle(mapped_m,150,40);
  fill(229,190,214);
  circle(mapped_s,250,40);
  
 
  // text of the numbers being centered in bubbles
  fill(255);
  int hdecimal = 8;
  int mdecimal = 8;
  int sdecimal = 8;
  if (int(h%12) < 10) hdecimal = 5;
  text(int(h%12), mapped_h-hdecimal, 55);
  if (int(m)< 10) mdecimal = 5;
  text(int(m), mapped_m-mdecimal, 155);
  if (int(s) < 10) sdecimal = 5;
  text(int(s), mapped_s-sdecimal, 255);
  

  
}


void setup() {
  size(600, 600);
  background(255);

  float xAdd = 45; // 25
  float yAdd = 45; // 25, 10
  float ss = 20; // sqaureSize but put ss so easier to read quad line

  float xws = xAdd/2.0+1; //xWallSpacer
  float yws = yAdd/2.0+1; //yWallSpacer

  float counter = .6;
  float green = 0;

  for (int i = 0; i < 4; i++) {
    for (int y = 0; y< height; y++) {
      for (int x = 0; x< width; x++) {
        //stroke(167, 200-green, 242);

        noFill();
        //float tilter = random(-.5-counter, .5+counter);
        float tilter = random(-counter, counter);

        quad(x-ss+xws-tilter, y-ss+yws+tilter, x-ss+xws+tilter, y+ss+yws+tilter, x+ss+xws+tilter, y+ss+yws-tilter, x+ss+xws-tilter, y-ss+yws-tilter);
        x+=xAdd;
      }
      y+=yAdd;
      yAdd += 2;
      counter += .6;
      green -= 20;
    }
    counter =0;
    yAdd = 45;
    ss -=5;
    green = 0;
  }
}

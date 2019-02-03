import processing.sound.*;
Soundfile file;

float angle = 0.0;
float w = 24;
float magicAngle;

void setup() {
  size(600, 600, P3D);
  magicAngle = atan(1/sqrt(2));
}

void draw() {
  background(0);
  ortho(-500, 500, -500, 500, -1000, 1000);
  ambientLight(255, 255, 255, 0, -1, 0);
  translate(width/2, height/2 + 50, -50);
  rotateX(-QUARTER_PI);
  rotateY(magicAngle);

  rectMode(CENTER);

  //rotateX(angle * 0.25);
  float offset = 0;
  for (int z=0; z < height; z += w) {
    for (int x=0; x < width; x += w) {
      push();
      float a = angle + offset;
      float h = sin(a)*50 +50;

      translate(x -width/2, 0, z - height/2);
      ambient(255);
      box(w-2, h, w-2);

      pop();
    }
    offset += +0.1;
  }
  angle += 0.1;
}

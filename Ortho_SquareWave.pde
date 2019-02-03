import ddf.minim.*; //<>//
import ddf.minim.analysis.*;
Minim minim;
AudioPlayer song;

color c;

float angle = 0.0;
float w = 148;
float magicAngle;
float a = 0.0;
float offset = 0.0;

int tempBeat;
int spacing = 10;
int amplification = 5; 


void setup() {
  size(600, 600, P3D);
  magicAngle = atan(1/sqrt(2));

  minim = new Minim(this);
  song = minim.loadFile("four_tet_planet.mp3");
  song.play();
  smooth(4);
}

void draw() {
  background(0);
  ortho(-500, 500, -500, 500, -1000, 1000);
  ambientLight(255, 255, 255, 0, -1, 0);
  translate(width/2, height/2, 0);
  rotateX(-QUARTER_PI);
  rotateY(magicAngle);
  rectMode(CENTER);

  float amplitude = song.mix.level() * amplification * 100;

  if (song.position() < 15400) {
    push();
    //translate(x -width/2, 0, z - height/2);
    box(width/12, amplitude, height/12);
    offset += 0.1;
    pop();
  }

  if (song.position() < 30400 && song.position() > 15400) {
    for (int x=0; x <width; x +=w) {
      push();
      translate(x -width/2, 0, 0);
      box(w-200, amplitude, w-200);
      offset += 0.1;
      pop();
    }
  }
  if (song.position() < 45400 && song.position() > 30400) {
    for (int x=0; x <width; x +=w) {
      push();
      translate(0, 0, x- width/2);
      box(w-200, amplitude, w-200);
      offset += 0.1;
      pop();
    }
  }


  for (int z=0; z < height; z += w) {
    for (int x=0; x < width; x += w) {
      float freqMix = map(song.mix.get(int(x)), -1, 1, 0, 100);
      float freqLeft = map(song.left.get(int(x)), -1, 1, 0, 100);
      float freqRight = map(song.right.get(int(x)), -1, 1, 0, 100);
      float a = angle + offset;
      if (song.position() < 75400 && song.position() > 45400) {
        push();
        translate(x -width/2, 0, z - height/2);
        box(w-100, amplitude, w-100);
        offset += 0.1;
        pop();
      }

      if (song.position() < 106400 && song.position() > 75400) {
        push();
        translate(x -width/2, 0, z - height/2);
        box(round(freqLeft-2), amplitude, round(freqRight-2));
        offset += 0.1;
        pop();
      }

      if (song.position() < 136400 && song.position() > 106400) {
        push();
        translate(x -width/2, 0, z - height/2);
        colorMode(HSB, 100);
        c = color(freqMix, freqMix, amplitude);
        fill(c);
        box(round(freqLeft-2), amplitude, round(freqRight-2));
        offset += 0.1;
        pop();
      }
      if (song.position() < 151400 && song.position() > 136400) {
        push();
        translate(x -width/2, 0, z - height/2);
        box(round(freqLeft-2), amplitude, round(freqRight-2));
        offset += 0.1;
        pop();
      }
      if (song.position() < 182400 && song.position() > 151400) {
        push();
        translate(x -width/2, 0, z - height/2);
        colorMode(HSB, 100);
        c = color(freqMix, freqMix, amplitude);
        fill(c);
        box(round(freqLeft-2), amplitude, round(freqRight-2));
        offset += 0.1;
        pop();
      }
      if (song.position() < 212000 && song.position() > 182400) {
        push();
        translate(x -width/2, 0, z - height/2);
        box(w-100, amplitude, w-100);
        offset += 0.1;
        pop();
      }
      if (song.position() < 242200 && song.position() > 212000) {
        push();
        rotateY(sin(offset * random(0.0, 0.01)));
        translate(x -width/2, 0, z - height/2);
        colorMode(HSB, 100);
        c = color(freqMix, freqMix, amplitude);
        fill(c);
        box(w-100, amplitude, w-100);
        offset += 0.1;
        pop();
      }
      if (song.position() < 318000 && song.position() > 242200) {
        push();
        translate(x -width/2, 0, z - height/2);
        colorMode(HSB, 100);
        c = color(freqMix, freqMix, amplitude);
        fill(c);
        box(round(freqLeft-2), amplitude, round(freqRight-2));
        offset += 0.1;
        pop();
      }
      if (song.position() < 325400 && song.position() > 318000) {
        push();
        colorMode(HSB, 100);
        c = color(freqMix, freqMix, amplitude);
        fill(c);
        box(width/12, amplitude, height/12);
        offset += 0.1;
        pop();
      }
      if (song.position() < 348400 && song.position() > 325400) {
        push();
        translate(x -width/2, 0, z - height/2);
        colorMode(HSB, 100);
        c = color(freqMix, freqMix, amplitude);
        fill(c);
        box(round(freqLeft-2), amplitude, round(freqRight-2));
        offset += 0.1;
        pop();
      }
      if (song.position() > 348400) {
        push();
        translate(x -width/2, 0, z - height/2);
        box(round(freqLeft-2), amplitude, round(freqRight-2));
        offset += 0.1;
        pop();
      }
    }
    angle += 0.1;
  }
}

void stop() {
  song.close();
  minim.stop();
  super.stop();
}

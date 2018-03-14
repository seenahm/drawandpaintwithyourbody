import processing.video.*;
import blobDetection.*;

Capture cam;
BlobDetection blobdetection;
PImage img;
//PImage texture; 
float R; 
float G; 
float B; 
float backgroundColor; 
PFont didot; 
PImage instructions; 
float BRI; 

boolean drawOutlines = false;
boolean drawFill = false;


void setup()
{
  size(1280, 720);

  backgroundColor = 0; 
  background(backgroundColor); 
  didot = createFont ("Didot.ttc", 20); 
  instructions = loadImage("Artboard 1-100.jpg"); 
  textFont(didot); 
  textSize(10); 
  fill(255); 
  //textAlign(CENTER); 
  text("press <p> to paint", 10, height-60); 
  text("press <d> to draw", 10, height-40); 
  text("spacebar to clear", 10, height-20); 
  text("<1> for default colours",120, height-60); 
  text("<2> for cool tones", 120, height-40); 
  text("<3> for warm tones", 120, height-20); 

  cam = new Capture(this, width, height);
  cam.start();

  img = new PImage(640, 480); 
  blobdetection = new BlobDetection(img.width, img.height);
  blobdetection.setPosDiscrimination(true);

  BRI = 1.0;
}

void draw() {
  //R = random(0, 255); 
  //G = random(0, 255); 
  //B = random(0, 255); 
  R = random(255); 
  G = random(255); 
  B = random(255); 
  float brightness = map(150, 0, width, 0, BRI);
  blobdetection.setThreshold(brightness); 

  if (cam.available()) {
    cam.read();
    img.copy(cam, 0, 0, cam.width, cam.height, 0, 0, img.width, img.height);
    blobdetection.computeBlobs(img.pixels);

    if (drawFill) {
      drawBlobsAndEdges(color(R, G, B, 10), 50);
    }
    if (drawOutlines) {
      DrawOutlines(color(0, 10), 50);
    }
  }
}

void keyPressed() {
  if (key == 'p' || key == 'P' ) {
    drawFill = !drawFill;
  }
  if (key == 'd' || key == 'D') {
    drawOutlines = !drawOutlines;
  }
  if (key == ' ') {
    background(backgroundColor);
    textFont(didot); 
    textSize(10); 
    fill(255); 
    text("press <p> to paint", 10, height-60); 
    text("press <d> to draw", 10, height-40); 
    text("spacebar to clear", 10, height-20); 
    text("<1> for default colours", 120, height-60); 
    text("<2> for cool tones", 120, height-40); 
    text("<3> for warm tones", 120, height-20);
  }

  if (key==CODED) {
    if (keyCode ==RIGHT) {
      BRI = BRI+1;
    } else if (keyCode ==LEFT) {
      BRI = BRI-1;
    }
  }
  if (key==1) {
    R=random(0, 255); 
    G=random(0, 255); 
    B=random(0, 255);
  }
  if (key==2) {
    R=random(0, 20);
    G=random(0, 50); 
    B=random(30, 10);
  }
  if (key==3) {
    R=random(20, 80); 
    G=random(70, 100); 
    B=random(0, 10);
  }
}
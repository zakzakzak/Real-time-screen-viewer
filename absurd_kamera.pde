 
import java.awt.Robot;
import java.awt.image.BufferedImage;
import java.awt.Rectangle;
 
Robot robot;
float[] temp;
 
void setup() {
  size(640, 480);
  try {
    robot = new Robot();
  } 
  
  catch (Exception e) {
    println(e.getMessage());
  }
  temp = new float[width+height*width];
  background(0);
  Rectangle r = new Rectangle(0, 30, width, height);
  BufferedImage img1 = robot.createScreenCapture(r);
  PImage img2 = new PImage(img1);
  image(img2, 0, 0);
  loadPixels();
  for(int i = 0; i < width; i++){
   for(int j = 0; j < height; j++){
     int loc = i+j*width;
     temp[loc] = pixels[loc];
   }
  }
  updatePixels();
}
 
void draw() {
  background(0);
  Rectangle r = new Rectangle(0, 30, width, height);
  BufferedImage img1 = robot.createScreenCapture(r);
  PImage img2 = new PImage(img1);
  image(img2, 0, 0);
  loadPixels();
  for(int i = 0; i < width; i++){
   for(int j = 0; j < height; j++){
     int loc = i+j*width;
     //temp[loc] = pixels[loc];
     if( pixels[loc] > temp[loc]-1800000){
       pixels[loc] = floor(temp[loc]);
     }else{
       //pixels[loc] = color(255);
     }
   }
  }
  updatePixels();
  //Rectangle r = new Rectangle(0, 30, width, height);
  //BufferedImage img1 = robot.createScreenCapture(r);
  //PImage img2 = new PImage(img1);
  //image(img2, 0, 0);
}
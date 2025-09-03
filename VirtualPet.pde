import processing.serial.*; //setup arduino stuff
import cc.arduino.*;
Arduino arduino;
float faceY;
void setup(){
  arduino = new Arduino(this, Arduino.list()[0], 57600); //change the [0] to a [1] or [2] etc. if your program doesn't work
  noStroke();
  size(400,400);
}
void draw(){
background(100, 191, 191);
  for(int i=0; i <= 300; i++) {
   fill(255, 255, 255);
   ellipse((int) random(0,400), (int)random(0,400), (int)random(2,4), (int)random(2,4));}
faceY = (float)arduino.analogRead(5) * 0.5 + 100;
if (faceY < 215)
  faceY = 215;
if (faceY > 260)
  faceY = 260;
println(faceY);
noStroke();

fill(148, 113, 64); //head, body, neck
ellipse(200, 400, 400, 400);
stroke(0.01);
arc(200, faceY - 50, 300, 350, 0.85, 2.3);
fill(189, 143, 64);
noStroke();
ellipse(200, faceY - 50, 300, 350); 

pushMatrix();
translate(160, faceY - 90); //face left
rotate(36 * 0.017);
fill(153, 126, 59);
ellipse(0, 0, 120, 100);
popMatrix();

pushMatrix(); //face right
translate(240, faceY - 90);
rotate(-36 * 0.017);
ellipse(0, 0, 120, 100);
popMatrix();

ellipse(200, faceY+22, 150, 190); //face bottom

fill(0,0,0); //eyes
ellipse(160, faceY - 80, 30, 30);
ellipse(240, faceY - 80, 30, 30);
fill(255, 255, 255);
ellipse(163, faceY - 77, faceY - 235, faceY - 235);
ellipse(243, faceY - 77, faceY - 235, faceY - 235);


ellipse(200, faceY + 50, 100, 100);
fill(153, 126, 59);
ellipse(200, faceY + 30, 150, 100);

stroke(0, 0, 0);
strokeWeight(4);
arc(175, faceY - 25, 20, 20, 3.3, 6.3);
arc(215, faceY - 25, 20, 20, 3, 6);

strokeWeight(4);
ellipse(215, faceY - 25, 3, 3);
ellipse(175, faceY - 25, 3, 3);

noStroke();
fill(189, 143, 64);
ellipse(45, faceY - 100, 70, 80);
ellipse(355, faceY - 100, 70, 80);
fill(153, 126, 59);
ellipse(45, faceY - 100, 35, 40);
ellipse(350, faceY - 100, 35, 40);
};


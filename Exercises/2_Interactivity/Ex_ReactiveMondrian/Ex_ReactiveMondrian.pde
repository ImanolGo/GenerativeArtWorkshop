/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/230367*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
void setup()
{
  size(600, 600);
}

void draw()
{
  background(0);
  
  colorMode(HSB, 360, 100, 100);
  
  float s =map(mouseX, 0, width/3, 0, 100);
  
  noStroke();
  fill(0, 0, 100);
  rect(0, 0, 250, 320);
  
  fill(0, 100, 100, s);
  rect(0, 0, 250, 320);
  //rot
  
  fill(0, 0, 100);
  rect(260, 0, 360, 320);
  
  rect(0, 330, 250, 270);
  
  rect(260, 330, 280, 230);
  
  fill(0, 0, 100);
  rect(550, 330, 50, 100);
  
  fill(230, 100, 100, s);
  rect(550, 330, 50, 100);
  //blau
  
  fill(0, 0, 100);
  rect(260, 570, 150, 30);
  
  fill(50, 100, 100, s);
  rect(260, 570, 150, 30);
  //gelb
  
  fill(0, 0, 100);
  rect(550, 450, 50, 150);
 
  
}
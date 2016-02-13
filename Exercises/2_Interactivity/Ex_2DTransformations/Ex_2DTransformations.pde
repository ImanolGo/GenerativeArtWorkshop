/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/230205*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
void setup()
{
  size(500, 500);
  background(255);
}

void draw()
{
  translate(mouseX, mouseY);
  fill(0, random(20));
  noStroke();
  ellipse(50, 50, 6, 300);
  rotate(millis()/500.0);
  

  
  fill(0, random(50));
  ellipse(30, 30, 3, 400);
 
  
}
int strokeWidth = 3;

void setup() {
  size(500,1000);
  background(255);
  strokeCap(SQUARE); //The default cap is ROUND.
}


void draw() 
{
  
  background(255);
  
  strokeWidth = (int) map(mouseX, 0, width, 1, 40);
 
  for (int y = 0; y < height; y = y + strokeWidth) 
  {
    int r = (int)random(2);
 
    strokeWeight(strokeWidth);
    stroke(255*r);
    line(0, y, width*0.5, y);
  }
  
  for (int y = 0; y < height; y = y + strokeWidth) 
  {
    int r = (int)random(2);
 
    strokeWeight(strokeWidth);
    stroke(255*r);
    line(width*0.5, y, width, y);
  }
  
}
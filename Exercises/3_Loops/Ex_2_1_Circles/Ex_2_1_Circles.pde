/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/166407*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
//This sketch creates random circles of rsndom colours, but eventually fills the page into a 
//palette of colour, with the colours tied into the locations on the canvas

int size = 700;

void setup(){
  size(700,700);
  //set up the canvas size to 200x200px
}

void draw(){
  float r=random(size);
  float r2=random(size);
  float r3=random(size);
  //creates 3 variables and assigns them random numbers at the start of each draw loop
  //these numbers are all from 0 to 200
  noFill();
  //specifies the ellipse to not be filled
  stroke(r,r2,r3);
  //sets the stroke RGB colour based on the random values
  ellipse(r,r3,r2,r2);
  //draws a uniform ellipse of height/width 'r2' in a location on coordinates from r and r3

}
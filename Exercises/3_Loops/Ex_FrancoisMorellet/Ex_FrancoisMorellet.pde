void setup() {
  size(700,700);
  background(255);
  frameRate(5);
}


void draw() {
  noStroke();
  for (int x = 0; x<width ; x = x+10)
  {
      for(int y = 0; y<height; y= y+10){
         if((int)random(2)==1)
         {
           fill(208,33,62);
         }
         else
         {
           fill(27,111,175);
         }
     
         rect(x,y,random(10,50),random(10,50),3);
       }
    }
}
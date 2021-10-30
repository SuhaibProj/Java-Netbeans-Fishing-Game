class Bubble
{
  PImage bubbles;
  int x;
  int y;
  int dx = 1;
  int dy = 1;
  int size = 50;
  
  Bubble(int x, int y){
   this.x = x;
   this.y = y;
   bubbles = loadImage("Bubble_double.png");
  }
    
  void render()
  {
    image(bubbles,x,y, size, size);
  }
  
  void move() {
      x+=int(random(-dx,dx));
      y-=dy;
      boundary();
  }
  
  void update(){
   render();
   move();
  }
  
  void boundary(){
   if(y <= 500) {
       x=int(random(x));
       y=1200;
   } 
  }
  
}
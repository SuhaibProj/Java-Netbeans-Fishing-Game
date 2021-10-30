class Whale
{
    PImage whale;
    int x;
    int y;
    int dx;
    int dy;
    int size = 50;
    
    Whale(int x, int y, int dx, int dy)
    {
      this.x = x;
      this.y = y;
      this.dx = dx;
      this.dy = dy;
      whale = loadImage("Whale.png");
    }
    
    void render()
    {
      image(whale,x,y,size,size);
    }
    
    void move() {
      x+=(int)random(3*-dx,3*dx);
      y-=dy;
      boundary();
    }
    
    void boundary() {
      float d = dist(x+25, y, person.x+(hook.size/2), person.y+(hook.size/2));
      
      if(y <= 495) {
       x=int(random(x));
       y=2000;
      }
      if (y < 620) 
         dy*=1.3;
      if(d < 40)
         gameFinish = true;
         finish();
    }
     
    void update(){
      render();
      move();
    }
    
    void finish(){
      if (gameFinish == true){
        background.splash();
        textSize(32);
        text("Game Over!!!", 550, 500); 
      }
    }
}
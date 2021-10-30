class Fish
{
    //PImage fishes;
    //PImage fishes_reversed;
    PImage fish1, fish2, fish3, fish1_reversed, 
    fish2_reversed, fish3_reversed;
    int x;
    int y;
    int dx;
    int size = 50;
    boolean change;
    int counter=0;
    
    Fish(int x, int y, int dx) {
      this.x = x;
      this.y = y;
      this.dx = dx;
      //fishes = loadImage("Fish1.png");
      //fishes_reversed = loadImage("Fish1_reverse.png");
      fish1 = loadImage("Fish1.png");
      fish2 = loadImage("Fish2.png");
      fish3 = loadImage("Fish3.png");
      fish1_reversed = loadImage("Fish1_reverse.png");
      fish2_reversed = loadImage("Fish2_reverse.png");
      fish3_reversed = loadImage("Fish3_reverse.png");
    }
    
    boolean change() { //flips fish horizontally
      if(x<=0){
       change = false; 
      }
      if(x >= width-75){
        change = true;
      }
      return false; 
    }
    
    boolean isShot(Hook hook){
      if(hook!=null){
        if(abs(this.x-(person.x+(size/2)-10)) < 30 && abs(this.y-hook.yh) < 30)
           return true; 
      }
      return false;
    }
    
    //void render() {
    //      if(change == false){
    //        image(fishes,x,y, size,size);
    //      }
    //      if(change == true){
    //        image(fishes_reversed, x,y, size,size);
    //      }
    //}
    
    void render() {
          if(change == false){
            if (counter < 10){ image(fish1,x,y, size,size); }
            else if (counter < 15){ image(fish2,x,y, size,size); }
            else if (counter < 20){ image(fish3,x,y, size,size); }
            else {counter = 0;}
            counter+=1;
            //now need to make render them in reverse order.
          }
          if(change == true){
            if (counter < 10){ image(fish1_reversed,x,y, size,size); }
            else if (counter < 15){ image(fish2_reversed,x,y, size,size); }
            else if (counter < 20){ image(fish3_reversed,x,y, size,size); }
            else {counter = 0;}
            counter+=1;
          }
    }
    
    void move() {
      x+=dx;  
      
      boundary(background);
      change();
    }
   
    void boundary(Backgrounds background) {
        if(y <= 500) {
          gameFinish = true;
          finish();
        }
        if(x <= 0 || x >= width-75) {
          dx*=-1;
          y-=100;
        }
    }
    
    void update() {
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
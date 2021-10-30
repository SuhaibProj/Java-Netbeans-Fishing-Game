class Hook
{
 
  PImage hook;
  int x;
  int y;
  int xh = x;
  int yh = y;
  //int hookLength = 100;
  int size;
  //boolean hookedFish = false;
  
  Hook(int x, int y, int size){
    this.x = x;
    this.y = y;
    this.size = size;
    hook = loadImage("hook.png"); 
  }

  void render(){
      image(hook, person.x+(size/2)-10, yh+size, 20,25);
  }
  
  void move() {
      yh+=(size/15);
      boundary();
  }
  
  void update(){
     render();
     move();
  }
  
  void boundary(){
    if(yh > height){
       yh = y;
       line(person.x+(size/2), yh+(size), person.x-(size/2), person.y-(size/2));
       //line(person.x+(hook.size/2), person.y+(hook.size/2), person.x+(hook.size/2), hook.yh+hook.size);
    }
  }
}
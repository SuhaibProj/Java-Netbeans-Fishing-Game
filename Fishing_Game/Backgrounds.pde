class Backgrounds {

  PImage play;
  PImage splash;
  int x;
  int y;

  Backgrounds(int x, int y){
     this.x = x;
     this.y = y;
     splash = loadImage("Splash.png");
     play = loadImage("Background.png");
     splash.resize(width, height);
     play.resize(width, height);
  }
  
  void play(){
    image(play, x,y); 
  }
  
  void splash(){
    image(splash, x,y); 
  }
  
}
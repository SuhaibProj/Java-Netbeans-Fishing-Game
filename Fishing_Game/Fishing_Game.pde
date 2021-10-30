Whale whale;
Person person;
Hook hook;
Bubble bubble;
Backgrounds background;
Fish [][] fish = new Fish[5][5];

float imageXPos = 0;
int x = 100;
int y = 750;

int gameScore;

boolean gameFinish = false;
boolean game = false;

void setup() {
  size(1280,1000);
  background = new Backgrounds(0,0);
  background.splash();
  text("Click to start the game!", 640, 500, 20,20);
  person = new Person(500, 450, 100);
  hook = new Hook(500, 450, 100);
  bubble = new Bubble(720, 1000);
  whale = new Whale(500,1000, 2, 1);
  
  for (int row=0; row < fish.length;  row ++) {
    for (int col=0; col < fish[row].length; col++) {
      fish[row][col] = new Fish(x,y,1);
      x += 70;
    }
    y += 40;
    x = 100;
  } 
}

void draw()  {
    background.splash();
    textSize(32);
    text("Click to start the game !", 470, 500);
  if (game == true){
    backgroundPos();
    person.render();
    hookCalled();
    keyPressed();
    bubble.update();
    whale.update();
  
    for (int row = 0; row < fish.length;  row ++) {
      for (int col = 0; col < fish[row].length; col ++) {
         if(fish[row][col]!=null) {
           if (!fish[row][col].isShot(hook))
             fish[row][col].update();
           if (fish[row][col].isShot(hook)){
             fish[row][col]=null;
             gameScore = gameScore + 1;
             hook.yh = hook.y; 
           }
         }   
       
       }
    }  
  }   
}

void backgroundPos() {
  image(background.play, imageXPos, 0.0f); //draw background twice adjacent 
  image(background.play, imageXPos+background.play.width, 0);
  imageXPos-=1;
  if(imageXPos == -background.play.width) 
    imageXPos=0; //wrap background
}

void hookCalled(){
  if (keyPressed == true){
    if (key == ' ' || keyCode == DOWN) {
      line(person.x+(hook.size/2), person.y+(hook.size/2), person.x+(hook.size/2), hook.yh+hook.size);
      stroke(255);
      hook.update();
    }
  } else {
       hook.yh = person.y;
  }
}

void keyPressed() {
   if(key == CODED)
    if(keyCode == LEFT && person.x > 10) 
      person.x-=2; 
    if(keyCode == RIGHT && person.x < width - 100)
      person.x+=2;
}

void mouseClicked(){
  game = true;
}
class Person
{
    PImage person;
    int x = 500;
    int y = 450;
    int size;

    Person(int x, int y, int size) {
      this.x = x;
      this.y = y;
      this.size = size;
      person = loadImage("Person.png");
    }
    
    void render() {
     image(person,x,y, size, size-25);
    }
}
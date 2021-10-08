//This code is for simulating a random walker
//It is object oriented where we have a class of walker and in the class we have methods

Walker w;

void setup(){
  size(640,360);//size of the display screen
  
  w= new Walker();//creating a new walker
  background(205);//giving it a background colour
}

void draw(){
  
  w.step();//method or function called step in class Walker
  w.display();//Method or function called display in class Walker
}

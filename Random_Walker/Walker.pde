//Random walker object

class Walker {
  int x,y;
  
  Walker(){
    x= width/2;
    y=height/2;
  }
  //The display function draws it as a point
  void display(){
    stroke(0);
    point(x,y);
  }
  
  void step(){
  int choice = int(random(4));//we are using the random function in processing to choose 1/4 options
  
  if(choice==0){
    x++;
  }
  else if(choice==1){
    x--;
  }
  else if (choice==2){
    y++;
  }
  else{
    y--;
  }
  
  x=constrain(x,0,width-1);
  y=constrain(y,0,height-1);
  }
}

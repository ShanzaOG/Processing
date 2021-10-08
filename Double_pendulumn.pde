float r1 =200;//length of the top rod
float r2 =200;//length of the bottom rod
float m1=20;//mass of the the top bob
float m2=20;//mass of the bottom bob
float a1=PI/2;//displacement angle of top pendulum
float a2=PI/16;//displacement angle of the bottom pendulum
float a1_v=0;//angular velocity for top pendulum
float a2_v=0;//angular velocity for bottom pendulum
float g=1.0;//gravity
float px2=0;
float py2=0;
float cx;
float cy;


PGraphics path;

void setup(){
  size(900,900);
  cx=width/2;
  cy=50;
  path = createGraphics(width,height);
  path.beginDraw();
  path.background(205);
  path.endDraw();
}

void draw(){
 // background(205);
  image(path,0,0);
  stroke(0);
  strokeWeight(2);
  
  translate(cx,cy);
  
  float x1 = r1*sin(a1);
  float y1 = r1*cos(a1);
  
  float x2 = x1+r2*sin(a2);
  float y2 = y1+r2*cos(a2);
  /*
  This is the mathematical formular for a double pendulum:
  
      ω1 = angular velocity of top rod
      ω2 = angular velocity of bottom rod
  
      ω1' = −g(2m1 + m2)sinθ1 − m2*g*sin(θ1 − 2θ2) − 2sin(θ1 − θ2)m2(ω2^2*L2 + ω1^2*L1cos(θ1 − θ2))
                     L1 (2 m1 + m2 − m2 cos(2 θ1 − 2θ2))
      ω2' = 2 sin(θ1−θ2)(ω1^2*L1*(m1 + m2) + g(m1 + m2)*cosθ1 + ω2^2*L2* m2cos(θ1 − θ2))
                     L2(2m1 + m2 − m2cos(2θ1 − 2θ2))
  
  */
  
  //Implimentation of the formuar
  float num1=-g*(2*m1+m2)*sin(a1);
  float num2=-m2*g*sin(a1-(2*a2));
  float num3=-2*sin(a1-a2)*m2;
  float num4=(a2_v*a2_v*r2+a2_v*a2_v*r1*cos(a1-a2));
  float den=r1*(2*m1+m2-m2*cos(2*a1-2*a2));
  float a1_a=(num1+num2+num3*num4)/den;//This is the w1'
  
  float numa=2*sin(a1-a2);
  float numb=a1_v*a1_v*r1*(m1+m2);
  float numc=g*(m1+m2)*cos(a1);
  float numd=a2_v*a2_v*r2*m2*cos(a1-a2);
  float den1=r2*(2*m1+m2-m2*cos(2*a1-2*a2));
  
  float a2_a=numa*(numb+numc+numd)/den1;//This is the w2'
  
  line(0,0,x1,y1);
  fill(0);
  ellipse(x1,y1,m1,m1);
  
  line(x1,y1,x2,y2);
  fill(0);
  ellipse(x2,y2,m2,m2);
  
  a1_v+=a1_a;//Change of velocity with acceleration
  a2_v+=a2_a;
  a1+=a1_v;//Change of position with velocity
  a2+=a2_v;
  
  //a1_v*=.00000001;
  //a2_v*=.00000001;
 
 //Ploting the path 
  path.beginDraw();
  path.translate(cx,cy);
  path.strokeWeight(1);
  path.stroke(0);
  if(frameCount>1){
    path.line(px2,py2,x2,y2);}
  path.endDraw();
  
  px2=x2;//Saving the new position of the new x2 value
  py2=y2;//Saving the position of the new y2 value
}

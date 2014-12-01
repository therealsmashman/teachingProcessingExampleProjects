car car1;
car car2;
void setup(){
  size(400,200);
  //initialize the new car objects.
  //this calls the "car" constructor
  car1 = new car(20,20);
  car2 = new car(20,100);
  //now we call some of the methods on the car objects.
  //this will change some of the internal values - like carHeight and speed
  car1.setSpeed(4);
  car2.setCarSize(60,40);
}

//draw both of the car objects - see how they differ depending on the 
//values we altered by calling methods on them
void draw(){
  background(0,140,0);
  car1.drawCar();
  car2.drawCar();
}

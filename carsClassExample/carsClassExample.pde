car car1;
car car2;
void setup(){
  size(400,200);
  car1 = new car(20,20);
  car2 = new car(20,100);
  car1.setSpeed(4);
  car2.setCarSize(60,40);
}

void draw(){
  background(0,140,0);
  car1.drawCar();
  car2.drawCar();
}

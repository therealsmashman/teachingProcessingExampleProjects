class car{
  //these are variables that are attached to each object of 
  //type car. The are all named the same - but are all unique to
  //each object. Like everyone has a "name", but everyones name is
  //unique to them
  private int carWidth;
  private int carHeight;
  private int speed;
  private int carHozPoz;
  private int carVertPoz;
  
  //this is the "constructor", its what is called to make a new object.
  //it can be called many times to create many different object, all with 
  //different variables attached to them
  public car(int inStartHozPos, int inStartVertPoz){
    //set the default width, height and speed (these can be changed, see below)
    carWidth = 40;
    carHeight = 20;
    speed = 2;
    carHozPoz = inStartHozPos;
    carVertPoz = inStartVertPoz;
  }
  
  //methods that can be call only on an object of type car.
  //called using [carObjectName].setSpeed([number])
  public void setSpeed(int inSpeed){
    speed = inSpeed;
  }
  
 //set custom widths and height of this car object.
  public void setCarSize(int inCarWidth, int inCarHeight){
    carWidth = inCarWidth;
    carHeight = inCarHeight;
  }
  
  // draw the car.
  public void drawCar(){
    carHozPoz = carHozPoz+speed;
    rect(carHozPoz,carVertPoz,carWidth,carHeight);
  }
  
  //fill this in yourself - should retrun true when the car
  //has gone off the side of the screen.
  public boolean hasThisCarFinished(){
    return false; 
  }
}

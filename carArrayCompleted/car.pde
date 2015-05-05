class Car {
  //these are variables that are attached to each object of 
  //type car. The are all named the same - but are all unique to
  //each object. Like everyone has a "name", but everyones name is
  //unique to them
  private int carWidth;
  private int carHeight;
  private int speed;
  private int carHozPoz;
  private int carVertPoz;
  private boolean isStopped = false;
  private int r = 0;
  private int g = 0;
  private int b = 0;

  //this is the "constructor", its what is called to make a new object.
  //it can be called many times to create many different object, all with 
  //different variables attached to them
  public Car(int inStartHozPos, int inStartVertPoz) {
    //set the default width, height and speed (these can be changed, see below)
    carWidth = 40;
    carHeight = 20;
    speed = 2;
    carHozPoz = inStartHozPos;
    carVertPoz = inStartVertPoz;
  }

  //methods that can be call only on an object of type car.
  //called using [carObjectName].setSpeed([number])
  public void setSpeed(int inSpeed) {
    speed = inSpeed;
  }

  public void setCarSize(int inCarWidth, int inCarHeight) {
    carWidth = inCarWidth;
    carHeight = inCarHeight;
  }

  public void changeColour(int newR, int newG, int newB) {
    r = newR;
    g = newG;
    b = newB;
  }

  public void drawCar() {
    fill(r, g, b);

    if (!isStopped) {
      carHozPoz = carHozPoz+speed;
      if (random(0, 100) > (100 - speed*2)) {
        isStopped = true;
      }
    }
    else {
      if (random(0, 200) > ((200 - maxSpeed *2) +  speed*2)) {
        isStopped = false;
      }
      fill(255, 0, 0);
    }
    rect(carHozPoz, carVertPoz, carWidth, carHeight);
  }
}


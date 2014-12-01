class car{
  private int carWidth;
  private int carHeight;
  private int speed;
  private int carHozPoz;
  private int carVertPoz;
  
  public car(int inStartHozPos, int inStartVertPoz){
    carWidth = 40;
    carHeight = 20;
    speed = 2;
    carHozPoz = inStartHozPos;
    carVertPoz = inStartVertPoz;
  }
  
  public void setSpeed(int inSpeed){
    speed = inSpeed;
  }
  
  public void setCarSize(int inCarWidth, int inCarHeight){
    carWidth = inCarWidth;
    carHeight = inCarHeight;
  }
  
  public void drawCar(){
    carHozPoz = carHozPoz+speed;
    rect(carHozPoz,carVertPoz,carWidth,carHeight);
  }
  
  
  
  
}

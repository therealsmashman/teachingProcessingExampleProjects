class Alien {
  private int speed;
  int alienHozPoz;
  int alienVertPoz;
  private int alienSize = 40;
  private int health = 2;


  public Alien(int initialHosPos, int initialVertPos) {
    alienHozPoz = initialHosPos;
    alienVertPoz = initialVertPos;
    speed = 3;
  }

  public void drawAlien() {
    rectMode(CENTER);
    fill(255);
    rect(alienHozPoz, alienVertPoz, alienSize*2, alienSize );
    fill( 255 -(100*health),(100*health),0);
    ellipse(alienHozPoz, alienVertPoz, alienSize, alienSize);
    alienHozPoz = alienHozPoz + speed;
    if (alienHozPoz >= width - alienSize*3 || alienHozPoz <= alienSize*3) {
      alienVertPoz = alienVertPoz + alienSize*2;
      speed = -speed;
    }
    
  }
private boolean isHit(int hoz, int vert){
  if(dist(hoz, vert, alienHozPoz, alienVertPoz)<= alienSize/2){
    return true;
  }
  else{
    return false;
  }
  
}

  public boolean hasBeenDestroyed(ArrayList<Bullet> bulletsToCheck) {
    for(int i=0; i< bulletsToCheck.size(); i++){
      if(isHit(bulletsToCheck.get(i).bulletHozPoz,bulletsToCheck.get(i).bulletVertPoz)){
        println("BEEN HIT!!!!");
        health = health - 1;
        bulletsToCheck.remove(i);
        if(health < 0){
          return true;
        }
      }
    }
    return false;
  }
}


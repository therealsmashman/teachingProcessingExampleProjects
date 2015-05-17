class Alien {
  private int speed;
  private int alienHozPoz;
  private int alienVertPoz;
  private int alienSize = 25;
  private int health = 2;


  public Alien(int initialHosPos, int initialVertPos) {
    alienHozPoz = initialHosPos;
    alienVertPoz = initialVertPos;
    speed = 1;
  }

  public void drawAlien() {
    rectMode(CENTER);
    fill(255);
    rect(alienHozPoz, alienVertPoz, alienSize*2, alienSize );
    fill(255, 0, 0, 200);
    ellipse(alienHozPoz, alienVertPoz, alienSize, alienSize);
    //    fill(255, 0, 0);
    //    ellipse(bulletHozPoz, bulletVertPoz, 10, 10);
    //    bulletHozPoz = bulletHozPoz +speed;
    alienHozPoz = alienHozPoz + speed;
    if (alienHozPoz >= width - alienSize*3 || alienHozPoz <= alienSize*3) {
      alienVertPoz = alienVertPoz + alienSize*2;
      speed = -speed;
    }
  }

  public boolean hasHit() {
    return false;
  }
}


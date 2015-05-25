class Invader {
  String type;
  int health;
  int hozPoz;
  int vertPoz;
  int stepSize = 100;

  public Invader() {
    initPosition();
    health = 3;
  }
  private void initPosition() {
    hozPoz = width - stepSize/2;
    vertPoz = (stepSize/2) + int(random(0, 7)) * 100;
  }
  public void move() {
    hozPoz = hozPoz - stepSize;
  }

  public void drawInvader() {
    fill(255, 255,0);
    arc(hozPoz, vertPoz, 90, 90, - PI+QUARTER_PI, PI - QUARTER_PI, PIE);
  }
}


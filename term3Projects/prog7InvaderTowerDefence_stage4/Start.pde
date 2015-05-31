class Star {
  int hozPoz;
  int vertPoz; 
  int stepSize = 100;
  public Star() {
    initPosition();
  }

  public void initPosition() {
    hozPoz = (stepSize/2) + int(random(0, 5)) * 100;
    vertPoz = (stepSize/2) + int(random(0, 7)) * 100;
  }

  boolean isHit(int hoz, int vert) {
    return (dist(hozPoz, vertPoz, hoz, vert)<100);
  }

  public void drawStar() {
    fill(255,0,255);
    quad(hozPoz, vertPoz - 50, hozPoz + 50, vertPoz, hozPoz, vertPoz +50, hozPoz - 50, vertPoz);
  }
}


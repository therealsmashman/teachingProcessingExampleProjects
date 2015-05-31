class Well {
  int hozPoz;
  int vertPoz;
  int size;
  public Well(int initHozPoz, int initVertPoz) {
    hozPoz = initHozPoz;
    vertPoz = initVertPoz;
  } 

  boolean isHit(int hoz, int vert) {
    return (dist(hozPoz,vertPoz,hoz,vert)<100);
  }

  public void drawWell() {
    rectMode(CENTER);
    fill(120, 80, 30) ;
    rect(hozPoz, vertPoz, 75, 75, 20);
    fill(0, 255, 225);
    ellipse(hozPoz, vertPoz, 60, 60);
  }
}


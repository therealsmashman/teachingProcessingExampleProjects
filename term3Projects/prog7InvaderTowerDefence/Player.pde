class Player {
  int hozPoz;
  int vertPoz;
  int health;
  int stepSize = 100;
  int size = 75;
  public Player(int startHoz, int startVert) {
    hozPoz = startHoz;
    vertPoz = startVert;
    health = 10;
  }

  public void move(char pressed) {
    if (pressed == 'w') {
      if (vertPoz> 50) {
        wellLayer.moveUp();
      }
    }
    else {
      if (pressed == 's') {
        if (vertPoz< height - 50) {
          wellLayer.moveDown();
        }
      }
      else {
        if (pressed == 'd') {
          if (hozPoz< width - 50) {
            wellLayer.moveForward();
          }
        }
        else {
          if (pressed == 'a') {
            if (hozPoz> 50) {
              wellLayer.moveBack();
            }
          }
        }
      }
    }
  }
  private void moveUp() {
    vertPoz = vertPoz -stepSize;
  }
  private void moveDown() {
    vertPoz = vertPoz +stepSize;
  }
  private void moveForward() {
    hozPoz = hozPoz + stepSize;
  }
  private void moveBack() {
    hozPoz = hozPoz - stepSize;
  }

  public void drawPlayer() {
    fill(0, 255, 0);
    ellipse(hozPoz, vertPoz, size, size);
  }
}


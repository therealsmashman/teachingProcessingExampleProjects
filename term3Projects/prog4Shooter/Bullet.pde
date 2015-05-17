class Bullet {
  private int speed;
  private int bulletHozPoz;
  private int bulletVertPoz;
  public Bullet(int initialHosPos, int initialVertPos) {
    bulletHozPoz = initialHosPos;
    bulletVertPoz = initialVertPos;
    speed = 3;
  }

  private void drawBullet() {
    fill(255, 255, 0);
    ellipse(bulletHozPoz, bulletVertPoz+5, 10, 20);
    fill(255, 0, 0);
    ellipse(bulletHozPoz, bulletVertPoz, 10, 10);
    bulletVertPoz = bulletVertPoz - speed;
  }

  public boolean hasHit() {
    return false;
  }

  public boolean leftScreent() {
    if (bulletVertPoz < - 20) {
      return true;
    }
    else {
      return false;
    }
  }
}


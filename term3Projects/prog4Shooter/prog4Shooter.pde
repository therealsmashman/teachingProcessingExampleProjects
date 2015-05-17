ArrayList<Bullet> bullets;
ArrayList<Alien> aliens;
boolean gameOver = false;
boolean youLost = false;
boolean youWon = false;
void setup() {
  size(800, 600);
  noStroke();
  bullets = new ArrayList<Bullet>();
  aliens = new ArrayList<Alien>();
  Alien newAlien;
  for (int i=0; i<5; i++ ) { 
    newAlien = new Alien(150 + 100 * i, 75);
    aliens.add(newAlien);
  }
}

void draw() {
  background(0);
  if (gameOver) {
    endGameScreen();
  }
  else {
    if (aliens.size() < 1) {
      gameOver = true;
      youWon = true;
    }
    renderBullets();
    renderAliens();
  }
}
void endGameScreen() {
  fill(255);
  textSize(130);
  text("GAME OVER", 20, 200);
  if (youWon) {
    text("YOU WON!!!", 20, 400);
  }
  if (youLost) {
    text("YOU LOST!!!", 20, 400);
  }
}
void renderBullets() {
  for (int i=0; i<bullets.size(); i++ ) { 
    bullets.get(i).drawBullet();
    if (bullets.get(i).leftScreent()) {
      bullets.remove(i);
    }
  }
}

void renderAliens() {
  for (int i=0; i<aliens.size(); i++ ) { 
    aliens.get(i).drawAlien();
    if (aliens.get(i).alienVertPoz > height -  100 ) {
      gameOver = true;
      youLost = true;
    }
    //hsa to be last
    if (aliens.get(i).hasBeenDestroyed(bullets)) {
      aliens.remove(i);
    }
  }
}
void keyReleased() {
  if (bullets.size() < 5) {
    Bullet newBullet = new Bullet(mouseX, height - 50);
    bullets.add(newBullet);
  }
}


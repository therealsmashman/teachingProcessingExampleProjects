// invader game.
//they come from left to right
//you move on all axis droping wells that try and stop the invaders
//at least three idfferent types of invader - all with different looks, speed, paths and health
//idea is that they do this and the invader game, then add to ONE of them:
//game saving.
//music
//leaderboards.
ArrayList<Well> wellList;
ArrayList<Invader> invaderist;
Star star;
int moveTimer = 3000;
int nextMoveTime;
int starTimer = 2000;
int nextStarTime;
Player wellLayer;
int maxWells= 3;


void setup() {
  size(1200, 900);
  textSize(30);

  wellLayer = new Player(50, 50);
  wellList = new ArrayList<Well>();
  invaderist = new ArrayList<Invader>();
  star = new Star();
  star.initPosition();
  nextMoveTime = millis() + moveTimer;
  nextStarTime = millis() + starTimer;
}

void draw() {
  if (wellLayer.health > 1) {
    drawBackground();

    drawWells();
    drawInvaders();
    drawWells(); 
    drawStars();
    moveInvaders();


    wellLayer.drawPlayer();
  }
  else {
    drawGameOver();
  }
}
void drawGameOver() {
  background(255, 0, 0);
  textSize(200);
  fill(255);
  text("GAME OVER", 25, 200);
}

void drawBackground() {
  background(255);
  strokeWeight(5);
  for (int i=1; i < 12; i++ ) {
    line(i * 100, 0, i * 100, height -100);
  }
  for (int i=1; i < 8; i++ ) {
    line(0, i * 100, width, i * 100);
  }

  strokeWeight(1);
  drawStats();
}

void drawStats() {
  rectMode(CORNER);
  fill(0);
  rect(0, height-100, width, 100);
  fill(255);
  text("Health: "+ wellLayer.health, 20, height-75);
  text("No invaders: "+ invaderist.size(), 320, height- 75);
  text("No wells: "+ wellList.size(), 620, height- 75);
  text("MWells left: "+maxWells, 20, height- 25);
}
void drawWells() {
  for (int i =0; i < wellList.size(); i ++) {
    wellList.get(i).drawWell();
  }
}

void drawStars() { 
  if (star.isHit(wellLayer.hozPoz, wellLayer.vertPoz)) {
    maxWells +=1;
    star.initPosition();
  }
  else {
    if (millis()>nextStarTime) {
      nextStarTime = millis() + starTimer; 
      star.initPosition();
    }
  }
  star.drawStar();
}

void drawInvaders() {
  for (int i =0; i < invaderist.size(); i ++) {
    invaderist.get(i).drawInvader();
    for (int j =0; j < wellList.size(); j ++) {
      if (wellList.get(j).isHit(invaderist.get(i).hozPoz, invaderist.get(i).vertPoz)) {
        wellList.remove(j);
        invaderist.get(i).health -= 1;
        if (invaderist.get(i).health < 0) {
          invaderist.remove(i);
        }
      }
    }
  }
}

void moveInvaders() {
  if (timeToMoveInvaders()) {
    for (int i =0; i < invaderist.size(); i ++) {
      invaderist.get(i).move();
      if (invaderist.get(i).hozPoz < 0) {
        wellLayer.health -= 1;
        invaderist.remove(i);
      }
    }
    if (random(0, 10)>5) {
      invaderist.add(new Invader());
    }
  }
}

boolean timeToMoveInvaders() {
  if (millis() > nextMoveTime) {
    nextMoveTime = millis() + moveTimer;
    return true;
  }
  return false;
}
void keyReleased() {
  wellLayer.move(key);
}
void mousePressed() {
  if (mouseButton == LEFT) {
    if (maxWells > 0) {
      wellList.add(new Well(wellLayer.hozPoz, wellLayer.vertPoz));
      maxWells -=1;
    }
  }
  else {
    invaderist.add(new Invader());
  }
}


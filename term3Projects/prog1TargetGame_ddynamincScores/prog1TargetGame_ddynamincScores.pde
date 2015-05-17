int playerScore = 0;
int numberOfShots = 0;
int targetHozPos;
int tagetVertPos;
int targetSize;
int lastShotScore = 0;

void setup() {
  size(600, 600);
  noStroke();
  textSize(20);
  resetTarget();
}

void draw() {
  background(0, 200, 0);
  drawScore();
  drawTarget();
}

void drawScore() {
  fill(0);
  rect(0, 0, width, 20);
  fill(0, 0, 255);

  text("score: "+playerScore, 20, 15);
  text("shots: "+numberOfShots, 140, 15);
  text("last: "+lastShotScore, 260, 15);
    if (numberOfShots >0) {
    text("accuracy: "+float(playerScore)/float(numberOfShots), 380, 15);
  }
}


void resetTarget() {
  targetSize = (int)random(40, 100);
  targetHozPos = (int)random(targetSize/2, width - targetSize/2);
  tagetVertPos = (int)random(targetSize/2 + 20, height - targetSize/2 );
}

/*
draws the image of the target.
 A series of 4 ever smaller cirlces 
 */
void drawTarget() {
  fill(0);
  ellipse(targetHozPos, tagetVertPos, targetSize, targetSize);
  fill(255, 255, 0);
  ellipse(targetHozPos, tagetVertPos, (3*targetSize)/4, (3*targetSize)/4);
  fill(255, 0, 0);
  ellipse(targetHozPos, tagetVertPos, targetSize/2, targetSize/2);
  fill(255);
  ellipse(targetHozPos, tagetVertPos, targetSize/4, targetSize/4);
}
/*
Checks if the position of the mouse is within the target.
 Compares the distance from the center of the target to the mouse to the width of the 
 target.
 Uses temp, unused variables to help understanding.
 If hit, scores hit depending on the distance from the center.
 */
void calcLastShotCore() {
  float moustDistanceFromTarget = dist(targetHozPos, tagetVertPos, mouseX, mouseY);
  float targetRadius = targetSize/2;
  lastShotScore = 0;
  //if the mouse in within the target (less that the radius) we have hit the target.
  if (moustDistanceFromTarget <= targetRadius) {
    lastShotScore += 1;
    if (moustDistanceFromTarget <= (3*targetRadius)/4) {
      lastShotScore += 1;
      if (moustDistanceFromTarget <= targetRadius/2) {
        lastShotScore += 1;
        if (moustDistanceFromTarget <= targetRadius/4) {
          lastShotScore += 1;
        }
      }
    }
  }
}

void mouseReleased() {
  //check if the mouse hits the target.
  //if it hts - update score and make a new target
  calcLastShotCore();
  if (lastShotScore > 0) {
    playerScore =playerScore +lastShotScore;
    //update the position and size of the target
    resetTarget();
  }
  numberOfShots = numberOfShots + 1;
}


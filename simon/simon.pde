int numberList[] = new int[4];
int beginingCenter = 100;
int circleHeight = 100;
int circleWidth = 100;
int hightLightNumber = 0;
int placeCounter = 0;
boolean starting = false;
boolean userSelect = false;
boolean gameOver = false;
boolean userWon = false;
int time = 0;
void setup() {
  size(600, 300);
  background(0);
}

void draw() {
  background(0);
  if (gameOver) {
    showGameOverScreen();
  }
  else {
    drawCircles();
  }
}

void drawCircles() {
  if (starting) {
    for (int j = 0; j < 4; j = j+1) {
      numberList[j] = (int)random(1, 5);
      println("number: "+numberList[j] );
    }
    println("initialized");
    placeCounter= 0;
    starting = false;
    hightLightNumber = numberList[0];
    time = millis() + 2000;
    userSelect = false;
  }
  else {
    if (!userSelect&& time != 0) {
      drawText("Watch the hightligh order");
      if (millis() > time ) {
        if (  millis() < time +200) {
          hightLightNumber = 0;
        }
        else {
          placeCounter = placeCounter+1;        
          if (placeCounter > 3) {
            userSelect = true;
            placeCounter = 0;
            hightLightNumber= 0;
          }
          else {
            hightLightNumber = numberList[placeCounter];
            println("hightlighing number: "+hightLightNumber);
            time = millis()+2000;
          }
        }
      }
      else {
      }
    }
    else {
      if (userSelect) {
        drawText("Click on circles to copy pattern");
      }
      else {
        drawText("Click to start game");
      }
    }
  }
  drawC1();
  drawC2();
  drawC3();
  drawC4();
}
void drawText(String text) {
  fill(255);
  textSize(40);
  text(text, circleWidth, circleHeight + 150);
}

void drawC1() {
  if (hightLightNumber == 1) {
    setHightlighted(255, 0, 0);
  }
  else {
    fill(100, 0, 0);
  }
  ellipse(beginingCenter, circleHeight, circleWidth, circleWidth);
  strokeWeight(1);
  stroke(0);
}
void drawC2() {
  if (hightLightNumber == 2) {
    setHightlighted(0, 255, 0);
  }
  else {
    fill(0, 100, 0);
  }
  ellipse(beginingCenter + 1 *(circleWidth + 20), circleHeight, circleWidth, circleWidth);
  strokeWeight(1);
  stroke(0);
}
void drawC3() {
  if (hightLightNumber == 3) {
    setHightlighted(0, 0, 255);
  }
  else {
    fill(0, 0, 100);
  }
  ellipse(beginingCenter + 2 *(circleWidth + 20), circleHeight, circleWidth, circleWidth);
  strokeWeight(1);
  stroke(0);
}
void drawC4() {
  if (hightLightNumber == 4) {
    setHightlighted(255, 255, 0);
  }
  else {
    fill(100, 100, 0);
  }
  ellipse(beginingCenter + 3 *(circleWidth + 20), circleHeight, circleWidth, circleWidth);
}

void setHightlighted(int r, int g, int b) {
  strokeWeight(5);
  stroke(255);
  fill(r, g, b);
}

int getNumberClicked() {
  for (int i = 0; i < 4; i = i+1) {
    if (dist(mouseX, mouseY, beginingCenter + i *(circleWidth + 20), circleHeight)< (circleWidth/2)) {
      return i + 1;
    }
  }
  return hightLightNumber;
}

void showGameOverScreen(){
  if(userWon){
    background(0,255,0);
    drawText("You won, congratualtions!");
  }
  else{
    background(255,0,0);
    drawText("You lost");
  }
  
}

void mouseReleased() {
  if (userSelect) {
    hightLightNumber = getNumberClicked();
    if (hightLightNumber != 0) {
      println("you selected: "+ hightLightNumber);
      if (hightLightNumber == numberList[placeCounter]) {
        println("right!");
        placeCounter = placeCounter+1;
        println("Place holder is: "+placeCounter);
        if (placeCounter >= 4) {
          println("game over! you won!");
          gameOver = true;
          userWon = true;
        }
      }
      else {
        println("you failed! right box was: "+numberList[placeCounter]);
        gameOver = true;
      }

      println("set hightLightNumber to: "+hightLightNumber);
    }
  }
  else {
    println("setting sstarting to true");
    starting = true;
  }
}


int computerScore;
int playerScore;
int playerCardHeight;
int computerCardHeight;
int cardWidth;
int cardHeight;
int buttonHeight;
int buttonRad = 30;
StringList computerCards;
StringList playerCards;
boolean gameOver;
int totalScore;
boolean playerWon;
int winningScore = 2;

void setup() {
  size(800, 400);
  background(150);
  computerCardHeight = 20;
  gameOver = false;
  cardWidth = 100;
  cardHeight = 120;
  playerCardHeight =computerCardHeight + cardHeight + 20;
  buttonHeight = playerCardHeight + + cardHeight +buttonRad +10;
  playerCards= new StringList();
  computerCards= new StringList();
  int newCardValue =hit();
  playerScore = playerScore + convertCardToScore(newCardValue);
  playerCards.append(convertToCard(newCardValue));
  totalScore = 10;
}

void draw() {
  background(150);
  fill(0);
  drawPlayerScore();
  for (int i=0; i<playerCards.size(); i=i+1) {
    fill(0);
    rect(cardWidth + i *(cardWidth +10), playerCardHeight, cardWidth, cardHeight,15);
    drawCard(playerCards.get(i), cardWidth+ i *(cardWidth +10), playerCardHeight);
  }

  for (int j=0; j<computerCards.size(); j=j+1) {
    fill(0);
    rect(cardWidth + j *(cardWidth +10), computerCardHeight, cardWidth, cardHeight,15);
    if (gameOver) {
      drawCard(computerCards.get(j), cardWidth+ j *(cardWidth +10), computerCardHeight);
    }
  }
  if (gameOver) {

    if (playerWon) {

      fill(0, 200, 0, 180);
    }
    else {
      fill(200, 0, 0, 180);
    }
    rect(0, 0, 800, 400);
    drawRestartButton();
  }
  else {
    drawButtons();
  }
  drawScore();
}

int hit() {
  return (int)random(1, 14);
}

boolean isBust(int score) {
  return(score > 21);
}

boolean doesComputerHit() {
  println("Computer score: "+computerScore);
  return computerScore < 18;
}

void drawScore(){
  textAlign(CENTER, CENTER);
  fill(255);
  textSize(30);
  text("Score: "+totalScore, width - 80, 20);
}

void drawPlayerScore(){
  textAlign(CENTER, TOP);
  fill(255);
  textSize(20);
  text(""+playerScore, 15, playerCardHeight);
  text(""+computerScore, 15, computerCardHeight);
  
}

void drawCard(String cardNumber, int cardWidthPos, int cardHeightPos) {
  textAlign(LEFT, TOP);
  fill(255);
  strokeWeight(7);
  if (cardNumber.equals("10")) {
    textSize(60);
  }
  else {
    textSize(110);
  }
  text(cardNumber,cardWidthPos +15 ,cardHeightPos);
  strokeWeight(1);
}

String convertToCard(int cardNumber){
  if(cardNumber>1 && cardNumber <11){
    return ""+cardNumber;
  }
  if(cardNumber== 1){
    return "A";
  }
  if(cardNumber== 11){
    return "J";
  }
  if(cardNumber== 12){
    return "Q";
  }
 
  if(cardNumber== 13){
    return "K";
  }
  return null;
}

void mouseReleased() {
  if (!gameOver) {
    if (pressedHitButton()) {
      int newCardValue =hit();
      playerScore = playerScore + convertCardToScore(newCardValue);
      playerCards.append(convertToCard(newCardValue));
      if (isBust(playerScore)) {
        drawPlayerLostScreen();
      }
    }
    else {
      if (pressedStickButton()) {
        gameOver = true;
        while (doesComputerHit ()) {
          int newCardValue =hit();
          computerScore = computerScore+convertCardToScore(newCardValue);
          computerCards.append(convertToCard(newCardValue));
        }
        if (isBust(computerScore)) {
          drawComputerLostScreen();
        }
        else {
          if (playerScore>=computerScore) {
            drawComputerLostScreen();
          }
          else {
            drawPlayerLostScreen();
          }
        }
      }
    }
  }
  else{
    if (pressedHitButton()) {
      resetGame();
    }
  }
}

void resetGame(){
  playerCards= new StringList();
  computerCards= new StringList();
  int newCardValue =hit();
  playerScore = convertCardToScore(newCardValue);
  playerCards.append(convertToCard(newCardValue));
  newCardValue =hit();
  computerScore= 0;
//  computerScore = convertCardToScore(newCardValue);
//  computerCards.append(newCardValue);
  gameOver = false;
  totalScore=totalScore -1;
}

void drawButtons() {
  textAlign(CENTER, CENTER);
  textSize(40);
  fill(200);
  ellipse(cardWidth+buttonRad, buttonHeight, 2*buttonRad, 2*buttonRad);
  fill(255);
  text("H", cardWidth+buttonRad, buttonHeight);
  fill(200);
  ellipse(cardWidth+4*buttonRad, buttonHeight, 2*buttonRad, 2*buttonRad);
  fill(255);
  text("S", cardWidth+4*buttonRad, buttonHeight);
}

void drawRestartButton() {
  textAlign(CENTER, CENTER);
  textSize(40);
  fill(200);
  ellipse(cardWidth+buttonRad, buttonHeight, 2*buttonRad, 2*buttonRad);
  fill(255);
  text("R", cardWidth+buttonRad, buttonHeight);
  fill(200);
}

boolean pressedHitButton() {
  return dist(mouseX, mouseY, cardWidth+buttonRad, buttonHeight)< buttonRad;
}

boolean pressedStickButton() {
  return dist(mouseX, mouseY, cardWidth+4*buttonRad, buttonHeight)< buttonRad;
}

int convertCardToScore(int cardvalue) {
  if (cardvalue > 10) {
    cardvalue = 10;
  }
  return cardvalue;
}

void drawPlayerLostScreen() {
  gameOver = true;
  playerWon = false;
  println("You Lost! ");
  println("Your score "+playerScore);
  println("Computer score "+computerScore);
}

void drawComputerLostScreen() {
  gameOver = true;
  playerWon = true;
  println("You Won! ");
  println("Your score "+playerScore);
  println("Computer score "+computerScore);
  totalScore = totalScore + winningScore;
}


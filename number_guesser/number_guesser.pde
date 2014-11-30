boolean startGame=false;
boolean gameWon=false;
int guess;
int nextGuess;
int number;
int guessCounter = 0;
int textVertPos = 50;
int textHozPos = 20;
String message = "";

void setup() {
  // Images must be in the "data" directory to load correctly
  size(800, 200);
  background(0);
  number = (int)random(0, 21);
}

void draw() {
  background(0);
  if (startGame) {
    drawText("Your guess: "+guess, 0);
    drawText(message, 100);
    drawScore();
  }
  else {
    drawText("Guess the number!", 0);
    drawText("Enter a number between 0-20", 100);
  }
}

void drawScore() {
  textSize(20);
  text("Guesses: "+guessCounter, width - 120, 20);
}

void keyPressed() {
  if (key >= '0' && key <= '9') {
    nextGuess = nextGuess *10 + ((int)key -48) ;
  } 
  else if (key == ENTER) {
    if (nextGuess> 20 ||nextGuess<0) {
      message = nextGuess+" wrong; must be between 0 and 20";
    }
    else {
      guess = nextGuess;
      test();
    }

    nextGuess= 0;
    gameWon = false;
    startGame = true ;
  }
}

void test() {
  println("testing " + guess +" against "+ number);
  if (number == guess) {
    gameWon = true;
    message ="You won! In "+guessCounter +" guesses.";
    number = (int)random(0, 21);
  }
  else {
    if (number<guess) {
      message= "lower!";
    }
    else {
      if (number>guess) {
        message ="higher!";
      }
    }
    guessCounter ++;
    //guess= 0;
  }
}

void drawText(String text, int h) {
  //  textMode(CENTER);
  fill(255);
  textSize(40);
  text(text, textHozPos, textVertPos + h);
}


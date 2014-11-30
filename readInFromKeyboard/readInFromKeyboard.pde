
String guess = "";

void setup() {
  // Images must be in the "data" directory to load correctly
  size(800, 800);
  background(0);
}

void draw() {
  background(0);
  text(guess, 10, 10);
}
void keyPressed() {
  if (key >= 'A' && key <= 'Z') {
    guess += key ;
    guess.toLowerCase();
  } 
  else if ((key >= 'a' && key <= 'z') || (key>='0' && key <= '9') ||key ==' ') {
    guess += key ;
  }
  if (key == BACKSPACE && guess.length()>0) {
    guess= guess.substring(0, guess.length() - 1);
  }
  if (key == ENTER) {
    guess= guess+ "\n";
  }
}


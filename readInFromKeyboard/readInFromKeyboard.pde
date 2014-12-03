//init the input string
String keyboardInput = "";

void setup() {
  size(400, 150);
  background(0);
  textSize(20);
}

void draw() {
  background(0);
  text(keyboardInput, 10, 20);
}

//deal with various inputs
void keyPressed() {
  if (key >= 'A' && key <= 'Z') {
    keyboardInput += key;
  } 
  else if ((key >= 'a' && key <= 'z') || (key>='0' && key <= '9') ||key ==' ') {
    keyboardInput += key ;
  }
  if (key == BACKSPACE && keyboardInput.length()>0) {
    keyboardInput= keyboardInput.substring(0, keyboardInput.length() - 1);
  }
  if (key == ENTER) {
    keyboardInput= keyboardInput+ "\n";
  }
}


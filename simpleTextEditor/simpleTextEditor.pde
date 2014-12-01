//init the input string
String keyboardInput = "";
boolean isBold;
boolean isItailic;
int buttonVertPos = 50;
int buttonWidth = 40;


void setup() {
  size(400, 150);
  background(0);
  textSize(20);
}

void draw() {
  background(0);
  text(keyboardInput, 10, buttonVertPos + buttonWidth + 10);
}


void drawButtons(){
  drawButtonPanel();
  drawBoldButton();
  drawItalicsButton():
  drawSaveButton();

}
void drawButtonPanel(){
  fill(0);
  rect(0,0,width,buttonVertPos + buttonWidth +10,);
}



//deal with varius inputs
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


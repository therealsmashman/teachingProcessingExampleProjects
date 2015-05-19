String text = "This is the text you are modifying";
String oldWord = "";
String newWord = "";
boolean enteringOldWord = true;
boolean enteringNewWord = false;

void setup() {
  size(800, 400);
  textSize(20);
}

void draw() {
  background(0);
  text("Text that you are changing:", 20, 20);
  text('"'+text+'"', 20, 60);
  text("Old: ", 20, 100);
  text(oldWord, 100, 100);
  text("New: ", 20, 160);
  text(newWord, 100, 160);
  //  text(simonTest.replace("while", "balls"), 20, 20);
}

void keyReleased() {
  if (enteringOldWord) {
    if (key == ENTER) {
      enteringOldWord= false;
      enteringNewWord = true;
    }
    else {
      oldWord += key;
    }
  }
  else {

    if (enteringNewWord) {
      if (key == ENTER) {
        enteringNewWord = false;
        text = text.replace(oldWord, newWord);
      }
      else {
        newWord += key;
      }
    }
  }
}


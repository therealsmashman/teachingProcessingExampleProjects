String text ;
String messageInput ="";
boolean setNumber = false;
boolean finishedInput = false;
int textHozPos = 20;
int textVertPos = 40;
int shiftNumber = 0;

void setup() {
  size(600, 400);
  
//  text = "abcdefghijklmnopqurstuvwxyz";



//  println(convertTOCharArray(text));
//  println(char(97));
//  println(shiftMessage(convertTOCharArray(text), 13));
}
void draw() {
  background(0);
  if (!setNumber) {
    drawText("Enter message to be translated: " +messageInput, 0);
  }
  else {
    if (!finishedInput) {
      drawText("Message: " +messageInput, 0);
      drawText("Enter number to shift by: " +shiftNumber, 40);
    }
    else {
      drawText("Original message: "+messageInput,0);
      drawText("Shifted message: "+shiftMessage(convertTOCharArray(messageInput), shiftNumber), 40);
    }
  }
}

String shiftMessage(char[] message, int number) {
  for (int i = 0; i < message.length ; i++) {
    int temp =(int) message[i] + number;
    if (temp>122) {
      temp = (temp - 26);
    }
    message[i] = (char)temp;
    //    122
    //    96
    //26
  }
  String msgAsString = new String(message);
  return msgAsString;
}

char[] convertTOCharArray(String yourString) {
  //  char[] echars = new char[text.length()];
  //  text.getChars(0, text.length()-1, echars, 0);
  char[] allChars = new char[yourString.length()];
  for (int i = 0; i < yourString.length(); i++) {
    allChars[i] = yourString.charAt(i);
    //    println(allChars[i]);
  }
  return allChars;
}

void drawText(String text, int h) {
  fill(255);
  textSize(20);
  text(text, textHozPos, textVertPos + h);
}


void keyPressed() {
  if (!setNumber) {
//    println("Entering letter: "+ key);
//    println("message is: " +messageInput);
//    println("Set number is: " +setNumber);
    if (key == ENTER) {
      setNumber = true;
    }
    else {
      if (key >= 'A' && key <= 'Z') {
        messageInput += key ;
        messageInput= messageInput.toLowerCase();
      } 
      else if (key >= 'a' && key <= 'z') {
        messageInput = messageInput + key ;
      }
    }
  }
  else {
    if (key >= '0' && key <= '9') {
      shiftNumber = shiftNumber *10 + ((int)key -48) ;
    } 
    else {
      if (key == ENTER) {
        finishedInput = true;
      }
    }
  }
}


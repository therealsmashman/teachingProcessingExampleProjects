//init the string array
String quotes[];
int quoteNumber;
void setup() {
  size(1200, 120);
  background(0);
  //load each line of the file into a seperate string in the 
  //string array.
  quotes  = loadStrings("quotes.txt");
  //initial quote number.
  quoteNumber = (int)random(0, quotes.length);
  textSize(16);
}

void draw() {
  background(220);
  fill(0, 0, 255);
  //show quote
  text(quotes[quoteNumber], 0, 20);
}

//change quote on mouse click
void mouseReleased(){
  quoteNumber = (int)random(0, quotes.length);
}


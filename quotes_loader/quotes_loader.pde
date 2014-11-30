String quotes[];
int quoteNumber;
void setup() {
  size(1200, 120);
  background(0);
  quotes  = loadStrings("quotes.txt");
  quoteNumber = (int)random(0, quotes.length);
  textSize(16);
}

void draw() {
  background(220);
  fill(0, 0, 255);
  text(quotes[quoteNumber], 0, 20);
}

void mouseReleased(){
  quoteNumber = (int)random(0, quotes.length);
}


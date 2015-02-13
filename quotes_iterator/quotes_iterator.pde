String quotes[];
int quoteNumber;
void setup() {
  size(1200, 120);
  background(0);
  quotes  = loadStrings("quotes.txt");
  quoteNumber = 0;
  textSize(16);
}

void draw() {
  background(220);
  fill(0, 0, 255);
  text(quotes[quoteNumber], 0, 20);
  if(keyPressed){
    if(key == 'd'){
      quoteNumber = quoteNumber +1;
    }
    if(key == 'a' && quoteNumber >0){
      quoteNumber = quoteNumber -1;
    }
  }
}


void keyReleased(){
  if(key == 'q'){
      quoteNumber = quoteNumber +1;
    }
    if(key == 'e' && quoteNumber >0){
      quoteNumber = quoteNumber -1;
    }
}

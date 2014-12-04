//use intlists to keep all of the 
IntList topRidgeHeights;
IntList bottomRidgeHeights;
float charecterVerticalPosition;
float speed;
float widthOfRidges;


void setup() {
  
  size(800, 800);
  topRidgeHeights = new IntList();
  topRidgeHeights = new IntList();
  for(int i=0; i<10; i++ ){
    topRidgeHeights.append(50);
    topRidgeHeights.append(50);
  }
  widthOfRidges = width /topRidgeHeights.size();
  speed = 2;
  charecterVerticalPosition = height/2;
  background(0);
}

void draw() {
  
  
}
void drawBackgound(){
  background(0);
}

void drawRidges(){
  fill(220);
  noStroke();
  for(int i=0; i<topRidgeHeights.size(); i++ ){
    rect(widthOfRidges*i, 0, widthOfRidges, topRidgeHeights.get(i));
    rect(widthOfRidges*i, height - bottomRidgeHeights.get(i), widthOfRidges,bottomRidgeHeights.get(i));
  }
}

void charecterControls() {
  if (keyPressed) {
    if (key.toLowerCase() == 'w') {
      charecterVerticalPosition -= speed;
    }
    if (key.toLowerCase() == 's') {
      charecterVerticalPosition += speed;
    }
  }
}


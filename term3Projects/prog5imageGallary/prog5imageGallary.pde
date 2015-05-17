String[] imagesURLs = {
  "https://i.imgur.com/JoF5FNd.jpg", 
  "https://i.imgur.com/fQpmoXE.jpg", 
  "https://i.imgur.com/FwgZFNn.jpg", 
  "https://i.imgur.com/thO0kf0.jpg"
};
ArrayList<PImage> images;
PImage img;
void setup() {
  size(600, 400); 
  textSize(40);
  images= new ArrayList<PImage>();
  for (int i = 0; i< imagesURLs.length; i++) {
    img = loadImage(imagesURLs[i]);
    img.resize(80, 100);
    images.add(img);
  }
}
void draw() {
  text("Click button to see full image.", 20, 50);
  for (int i=0; i < images.size(); i++) {
    image(images.get(i), 100+ 100*i, 100);
    fill(0, 255, 0);
    ellipse(140+ 100*i, 250, 80, 80);
    fill(255);
    text(""+(i+1), 130+ 100*i, 260);
  }
}

void mouseReleased() {
  for (int i=0; i < images.size(); i++) {
    if (dist(mouseX, mouseY, 140+ 100*i, 250)<=40) {
      link(imagesURLs[i]);
    }
  }
}


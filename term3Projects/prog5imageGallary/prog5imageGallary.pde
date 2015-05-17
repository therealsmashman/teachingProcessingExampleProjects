String[] imagesURLs = {
  
  "https://i.imgur.com/JoF5FNd.jpg",
  "https://i.imgur.com/fQpmoXE.jpg",
  "https://i.imgur.com/FwgZFNn.jpg",
  "https://i.imgur.com/thO0kf0.jpg"
  
};
ArrayList<PImage> images;
PImage img;
void setup(){
 size(600,400); 
 images= new ArrayList<PImage>();
 for(int i = 0; i< imagesURLs.length; i++){
   img = loadImage(imagesURLs[i]);
   img.resize(75, 100);
   images.add(img);
 }
 
 
}
void draw(){
  for(int i=0; i < images.size(); i++){
    image(images.get(i),100+ 100*i,100);
  }
}


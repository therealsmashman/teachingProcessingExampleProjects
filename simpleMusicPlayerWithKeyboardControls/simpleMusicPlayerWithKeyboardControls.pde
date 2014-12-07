//Simple example mp3 playing program
//Some extra functionailty such as controls 
//for the music player
import ddf.minim.*;
//need sound playing library object 
Minim minim;
//sound player
AudioPlayer myAudioPlayer;
int textHozPos; 
int textVertPos;
void setup() {
  
  size(200, 200);
  //New sound library object.
  //pass this to it so it can read from the data folder.
  //STUDENTS IGNORE THIS - just know we need this line
  minim = new Minim(this);
  // use sound library to load the initial file into
  //the audio player. File needs to be in the project folder.
  myAudioPlayer = minim.loadFile("cuteShort.mp3");
  background(0);
  //set the text size for the whole project
  textSize(20);
  textHozPos =20;
  textVertPos = 50;
}

void draw() {
  //strings are added suing the '+' symbol
  //"\n" means put a new line here
  drawText("Controls: \n"+
            "'p' to play \n"+
            "'a' to pause \n" +
            "the music");
  //check for new input from there user
  playerControls() ;
}


//control whether to play or pause the music
void playerControls() {
  if (keyPressed) {
    if (key == 'p') {
      myAudioPlayer.play();
    }
    if (key == 'a') {
      myAudioPlayer.pause();
    }
  }
}
//draw white text at the global text positions
void drawText(String text) {
  fill(255);
  text(text, textHozPos, textVertPos);
}

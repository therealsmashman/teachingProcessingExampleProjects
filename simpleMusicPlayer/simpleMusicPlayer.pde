//Simple example mp3 playing program
import ddf.minim.*;
//need sound playing library object 
Minim minim;
//sound player
AudioPlayer myAudioPlayer;
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
  
}

void draw() {
  //tell the player to play the music
  myAudioPlayer.play();
}

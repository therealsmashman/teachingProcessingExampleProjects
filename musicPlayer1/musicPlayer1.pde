// example mp3 program written without using classes.
import ddf.minim.*;
import java.io.*;
String dir;
boolean fileName=true; 
String currentSontLength = "";
StringList playList;
int playHoz = 100;
int buttonVert = 200;
int buttonVertLevel2 = 280;
int stopHoz = 220;
int loadIconHoz = 340;
int load2IconHoz = 460;
int shuffleHozPoz = 560;
int infoHozPos = 50;
int infoVertPos = 25;
int songNumber = 0;
int songlength;
boolean startRunning = false;
boolean isShuffling = true;
boolean isLooping = true;
boolean stopPlaying = false;
AudioMetaData meta;
Minim minim;
AudioPlayer player;

void setup()
{
  size(650, 300, P3D);
  rectMode(CENTER);
  // we pass this to Minim so that it can load files from the data directory
  minim = new Minim(this);

  // get the initial file
  player = minim.loadFile("cuteShort.mp3");
  songlength = player.length();
  songlength-=100;
  meta = player.getMetaData();

  playList = new StringList();
  playList.append("cuteShort.mp3");
  playList.append("jazzcomedyShort.mp3");
  playList.append("funnysongShort.mp3");

  // you need to call rewind() first.
}

void draw()
{
  if (fileName) {
    background(0);
    //stroke(255);
    checkIfFinished();
    drawIcons() ;
    playerControls();
    if (mousePressed ) {
      checkpositon();
    }
    drawPitch();
  }
}
void checkIfFinished() {
  //  println("In checkIfFinished palyer position: "+player.position() + " player lenght " +songlength);
  if (player.position() >songlength) {
    playNextSong();
  }
}

void playNextSong() {
  player.pause();
  if (playList.size()<2) {
    if (isLooping) {
      player.rewind();
    }
  }
  else {
    if (isShuffling) {
      songNumber = (int)random(0, playList.size());
      println("new songnumber is: "+songNumber);
    }
    else {
      songNumber++;
      if (songNumber>playList.size()-1) {
        songNumber = 0;
        if(!isLooping){
          stopPlaying = true;
        }
        
      }
    }
    if (!isLooping && stopPlaying) {
      player.pause();
    }
    else {

      player = minim.loadFile(playList.get(songNumber));
      songlength = player.length()-100;
      currentSontLength = convertToSeconds(player.length()) ;
      player.play();
      meta = player.getMetaData();
    }
  }
}

void drawInfo() {
  int lineHeight = 20;
  //use local heigh var so we can have dynamic lines of infomation
  int localInVertPos = infoVertPos;
  fill(255);
  text("POSITION: "+ convertToSeconds(player.position()) +"/"+currentSontLength, infoHozPos, localInVertPos);
  text("SONG "+(songNumber +1) +"/"+playList.size(), infoHozPos, localInVertPos+=lineHeight);
  //only show not null metadata
  if (meta.fileName() !="") {
    text("FILE NAME: " + meta.fileName(), infoHozPos, localInVertPos+=lineHeight);
  }
  if (meta.title() !="") {
    text("TITLE: " + meta.title(), infoHozPos, localInVertPos+=lineHeight);
  }
  if (meta.author() !="") {
    text("AUTHER: " + meta.author(), infoHozPos, localInVertPos+=lineHeight);
  }
  if (meta.album() !="") {
    text("ALBUM: " + meta.album(), infoHozPos, localInVertPos+=lineHeight);
  }
}
void drawPitch() {
  fill(100);
  rect(loadIconHoz + 25, infoVertPos + 40, 350, 100);
  if (player.isPlaying()) {
    stroke(255);
    for (int i = 0; i < player.bufferSize() - 1; i++)
    {
      float x1 = map( i, 0, player.bufferSize(), loadIconHoz-145, loadIconHoz+195 );
      float x2 = map( i+1, 0, player.bufferSize(), loadIconHoz-145, loadIconHoz+195 );
      line( x1, 40 + player.left.get(i)*25, x2, 40 + player.left.get(i+1)*25 );
      line( x1, 90 + player.right.get(i)*25, x2, 90 + player.right.get(i+1)*25 );
    }
    stroke(0);
  }
}
String convertToSeconds( int milliseconds) {
  int seconds = (int) (milliseconds / 1000) % 60 ;
  int minutes = (int) ((milliseconds / (1000*60)) % 60);
  return minutes + "m:" +seconds + "s";
}
void playerControls() {
  if (keyPressed) {
    if (key == 'p') {
      player.play();
    }
    if (key == 's') {
      player.close();
    }
    if (key == 'a') {
      player.pause();
    }
  }
}

void drawIcons() {
  drawInfo();
  drawPlay();
  drawStop();
  drawNextIcon() ;
  drawLoadIcon() ;
  drawShuffleButton();
  drawRepeatButton();
}
void drawPlay() {
  fill(200);
  ellipse(playHoz, buttonVert, 100, 100);
  fill(0);
  triangle(playHoz - 20, buttonVert + 25, playHoz - 20, buttonVert - 25, playHoz +30, buttonVert);
}

void drawStop() {
  fill(200);
  ellipse(stopHoz, buttonVert, 100, 100);
  fill(0);
  rect(stopHoz, buttonVert, 50, 50);
}

void drawLoadIcon() {
  fill(200);
  ellipse(load2IconHoz, buttonVert, 100, 100);
  fill(0);
  triangle(load2IconHoz - 25, buttonVert + 20, load2IconHoz, buttonVert - 30, load2IconHoz +25, buttonVert + 20);
  //  rect(stopHoz - 25, buttonVert - 25, 50, 50);
}

void drawNextIcon() {
  fill(200);
  ellipse(loadIconHoz, buttonVert, 100, 100);
  fill(0);
  triangle(loadIconHoz - 20, buttonVert + 15, loadIconHoz - 20, buttonVert - 15, loadIconHoz +5, buttonVert);
  triangle(loadIconHoz, buttonVert + 15, loadIconHoz, buttonVert - 15, loadIconHoz +25, buttonVert);
}

void drawShuffleButton() {
  fill(200);
  ellipse(shuffleHozPoz, buttonVert +27, 60, 40);
  strokeWeight(3);
  if (isShuffling) {
    line(shuffleHozPoz-20, buttonVert +17, shuffleHozPoz + 20, buttonVert+37);
    line(shuffleHozPoz-20, buttonVert +37, shuffleHozPoz + 20, buttonVert+17);
  }
  else {
    line(shuffleHozPoz-20, buttonVert +27, shuffleHozPoz + 20, buttonVert +27);
  }
  strokeWeight(1);
}

void drawRepeatButton() {
  fill(200);
  ellipse(shuffleHozPoz, buttonVert -27, 60, 40);
  noFill();
  strokeWeight(3);
  ellipse(shuffleHozPoz, buttonVert -27, 30, 30);
  if (!isLooping) {
    line(shuffleHozPoz-15, buttonVert -37, shuffleHozPoz + 15, buttonVert-17);
  }
  fill(200);
  strokeWeight(1);
}

void drawPause() {
}

void checkpositon() {
  if (dist(mouseX, mouseY, playHoz, buttonVert)< 50) {
    player.play();
    currentSontLength =convertToSeconds(player.length());
  }
  if (dist(mouseX, mouseY, stopHoz, buttonVert)< 50) {
    player.pause();
  }
}

void mouseReleased() {

  if (dist(mouseX, mouseY, load2IconHoz, buttonVert)< 50) {
    //    player.pause();

    loadNewSongs();
  }
  if (dist(mouseX, mouseY, loadIconHoz, buttonVert)< 50) {

    playNextSong();
  }
  if (dist(mouseX, mouseY, shuffleHozPoz, buttonVert +27)< 40) {
    isShuffling= !isShuffling;
  }
  if (dist(mouseX, mouseY, shuffleHozPoz, buttonVert -27)< 40) {
    isLooping= !isLooping;
  }
}

void loadNewSongs() {
  if (fileName) {
    fileName=false; 
    selectInput("Select a mp3 to add to the playlist:", "trackSelected");
  }
  else {
    fileName=true;
  }
}

void trackSelected(File selection) {

  if (selection == null) {
    println("Window was closed or the user hit cancel.");
    showErrorMessage("Window was closed or the user hit cancel.");
  } 
  else {
    String path = selection.getAbsolutePath();
    path = path.replace("\\", "\\\\");
    String title = split(path, '\\')[split(path, '\\').length -1];
    if (!split(title, '.')[1].toLowerCase().equals("mp3")) {
      showErrorMessage("Not MP3 file");
    }
    else {
      playList.append(path);
      println("added File! "+ path);
      fileName=true;
    }
  }
}

void showErrorMessage(String errorMessage) {
  fill(255, 0, 0);
  text("ERROR: "+ errorMessage, 50, height - 100);
}


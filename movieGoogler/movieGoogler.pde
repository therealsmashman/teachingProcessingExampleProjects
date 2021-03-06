String queryStart = "http://www.omdbapi.com/?r=xml&t=";
String movieName = "";
String releaseYesr = "";
String incorrectMovieTitle = "";
boolean displayResult = false;
boolean noResult = false;
int textHozPos = 20;
int textVertPos = 30;
XML movieXML;
PImage poster;
String[] attributesToShow = {
  "title", "director", "year", "genre", "imdbRating", "actors", "awards", "released"
};

void setup() {
  size(800, 300);
}

void draw() {
  background(150);
  if (displayResult) {
    displayResults();
    drawRestartButton();
  }
  else {
    if (noResult) {
      drawText("No result for title \""+incorrectMovieTitle+"\"", 40, 20);
    }
  }
  drawText("Movie name: "+movieName, 0, 30);
}

void displayResults() {
  int line = 20;
  for (int j = 0; j< attributesToShow.length; j=j+1) {
    if (movieXML.hasAttribute(attributesToShow[j])) {
      drawText(attributesToShow[j].toUpperCase() + " : "+movieXML.getString(attributesToShow[j]), line, 15);
      line=line + 15;
    }
  }
  if(movieXML.hasAttribute("plot")){
    String line1 = movieXML.getString("plot").substring(0,100);
    drawText("plot".toUpperCase() + " : "+movieXML.getString("plot").substring(0,65), line, 15);
    int plotLength =movieXML.getString("plot").length();
    if(plotLength > 143){
      drawText(movieXML.getString("plot").substring(65,143), line +15, 15);
      drawText(movieXML.getString("plot").substring(143,plotLength), line +30, 15);
    }
    else{
      drawText(movieXML.getString("plot").substring(60,plotLength), line +15, 15);
    }
  }
  if (movieXML.hasAttribute("poster")) {    
    poster = loadImage(movieXML.getString("poster"));
    poster.resize(200, 300);
    image(poster, width-200, 0);
  }
}

void getData() {
  String movieNameForApi =movieName.replace(" ", "%");
  movieNameForApi = movieNameForApi.trim();
  println("Calling api on "+ movieNameForApi);
  println("Full call is: " + queryStart + movieNameForApi);
  println(loadStrings(queryStart + movieNameForApi));
  println(loadStrings(queryStart + movieNameForApi).length);
  XML xml = loadXML(queryStart + movieNameForApi);
  println(xml);
  println("--------------");
  println("response is: "+xml.getString("response"));
  if (xml.getString("response").equals("True")) {
    movieXML = xml.getChildren("movie")[0];
    String [] attributes = movieXML.listAttributes();
    for (int i =0; i < attributes.length; i = i+1) {
      println(attributes[i] +" : "+movieXML.getString(attributes[i]));
    }
    displayResult = true;
    noResult = false;
  }
  else {
    noResult = true;
    incorrectMovieTitle= movieName;
    movieName = "";
  }
}

void drawText(String text, int h, int textSize) {
  textAlign(TOP, LEFT);
  fill(255);
  textSize(textSize);
  text(text, textHozPos, textVertPos + h);
}

void keyPressed() {
  if (key >= 'A' && key <= 'Z') {
    movieName += key ;
    movieName.toLowerCase();
  } 
  else if ((key >= 'a' && key <= 'z') || (key>='0' && key <= '9') ||key ==' ') {
    movieName += key ;
  }
  if (key == BACKSPACE && movieName.length()>0) {
    movieName= movieName.substring(0, movieName.length() - 1);
  }
  if (key == ENTER) {
    getData();
  }
}

void mouseReleased() {
  if (hitRestartButton()) {
    movieName = "";
    displayResult = false;
  }
}

boolean hitRestartButton() {
  return dist(mouseX, mouseY, 50, height - 50)< (40);
}

void drawRestartButton() {
  fill(200);
  ellipse(50, height - 50, 80, 80);
  fill(0);
  textAlign(CENTER, CENTER);
  textSize(20);
  text("Restart", 50, height - 50);
}

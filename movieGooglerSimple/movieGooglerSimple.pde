String queryStart = "http://www.omdbapi.com/?r=xml&t=";
String movieName = "";
String incorrectMovieTitle = "";
//flags to set the showing data
boolean displayResult = false;
boolean noResult = false;
int textHozPos = 20;
int textVertPos = 30;
XML movieXML;
PImage poster;
String[] attributesToShow = {
  "title", "director", "released", "runtime","genre", "imdbRating", "actors", "awards", "released"
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
  if (movieXML.hasAttribute("poster")) {    
    poster = loadImage(movieXML.getString("poster"));
    poster.resize(200, 300);
    image(poster, width-200, 0);
  }
}

void getData() {
  String movieNameForApi =movieName.replace(" ", "%");
  movieNameForApi = movieNameForApi.trim();
  //load the results from the api call.
  XML xml = parseXML(loadStrings(queryStart + movieNameForApi)[0]);
  //check for a movie child, then set flags to show the result
  if (xml.getChildren("movie").length > 0) {
    movieXML = xml.getChildren("movie")[0];
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
  //reset the query string
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

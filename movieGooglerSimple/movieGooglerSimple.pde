String queryStart = "http://www.omdbapi.com/?r=xml&t=";
String movieName = "";
String incorrectMovieTitle = "";
//flags to set the showing data
boolean displayResult = false;
boolean noResult = false;
//initial text positions
int textHozPos = 20;
int textVertPos = 30;
//global xml object to store query result
XML movieXML;
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
  }
  else {
    if (noResult) {
      drawText("No result for title \""+incorrectMovieTitle+"\"", 40, 20);
    }
  }
  drawText("Movie name: "+movieName, 0, 30);
}

void displayResults() {
  int lineVerticalPosition = 20;
  //iterate through the arributes we want to show, printing them if they exist and the moving down the screen
  for (int j = 0; j< attributesToShow.length; j=j+1) {
    if (movieXML.hasAttribute(attributesToShow[j])) {
      drawText(attributesToShow[j].toUpperCase() + " : "+movieXML.getString(attributesToShow[j]), lineVerticalPosition, 15);
      lineVerticalPosition=lineVerticalPosition + 15;
    }
  }
  //load poster image if it exists, same as loading local image, just pass in image location on the web
  if (movieXML.hasAttribute("poster")) {    
    //load the poster from the address stored in the XML
    PImage poster = loadImage(movieXML.getString("poster"));
    //resize and show the resultant image
    poster.resize(width/4, height);
    image(poster, 3*width/4, 0);
  }
}

void getData() {
  //amend string for api call - new string so the enter query stays the same oi the ui
  String movieNameForApi =movieName.replace(" ", "%");
  movieNameForApi = movieNameForApi.trim();
  //load the results from the api call.
  XML xml = loadXML(queryStart + movieNameForApi);
  //check for a movie child, then set flags to show the result or not
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

void drawText(String text, int tesxtVerticalPosition, int textSize) {
  textAlign(TOP, LEFT);
  fill(255);
  textSize(textSize);
  text(text, textHozPos, textVertPos + tesxtVerticalPosition);
}
//use existing keyboard input logic, includes backspace and action on enter
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

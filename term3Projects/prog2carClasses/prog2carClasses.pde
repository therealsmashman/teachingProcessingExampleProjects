// We have a list of all the cars in the game. it is defined here but not made till later.
//Note that this is different to the IntList used in the blackjack game
//<Car> is the type of variable stored in this list. allCars is the name of the list.
ArrayList<Car> allCars;
//need a counted to count through the item in the list
int  carCounter = 0;
//here we set the number of cars we want in the list (and the game)
int numberOfCars = 6;
int maxSpeed = 5;
int winningCarNo = 0;
IntList finalStandings; 
void setup() {
  //the size of the screen depends on the number of cars.
  size(800, numberOfCars *60 +40);
  //initialize the new car list. We make the list here. 
  //At the moment it is empty (has not Car objects in it.
  allCars = new ArrayList<Car>();
  finalStandings = new IntList();
  //We add a new Car object to the list, for each number in numberOfCars
  while (carCounter < numberOfCars) {
    //make a new car object - its vert position depends on its number.
    Car newCar = new Car(20, 20 + carCounter * 60, carCounter +1);
    //set a random speed for each car in the list.
    newCar.setSpeed((int)random(1, maxSpeed));
    newCar.changeColour((int)random(0, 255), 
    (int)random(0, 255), 
    (int)random(0, 255));
    //add the newly make car to the list
    allCars.add(newCar);
    carCounter +=1;
  }
  carCounter = 0;
}

//draw all of the car objects - see how they differ
void draw() {
  background(0, 200, 0);

  while (carCounter < allCars.size ()) {
    //get the car object in that position in the list
    //and call the drawCar method on it.
    allCars.get(carCounter).drawCar();
    carCounter +=1;
  }
  //why do we need this? Try taking it out.
  carCounter = 0;
  setWonCar();

  if (finalStandings.size() > 0) {
    fill(0, 0, 200, 160);
    rect(0, 0, width, height);
    fill(255);
    textSize(30);
    text("FINAL STANDINGS ARE:", 20, 40);
    for (int i = 0; i < finalStandings.size(); i++) {
      text((i+1) + " CAR " + finalStandings.get(i), 20, 80 + i * 50);
    }
  }
}

void setWonCar() {
  for (int i =0; i<allCars.size() ; i++) {
    if (allCars.get(i).isFinished() && !finalStandings.hasValue(allCars.get(i).getCarNo())) {
      finalStandings.append(allCars.get(i).getCarNo());
    }
  }
}


// We have a list of all the cars in the game. it is defined here but not made till later.
//Note that this is different to the IntList used in the blackjack game
//<Car> is the type of variable stored in this list. allCars is the name of the list.
ArrayList<Car> allCars;
//need a counted to count through the item in the list
int  carCounter = 0;
//here we set the number of cars we want in the list (and the game)
int numberOfCars = 8;
int maxSpeed = 8;
void setup(){
  //the size of the screen depends on the number of cars.
  size(400,numberOfCars *30 +40);
  //initialize the new car list. We make the list here. 
  //At the moment it is empty (has not Car objects in it.
  allCars = new ArrayList<Car>();
  
  //We add a new Car object to the list, for each number in numberOfCars
  while (carCounter < numberOfCars) {
    //make a new car object - its vert position depends on its number.
    Car newCar = new Car(20,20 + carCounter * 30);
    //set a random speed for each car in the list.
    newCar.setSpeed((int)random(1,maxSpeed));
    newCar.changeColour((int)random(0,255),
                        (int)random(0,255),
                        (int)random(0,255));
    //add the newly make car to the list
    allCars.add(newCar);
    carCounter +=1;
  }
  carCounter = 0;
}

//draw all of the car objects - see how they differ
void draw(){
  
  background(0,200,0);
  while (carCounter < allCars.size()) {
    //get the car object in that position in the list
    //and call the drawCar method on it.
    allCars.get(carCounter).drawCar();
    carCounter +=1;
  }
  //why do we need this? Try taking it out.
  carCounter = 0;
}

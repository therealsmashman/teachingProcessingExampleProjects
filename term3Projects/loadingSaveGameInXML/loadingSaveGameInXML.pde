XML saveGame;
void setup() {
  saveGame = loadXML("saveGame.xml");
  XML[] savedInvaders =saveGame.getChildren("invader");
  XML savedPlayer = saveGame.getChildren("player")[0];
  XML[] savedWells = saveGame.getChildren("well");
  println("The player had health "+ savedPlayer.getInt("health") + " and hoz " + savedPlayer.getInt("hozPos") + " and vert positions: " +savedPlayer.getInt("vertPos"));

  for (int i = 0; i < savedInvaders.length; i++) {
    int invaderHealth = savedInvaders[i].getInt("health");
    int invaderHozPoz = savedInvaders[i].getInt("hozPos");
    int invaderVertPos = savedInvaders[i].getInt("vertPos");
    println("Invader number "+ i + " had health "+ invaderHealth + " and hoz " + invaderHozPoz + "and vert positions: " +invaderVertPos);
  }
  for (int i = 0; i < savedWells.length; i++) {
    int wellHozPoz = savedWells[i].getInt("hozPos");
    int wellVertPos = savedWells[i].getInt("vertPos");
    println("Invader number had hoz " + wellHozPoz + "and vert positions: " +wellVertPos);
  }
  println("invaders size: "+savedInvaders.length);
  println("savedWells size: "+savedWells.length);
  println("savedPlayer size: "+savedPlayer.toString());
}

void draw() {
}


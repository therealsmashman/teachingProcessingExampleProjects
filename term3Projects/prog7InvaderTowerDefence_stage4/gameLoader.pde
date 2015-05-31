//should really be a singleton - can't really teach that to kids.
class GameLoader {
  XML saveGame;
  public GameLoader(String saveName) {
    saveGame = loadXML(saveName +".xml");
  }

  public Player getPlayer() {
    Player savedPlayer;

    XML savedPlayerXML = saveGame.getChildren("player")[0];
    int savedPlayerHosPos = savedPlayerXML.getInt("hozPos");
    int savedPlayerVertPos = savedPlayerXML.getInt("vertPos");
    int savedPlayerHealth = savedPlayerXML.getInt("health");

    savedPlayer = new Player(savedPlayerHosPos, savedPlayerVertPos);
    savedPlayer.health = savedPlayerHealth;

    return savedPlayer;
  }

  public ArrayList<Well> getWells() {
    ArrayList<Well> savedWells = new ArrayList<Well>();
    
    XML[] savedWellsXML = saveGame.getChildren("well");


    for (int i = 0; i < savedWellsXML.length; i++) {
      int savedWellHozPoz = savedWellsXML[i].getInt("hozPos");
      int savedWellVertPos = savedWellsXML[i].getInt("vertPos");
      Well newWell = new Well(savedWellHozPoz, savedWellVertPos);
      savedWells.add(newWell);
    }

    return savedWells;
  }
  
  public ArrayList<Invader> getInvaders() {
    ArrayList<Invader> savedInvaders = new ArrayList<Invader>();
    
    XML[] savedInvadersXML = saveGame.getChildren("invader");


    for (int i = 0; i < savedInvadersXML.length; i++) {
      int savedInvaderHozPoz = savedInvadersXML[i].getInt("hozPos");
      int savedInvaderVertPos = savedInvadersXML[i].getInt("vertPos");
      int savedInvaderHealth = savedInvadersXML[i].getInt("health");
      
      Invader newInvader = new Invader();
      newInvader.hozPoz=savedInvaderHozPoz;
      newInvader.vertPoz=savedInvaderVertPos;
      newInvader.health = savedInvaderHealth;
      savedInvaders.add(newInvader);
    }

    return savedInvaders;
  }
}


ArrayList<Bullet> bullets;
ArrayList<Alien> aliens;
void setup(){
  size(800,600);
  noStroke();
  bullets = new ArrayList<Bullet>();
  aliens = new ArrayList<Alien>();
  Alien newAlien;
  for(int i=0; i<5; i++ ){ 
    newAlien = new Alien(80 + 75 * i,75);
    aliens.add(newAlien);
  }
}

void draw(){
  background(0);
  for(int i=0; i<bullets.size(); i++ ){ 
    bullets.get(i).drawBullet();
    if(bullets.get(i).leftScreent()){
      bullets.remove(i);
    }
  }
  for(int i=0; i<aliens.size(); i++ ){ 
    aliens.get(i).drawAlien();
//    if(aliens.get(i).leftScreent()){
//      aliens.remove(i);
//    }
  }
  println(bullets.size() + " : " + aliens.size());
  
}

void keyReleased(){
  Bullet newBullet = new Bullet(mouseX,height - 50);
  bullets.add(newBullet);
  
}

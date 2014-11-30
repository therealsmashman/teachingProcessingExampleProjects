int time =0;
int number = 0;
int diceCenterHos = 200;
int diceCenterVert = 200;
void setup() {
  size(400, 400);
  background(0);
  number = (int)random(1, 7);
  drawDice(number);
  frameRate(15);
}

void draw() {
  background(0);
  if (millis() > (time )) {
    if (millis() < time +1000) {
      diceCenterHos = 200 + (int)random(-15, 15);
      diceCenterVert = 200 + (int)random(-15, 15);
      drawDice((int)random(1, 7));
    }
    else {
      diceCenterHos = 200;
      diceCenterVert = 200;
      time = millis() + 2000;
      number =(int)random(1, 7);
      drawDice(number);
    }
  }
  else {
    drawDice(number);
  }
}

void drawDice(int number) {
  rectMode(CENTER);
  fill(255);
  rect(diceCenterHos, diceCenterVert, 100, 100, 30);
  fill(40);
  switch(number) {
  case 1: 
    ellipse(diceCenterHos, diceCenterVert, 20, 20);
    break;
  case 2:
    ellipse(diceCenterHos -20, diceCenterVert, 20, 20);
    ellipse(diceCenterHos +20, diceCenterVert, 20, 20);
    break;
  case 3:
    ellipse(diceCenterHos -20, diceCenterVert-20, 20, 20);
    ellipse(diceCenterHos, diceCenterVert, 20, 20);
    ellipse(diceCenterHos +20, diceCenterVert +20, 20, 20);
    break;
  case 4:
    ellipse(diceCenterHos -20, diceCenterVert -20, 20, 20);
    ellipse(diceCenterHos +20, diceCenterVert -20, 20, 20);
    ellipse(diceCenterHos -20, diceCenterVert+20, 20, 20);
    ellipse(diceCenterHos +20, diceCenterVert +20, 20, 20);
    break;
  case 5:
    ellipse(diceCenterHos -20, diceCenterVert -20, 20, 20);
    ellipse(diceCenterHos +20, diceCenterVert -20, 20, 20);
    ellipse(diceCenterHos -20, diceCenterVert+20, 20, 20);
    ellipse(diceCenterHos +20, diceCenterVert +20, 20, 20);
    ellipse(diceCenterHos, diceCenterVert, 20, 20);
    break;

  case 6:
    ellipse(diceCenterHos -20, diceCenterVert-30, 20, 20);
    ellipse(diceCenterHos +20, diceCenterVert-30, 20, 20);
    ellipse(diceCenterHos-20, diceCenterVert, 20, 20);
    ellipse(diceCenterHos +20, diceCenterVert, 20, 20);
    ellipse(diceCenterHos -20, diceCenterVert+30, 20, 20);
    ellipse(diceCenterHos +20, diceCenterVert+30, 20, 20);
    break;
  }
}

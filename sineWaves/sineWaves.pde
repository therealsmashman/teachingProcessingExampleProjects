int spacing = 20;   // How far apart should each horizontal location be spaced
int waveWidth;              

float theta = 0.0;  // Start angle at 0
float amplitude = 50.0;  // Height of wave
float period = 1600.0;  // How many pixels before the wave repeats
float dx;  // Value for incrementing X, a function of period and xspacing
float[] yvalues;  // Using an array to store height values for the wave

void setup() {
  size(800, 360);
  //  w = width+16;
  waveWidth = width+spacing;
  dx = (TWO_PI / period) * spacing;
  yvalues = new float[waveWidth/spacing];
}

void draw() {
  background(0);
  calcWave();
  renderWave();
}

void calcWave() {
  // Increment theta (try different values for 'angular velocity' here
  theta += 0.02;

  // For every x value, calculate a y value with sine function
  float x = theta;
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = sin(x)*amplitude;
    x+=dx;
  }
}

void renderWave() {
  noStroke();
  fill(255);
  // A simple way to draw the wave with an ellipse at each location
  for (int x = 0; x < yvalues.length; x++) {
    ellipse(x*spacing, height/6+yvalues[x], 16, 16);
    ellipse(x*spacing, 5*height/6+yvalues[x], 16, 16);
  }
}


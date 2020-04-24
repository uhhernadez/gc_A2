// Curvas paramétricas
float A;

void setup() {
  size(500,500);
  A = 40;
}

void draw() {
  translate(250,250);
  for(float theta = 0.0f; theta < 2*PI; theta += PI/10.0) {
    float x = A * cos(theta);
    float y = A * sin(theta);
    //ellipse(x,y,2,2);
    circle(x,y,2);
  }
}

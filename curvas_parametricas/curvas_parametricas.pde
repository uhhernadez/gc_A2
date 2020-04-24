// Curvas paramétricas
float Ax;
float Ay;

void setup() {
  size(500, 500);
  Ax = 200;
  Ay = 120;
}

void draw() {
  translate(250, 250);
  float delta_theta = radians(10);
  beginShape();
  for (float theta = 0.0f; theta < 2*PI; theta += delta_theta) {
    float x = Ax * cos(theta);
    float y = Ay * sin(theta);
    //ellipse(x,y,2,2);
    circle(x, y, 10);
    vertex(x,y);
  }
  endShape();
}

void setup() {
  size(1000, 1000);
}

void draw() {
  translate(width/2.0, height/2.0);
  problema2(1.0, 2.0, 1.0, 2.0, 3, 3, 10*PI, radians(1.0));
}

void problema2(float a, float b, float c, float d, float j, float k, float tmax, float dt) {
  noFill();
  beginShape();
  for (float t = 0; t < tmax; t+=dt ) {
    float x = cos(a*t) - pow(cos(b*t), j);
    float y = sin(c*t) - pow(sin(d*t), k);
    vertex(100*x, 100*y);
  }
  endShape();
}

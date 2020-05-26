float x0, x1, x, T;

void setup() {
  size(500, 500);
  x0 = 100;
  x1 = 400;
  T = 5.0f;
}

void draw() {
  background(255);
  float t = millis()/1000.0f;
  text(t,width/2.0, 20);
  x = step(x0, x1, t/T);
  draw_method(x0, x1, x, 50, "Step");
}

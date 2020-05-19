Spline s;

void setup() {
  size(1000, 1000);
  s = new Spline(0.01);
  s.p0_.set(-200, 10);
  s.p1_.set(0, 50);
  s.p2_.set(200, 10);
  s.Calcular();
}

void draw() {
  background(255);
  translate(width/2, height/2);
  s.Dibujar();
  //s.p1_.add(0,-0.2);
  s.Calcular();
}

void mouseClicked() {
  s.p1_.set(mouseX- width/2, mouseY - height/2);
}

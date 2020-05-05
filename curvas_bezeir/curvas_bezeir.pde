Bezier b;
void setup() {
  size(1000, 1000);
  b = new Bezier(0.1);
  b.p0_.set(-200, -330);
  b.p1_.set(-200, -330);
  
  b.p2_.set(200, 330);
  b.p3_.set(200, 330);
}

void draw() {
  background(240);
  translate(width/2.0, height/2.0);
  b.Dibujar();
  b.p1_.x += 0.5;
  b.p2_.x -= 0.5;
}

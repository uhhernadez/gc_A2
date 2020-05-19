Spline s;

void setup(){
  size(1000, 1000);
  s = new Spline(0.01);
  s.p0_.set(-200,10);
  s.p1_.set(0,50);
  s.p2_.set(200,10);
  s.Calcular();
}

void draw() {
  translate(width/2, height/2);
  s.Dibujar();
}

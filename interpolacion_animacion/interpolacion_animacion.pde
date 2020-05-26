PVector p0, p1;
Bala bala;
float T;
ArrayList<Bala> balas;
void setup() {
  size(500, 500);
  T = 5.0f;
  float t = millis()/1000.0f;
  p0 = new PVector(0, 40);
  p1 = new PVector(400, 40);
  bala = new Bala(p0, p1, t, T);
  balas = new ArrayList();
}

void draw() {
  background(255);
  for(Bala b : balas) {
    b.Dibujar();
  }
}

void mouseClicked() {
  float t = millis()/1000.0f;
  PVector p = new PVector(mouseX, mouseY);
  balas.add(new Bala(p0,p,t,T));
}

SusanaDistancia susana;
void setup() {
  size(1000, 1000);
  susana  = new SusanaDistancia();
}

void draw() {
  background(240);
  translate(width/2.0, height/2.0);
  scale(0.6);
  susana.Dibujar();
}

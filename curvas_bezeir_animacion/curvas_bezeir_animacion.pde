SusanaDistancia susana;
Bezier b;
int t;
void setup() {
  size(1000, 1000);
  susana  = new SusanaDistancia();
  b = new Bezier(0.001);
  t = 0;
  b.p0_.set(-300, -300);
  b.p1_.set(-300, -300);
  b.p2_.set(300, 300);
  b.p3_.set(300, -300);
}

void draw() {
  background(240);
  translate(width/2.0, height/2.0);
  b.Calcular();
 // b.Dibujar();
  t = t % b.curva.size();
  PVector p0 = b.curva.get(t);
  int tn = ( t+1 > b.curva.size() - 1)? t : t+1; 
  PVector p1 = b.curva.get(tn);
  
  float theta = Orientacion(p0, p1);
  //translate(p0.x, p0.y);
  //rotate(theta);
  susana.Dibujar();
  b.p1_.y += 0.1;
  t++;
}

float Orientacion(PVector p0, PVector p1) {
  return atan((p1.y-p0.y)/(p1.x-p0.x));
}

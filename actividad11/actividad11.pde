Curva curva;
void setup() {
  size(1000, 1000);
  curva = new Curva(5, 5 , radians(1));
  frameRate(1);
  pixelDensity(2);
  smooth(8);
}

void draw() {
  translate(width/2.0, height/2.0);
  curva.Dibujar(frameCount * PI);
  //curva.a_=40;
  //curva.b_ = 1;
  stroke(255, 0, 0);
  curva.Dibujar(frameCount * PI);
}

class SusanaDistancia {
  PImage brazo_izq;
  PImage brazo_der;
  PImage cuerpo;
  PImage cabeza;
  PImage pierna_izq;
  PImage pierna_der;

  SusanaDistancia () {
    cabeza = loadImage("cabeza.png");
    cuerpo = loadImage("cuerpo.png");
    brazo_izq = loadImage("brazo_izq.png");
    brazo_der = loadImage("brazo_der.png");
    pierna_izq = loadImage("pierna_izq.png");
    pierna_der = loadImage("pierna_der.png");
  }

  void Dibujar() {
    pushMatrix();
      scale(0.2);
      pushMatrix();
      image(cabeza, -cabeza.width/2.0, -612);
      
      image(brazo_izq, 50, -200);
      
      image(brazo_der, -50-brazo_der.width, -200);
      image(pierna_izq, 10, 180);
      image(pierna_der, -10-pierna_der.width, 180);
      image(cuerpo, -cuerpo.width/2.0, -cuerpo.height/2.0);
      popMatrix();
    popMatrix();
  }
}

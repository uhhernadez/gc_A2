class SusanaDistancia {
  PImage brazo_izq;
  PImage brazo_der;
  PImage cuerpo;
  PImage cabeza;
  PImage pierna_izq;
  PImage pierna_der;
  PImage coronavirus;

  SusanaDistancia () {
    cabeza = loadImage("cabeza.png");
    cuerpo = loadImage("cuerpo.png");
    brazo_izq = loadImage("brazo_izq.png");
    brazo_der = loadImage("brazo_der.png");
    pierna_izq = loadImage("pierna_izq.png");
    pierna_der = loadImage("pierna_der.png");
    coronavirus = loadImage("coronavirus.png");
  }

  void Dibujar() {
    float t = millis()/1000.0;
    pushMatrix();
      scale(0.2);
      pushMatrix();
      image(cabeza, -cabeza.width/2.0, -612);
      
      pushMatrix();
        translate(50, -200);
        float theta = radians(10) * cos(2*PI*t);
        image(coronavirus,500, 0);
        rotate(theta);
        image(brazo_izq, 0, 0);
        
      popMatrix();
      
      image(brazo_der, -50-brazo_der.width, -200);
      image(pierna_izq, 10, 180);
      image(pierna_der, -10-pierna_der.width, 180);
      image(cuerpo, -cuerpo.width/2.0, -cuerpo.height/2.0);
      popMatrix();
    popMatrix();
  }
}

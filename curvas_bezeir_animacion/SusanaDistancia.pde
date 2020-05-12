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
    scale(0.5);
    DibujarCabeza(t,0.5);
    DibujarBrazoIzquierdo(t,3);
    DibujarBrazoDerecho(t, 3);
    DibujarCuerpo(t,2);
    DibujarPiernaIzquierda(t,2);
    DibujarPiernaDerecha(t,2);
    popMatrix();
  }

  void DibujarCabeza(float t, float f) {
    fill(255);
    pushMatrix();
    float theta = 10 * cos(2*PI*f*t);
    translate(0, -285+theta);
    //rotate(theta);
    image(cabeza, -cabeza.width/2.0, -cabeza.height/2.0);
    //circle(0, 0, 20);
    popMatrix();
  }

  void DibujarBrazoIzquierdo(float t, float f) {
    fill(255);
    pushMatrix();
    translate(50, -130);
    float theta = radians(10) * cos(2*PI*f*t);
    image(coronavirus, 500, 0);
    rotate(theta);
    image(brazo_izq, 0, -50);
    //circle(0, 0, 20);
    popMatrix();
  }

  void DibujarBrazoDerecho(float t, float f) {
    fill(255);
    pushMatrix();
    translate(-50, -130);
    float theta = radians(10) * cos(2*PI*f*t);
    rotate(-theta);
    image(brazo_der, -brazo_der.width, -50);
    //circle(0, 0, 20);
    popMatrix();
  }

  void DibujarCuerpo(float t, float f) {
    fill(255);
    pushMatrix();
    translate(0, 0);
    float theta = radians(10) * cos(2*PI*f*t);
    //rotate(-theta);
    image(cuerpo, -cuerpo.width/2.0, -cuerpo.height/2.0);
    //circle(0, 0, 20);
    popMatrix();
  }

  void DibujarPiernaIzquierda(float t, float f) {
    fill(255);
    pushMatrix();
    translate(15, 180);
    float theta = radians(10) * cos(2*PI*f*t);
    rotate(-theta);
    image(pierna_izq, 0, 0);
    //circle(0, 0, 20);
    popMatrix();
  }

  void DibujarPiernaDerecha(float t, float f) {
    fill(255);
    pushMatrix();
    translate(-15, 180);
    float theta = radians(10) * cos(2*PI*f*t);
    rotate(theta);
    image(pierna_der, -pierna_der.width, 0);
    //circle(0, 0, 20);
    popMatrix();
  }
}

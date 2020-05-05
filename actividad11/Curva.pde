class Curva {
  float a_;
  float b_;
  float dt_;
  
  Curva(float a, float b, float dt) {
    a_ = a;
    b_ = b;
    dt_ = dt;
  }

  void Dibujar(float limite_superior) {
    noFill();
    strokeWeight(2);
    beginShape();
      for(float theta = 0.0; theta < limite_superior; theta += dt_) {
        float x = (a_ + b_ * theta)* cos(theta);
        float y = (a_ + b_ * theta)* sin(theta);
        //vertex(x,y);
        curveVertex(x, y);
      }
    endShape();
  }
}

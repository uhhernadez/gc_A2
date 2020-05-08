class Bezier {
  float dt_;
  PVector p0_;
  PVector p1_;
  PVector p2_;
  PVector p3_;
  ArrayList<PVector> curva;

  Bezier (float dt) {
    p0_ = new PVector();
    p1_ = new PVector();
    p2_ = new PVector();
    p3_ = new PVector();
    dt_ = dt;
    curva = new ArrayList<PVector>();
  }

  void Calcular() {
    curva.clear();
    for (float t = 0.0f; (1.0 - t) >= -0.001; t += dt_) {
      float a = (1 -t) * (1 -t) * (1 -t); // pow(1-t,3)
      float b = 3 * t * (1 - t) *(1 - t);
      float c = 3 * t * t * (1 - t);
      float d = t * t * t;
      float x = a * p0_.x + b * p1_.x + c * p2_.x + d * p3_.x;
      float y = a * p0_.y + b * p1_.y + c * p2_.y + d * p3_.y;
      curva.add(new PVector(x, y));
    }
  }

  void Dibujar() {
    Calcular();
    noFill();
    beginShape();
    for (PVector p : curva) {
      vertex(p.x, p.y);  
    }
    endShape();
  }
}

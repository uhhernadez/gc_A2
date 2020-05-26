import Jama.*;
class Spline {
  ArrayList<PVector> pts_;
  PVector p0_;
  PVector p1_;
  PVector p2_;
  float dt_;
  
  Spline(float dt) {
    dt_ = dt;
    pts_ = new ArrayList<PVector>();
    p0_ = new PVector();
    p1_ = new PVector();
    p2_ = new PVector();
  }

  void Calcular() {
    float diff_x1x0 = p1_.x - p0_.x;
    float diff_x2x1 = p2_.x - p1_.x;
    
    float a11 = 2.0f / diff_x1x0;
    float a12 = 1.0f / diff_x1x0;
    
    float a21 = a12;
    float a22 = 2.0 * (1.0/diff_x1x0 + 1.0/diff_x2x1);
    float a23 = 1.0 / diff_x2x1;
    
    float a32 = a23;
    float a33 = 2.0 / diff_x2x1;
    
    float diff_x1x0_2 = diff_x1x0 * diff_x1x0;
    float diff_x2x1_2 = diff_x2x1 * diff_x2x1;
    float b1 = 3.0 *((p1_.y - p0_.y) / diff_x1x0_2);
    float b2 = 3.0 *((p1_.y - p0_.y) / diff_x1x0_2 
                   + (p2_.y - p1_.y) / diff_x2x1_2);
    float b3 = 3.0 *((p2_.y - p1_.y) / diff_x2x1_2);
    
    double [][] arreglo_A = {{a11, a12, 0.0},
                             {a21, a22, a23},
                             {0.0, a32, a33}};
                             
    double [][] arreglo_b = {{b1},
                             {b2},
                             {b3}};
    Matrix A = new Matrix(arreglo_A);
    Matrix b = new Matrix(arreglo_b);
    Matrix k = A.solve(b);
    
    float a_1 = (float)k.get(0,0) * (p1_.x - p0_.x) - (p1_.y - p0_.y);
    float b_1 = -(float)k.get(1,0) * (p1_.x - p0_.x) + (p1_.y - p0_.y);
    
    float a_2 = (float)k.get(1,0) * (p2_.x - p1_.x) - (p2_.y - p1_.y);
    float b_2 = -(float)k.get(2,0) * (p2_.x - p1_.x) + (p2_.y - p1_.y);
    
    pts_.clear();
    for(float x = p0_.x; x < p1_.x; x += dt_) {
      float t = (x - p0_.x)/(p1_.x - p0_.x);
      float y = (1-t)* p0_.y 
               + t * p1_.y 
               + t * (1-t) *((1-t) * a_1 + t * b_1);
      pts_.add(new PVector(x, y));
    }
    
    for(float x = p1_.x; x < p2_.x; x += dt_) {
      float t = (x - p1_.x)/(p2_.x - p1_.x);
      float y = (1-t)* p1_.y 
               + t * p2_.y 
               + t * (1-t) *((1-t) * a_2 + t * b_2);
      pts_.add(new PVector(x, y));
    }    
  }

  void Dibujar() {
    noFill();
    strokeWeight(2);
    beginShape();
      for(PVector p: pts_) {
        vertex(p.x, p.y);
      }
    endShape();
    fill(230);
    circle(p0_.x, p0_.y, 10);
    circle(p1_.x, p1_.y, 10);
    circle(p2_.x, p2_.y, 10);
  }

}

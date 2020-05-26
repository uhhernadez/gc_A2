class Bala {
  PImage bala_;
  PImage [] explosion_;
  PVector p0_, p1_;
  boolean fin_;
  
  float escala_;
  float tf_;
  float ti_;
  float dt_;
  float T_;
  int cuadro_;
  
  Bala(PVector p0, PVector p1, float ti, float T) {
    p0_ = p0;
    p1_ = p1;
    bala_ = loadImage("bala.png");
    explosion_ = new PImage[5];
    for(int k = 0; k < explosion_.length; k++) {
      String filename = "explosion/output-"+str(k)+ ".png";
      explosion_[k] = loadImage(filename);
    }
    fin_ = false;
    escala_ = 0.1;
    cuadro_ = 0;
    dt_ = 1.0f/ 5.0f;
    ti_ = ti;
    T_ = T;
  }
  
  
  void Dibujar() {
    float t = millis()/1000.0f;
    float ts = (t-ti_)/T_;
    PVector p  = inteporlation(p0_, p1_, ts, 0);
    if(!fin_) {
      // Bala
      pushMatrix() ;
        translate(p.x, p.y);
        scale(escala_);
        image(bala_,-bala_.width/2.0, -bala_.height/2.0);
      popMatrix();
      if ( ts > 1.0) {
        println("Fin!!!");
        fin_ = true;
        tf_ = t;
      }
    } else {
      // Animación
      cuadro_ = round((t - tf_) / dt_);
      if(cuadro_> 4.0) {
        return;
      }
      
      PImage img = explosion_[cuadro_];
      pushMatrix() ;
        translate(p.x, p.y);
        //scale(escala_);
        image(img,-img.width/2.0, -img.height/2.0);
      popMatrix(); 
    }
  
  }
}

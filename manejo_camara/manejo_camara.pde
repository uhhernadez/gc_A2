// Geometría Computacional
//
ArrayList<PVector> helice;
Eje3D eje;
PShape modelo;
boolean flag;

void setup() {
  size(800,800,P3D);
  eje = new Eje3D();
  modelo = loadShape("lego.obj");
  flag = true;
  helice = new ArrayList<PVector>();
}

void draw() {
  background(200);
  lights();
  float A = 100;
  float m = -50;
  float t = 0.5 * (millis()/1000.0);
  
  float xc = A * cos(t);
  float yc = A * sin(t);
  float zc = m * t;
  helice.add(new PVector(xc, yc, zc));
  DibujarHelice(helice);
  camera(xc, yc, zc,
         0, 0, 0,
         0, 0, -1);
  
  eje.Dibujar();   
  if(flag) {
    float fov = PI/3.0;
    float cameraZ = (height/2.0) / tan(fov/2.0);
    perspective(fov, float(width)/float(height), 
                cameraZ/10.0, cameraZ*10.0);
  } else {            
    ortho(-width/8, width/8, -height/8, height/8);
  }
  pushMatrix();
    rotateX(radians(90));
    pushMatrix();
      eje.Dibujar();   
      rotateY(radians(90));
      scale(0.5);
      //modelo.scale(0.5);
      shape(modelo);
    popMatrix();
  popMatrix();
}

void DibujarHelice(ArrayList<PVector> puntos) {
  stroke(0);
  strokeWeight(2);
  for(int k=0; k < puntos.size()-1; k++) {
    PVector pi = puntos.get(k);
    PVector pf = puntos.get(k+1);
    line(pi.x, pi.y, pi.z, pf.x, pf.y, pf.z );
  }
  strokeWeight(1);
}


void keyPressed() {
 flag = !flag; 
}

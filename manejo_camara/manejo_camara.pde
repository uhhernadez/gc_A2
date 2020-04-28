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
}

void draw() {
  background(200);
  lights();
  float A = 100;
  float m = 10;
  float t = 0.5 * (millis()/1000.0);
  float xc = A * cos(t);
  float yc = A * sin(t);
  float zc = m * t;
  
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

void keyPressed() {
 flag = !flag; 
}

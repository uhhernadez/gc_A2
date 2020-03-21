Eje3D eje;
float x, y, z;
float theta_x, theta_y, theta_z;
void setup() {
  size(512, 512, P3D);
  eje = new Eje3D();
  x = 0.0; y = 0.0; z = 0.0;
  theta_x = 0.0; theta_y = 0.0; theta_z = 0.0;
}

void draw() {
  background(0);
  camera(50, 50, 50,
         0, 0, 0,
         0.0, 0.0, -1.0);
  translate(0.0, -millis()/1000.0,0);   
  eje.Dibujar();
  stroke(0,255,255);
  
  rotateX(radians(theta_x));
  translate(0,20,0);
  
  eje.Dibujar();
  box(10);
  rotateY(radians(theta_y));
  translate(20,0,0);
  
  eje.Dibujar();
  box(5);
  rotateZ(radians(theta_z));
  translate(0,0,10);
  
  eje.Dibujar();
  box(2.5);
  //x += 0.1;
  //y += 0.1;
  //z += 0.1;
  theta_x += 1.0;
  theta_y += 5.0;
  theta_z += 100.0;
}

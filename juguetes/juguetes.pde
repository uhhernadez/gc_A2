PShape base;
PShape brick1;
PShape brick2;
PShape brick3;
PShape brick4;

void setup() {
  size(1000, 1000,P3D);
  base = loadShape("base.obj");
  brick1 = loadShape("brick1.obj");
  brick2 = loadShape("brick2.obj");
  brick3 = loadShape("brick3.obj");
  brick4 = loadShape("brick4.obj");
}

void draw() {
  background(0);
  lights();
  scale(1);
  shape(base);
  shape(brick1);
  shape(brick2);
  shape(brick3);
  pushMatrix();
  translate(10,10,10);
  shape(brick4);
  popMatrix();
  //ortho(-40, 40, -40, 40);
  camera(40,40,40, 0,0, 0, 0, 0, -1);
  
  float fov = PI/3.0;
  float cameraZ = (height/2.0) / tan(fov/2.0);
  perspective(fov, float(width)/float(height), 
              10.0, cameraZ*10.0);
}
PVector [] vertices;
float [][] P = {
  {1.0, 0.0, 0.0},
  {0.0, 1.0, 0.0},
};

PVector Proyectar(float [][]P, PVector p) {
  float x,y;
  x = P[0][0] * p.x + P[0][1] * p.y + P[0][2] * p.z;
  y = P[1][0] * p.x + P[1][1] * p.y + P[1][2] * p.z;
  return new PVector(x,y);
}

PVector Proyectar(float [][]P, PVector p, float d) {
  float x,y;
  x = P[0][0] * p.x + P[0][1] * p.y + P[0][2] * p.z;
  y = P[1][0] * p.x + P[1][1] * p.y + P[1][2] * p.z;
  float alpha = d/p.z;
  return new PVector(alpha*x,alpha*y);
}

PVector Rotar(float [][] R, PVector p){
  float x, y, z;
  x = R[0][0] * p.x + R[0][1] * p.y + R[0][2] * p.z;
  y = R[1][0] * p.x + R[1][1] * p.y + R[1][2] * p.z;
  z = R[2][0] * p.x + R[2][1] * p.y + R[2][2] * p.z;
  return new PVector(x, y, z);
}

float [][] RotacionX(float theta) {
  float [][] RX = { 
    {1, 0, 0},
    {0, cos(theta), -sin(theta)},
    {0, sin(theta), cos(theta)}
  };
  return RX;
}

float [][] RotacionY(float theta) {
  float [][] RY = {
    {cos(theta), 0, sin(theta)},
    {0, 1, 0},
    {-sin(theta), 0, -cos(theta)}
  };
  return RY;
}

float [][] RotacionZ(float theta) {
  float [][] RZ = {
    {cos(theta), -sin(theta), 0},
    {sin(theta), cos(theta), 0},
    {0, 0, 1}
  };
  return RZ;
}

void setup() {
  size(512,512);
  vertices = new PVector[8];
  vertices[0] = new PVector(-50, 50, 50);
  vertices[1] = new PVector(50, 50, 50);
  vertices[2] = new PVector(50, -50, 50);
  vertices[3] = new PVector(-50, -50, 50);
  
  vertices[4] = new PVector(-50, 50, -50);
  vertices[5] = new PVector(50, 50, -50);
  vertices[6] = new PVector(50, -50, -50);
  vertices[7] = new PVector(-50, -50, -50);
  
  float [][] Rx = RotacionX(radians(20));
  for(int k = 0; k < 8 ; k++) {
    vertices[k] = Rotar(Rx, vertices[k]);  
  }
}



void draw() {
  background(200);
  translate(200, 256);
  float t = millis()/1000.0;
  //float [][] Rz = RotacionY(-t);
  //float [][] Rx = RotacionX(t);
  //float [][] Ry = RotacionY(t);
  float [][] Rz = RotacionZ(t);
  //PVector [] cubo_2D = new PVector[8];
  ArrayList<PVector> cubo_2D = new ArrayList();
  ArrayList<PVector> cubo_2D_ortografica = new ArrayList();
  float d = 100; 
  float tx = 150;
  for(PVector p3D: vertices) {
    PVector p3Dr = Rotar(Rz,p3D);
    PVector p3Dt = PVector.add(p3Dr, new PVector(0, 0, 200));
    // Perspectiva
    PVector p2D = Proyectar(P, p3Dt, d);
    cubo_2D.add(p2D);
    ellipse(p2D.x, p2D.y, 10, 10);
    // Ortográfica
    p2D = Proyectar(P, p3Dt);
    cubo_2D_ortografica.add(p2D);
    ellipse(p2D.x+tx, p2D.y, 10, 10);
  } 
  DibujarCubo2D(cubo_2D);
  translate(tx, 0);
  DibujarCubo2D(cubo_2D_ortografica);
}

void DibujarCubo2D(ArrayList<PVector> puntos) {
  // P1P2
  Linea2D(puntos.get(0), puntos.get(1));
  Linea2D(puntos.get(1), puntos.get(2));
  Linea2D(puntos.get(2), puntos.get(3));
  Linea2D(puntos.get(0), puntos.get(3));
  
  Linea2D(puntos.get(4), puntos.get(5));
  Linea2D(puntos.get(5), puntos.get(6));
  Linea2D(puntos.get(6), puntos.get(7));
  Linea2D(puntos.get(7), puntos.get(4));
  
  Linea2D(puntos.get(0), puntos.get(4));
  Linea2D(puntos.get(1), puntos.get(5));
  Linea2D(puntos.get(2), puntos.get(6));
  Linea2D(puntos.get(3), puntos.get(7));
}

void Linea2D(PVector a, PVector b) {
  line(a.x, a.y, b.x, b.y);
}

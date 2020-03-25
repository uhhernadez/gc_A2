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
}

void draw() {
  translate(256, 256);
  for(PVector p3D: vertices) {
    PVector p2D = Proyectar(P, p3D);
    ellipse(p2D.x, p2D.y, 10, 10);
  }
}

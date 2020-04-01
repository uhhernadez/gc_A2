PShape modelo;

void setup() {
  size(800,800,P3D);
  modelo = loadShape("lego.obj");
}

void draw() {
  camera(150, 150, 150,
         0, 0, 0,
         0, 0, -1);
  shape(modelo);
}

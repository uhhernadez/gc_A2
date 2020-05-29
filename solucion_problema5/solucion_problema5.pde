void setup() {
 size(1000, 1000);
}

void draw(){
  translate(500, 500);
  problema5(100,30);
}

void problema5(float r0, float r) {
  noFill();
  beginShape();
  for(float alpha = 0.0 ; alpha < 2*PI; alpha+= 0.1) {
    float x = (r0 +r)* cos(alpha) - r*cos(alpha*(1+r0/r));
    float y = (r0 +r)* sin(alpha) - r*sin(alpha*(1+r0/r));
    vertex(x, y);
  }
  endShape();
}

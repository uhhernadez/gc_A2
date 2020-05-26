float step(float x0, float x1, float t) {
  return (t > 0.5f)? x1: x0;
}

float linear(float x0, float x1, float t) {
  float x = x0 + t * (x1 - x0);
  return (t >1.0)? x1 : x;
}

float cosine(float x0, float x1, float t) {
  float x = linear(x0, x1, -cos(PI*t)/2.0f + 0.5f); 
  return (t >1.0)? x1 : x; 
}

float smooth_step(float x0, float x1, float t) {
  float x = linear(x0, x1, t * t * (3 - 2*t)); 
  return (t >1.0)? x1 : x; 
}

float acceleration(float x0, float x1, float t) {
  float x = linear(x0, x1, t*t); 
  return (t >1.0)? x1 : x; 
}

float deceleration(float x0, float x1, float t) {
  float x = linear(x0, x1, 1 - pow((1 - t), 2)); 
  return (t >1.0)? x1 : x; 
}

PVector inteporlation(PVector p0, PVector p1, float t ,int k) {
  float x = linear(p0.x, p1.x, t);
  float y = linear(p0.y, p1.y, t);
  return new PVector(x, y);
}


void draw_method(float x0, float x1, float x, float y, String method) {
  noFill();
  circle(x0, y, 20);
  circle(x1, y, 20);
  fill(0, 0, 255);
  circle(x, y, 20);
  textSize(18);
  fill(50);
  text(method, x0-80, y);
}

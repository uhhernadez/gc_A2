float step(float x0, float x1, float t) {
  return (t > 0.5f)? x1: x0;
}

void draw_method(float x0, float x1, float x, float y, String method) {
  noFill();
  circle(x0, y, 20);
  circle(x1, y, 20);
  fill(0, 0, 255);
  circle(x, y, 20);
  textSize(18);
  fill(50);
  text(method, x0-50, y);
}

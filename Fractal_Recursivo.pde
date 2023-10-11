float t = 0;

void setup() {
  size(400, 400);
  background(160, 100, 240);
  float len = 300;
  float startX = 50;
  float startY = height - 50;
  float endX = width - 50;
  float endY = height - 50;
  koch(startX, startY, endX, endY, 4, t);
}

void draw() {
  background(160, 100, 240);
  t += 0.005; // Cambia la velocidad de la animación ajustando el valor de incremento
  float len = 300;
  float startX = 50;
  float startY = height - 50;
  float endX = width - 50;
  float endY = height - 50;
  koch(startX, startY, endX, endY, 4, t);
}

void koch(float x1, float y1, float x5, float y5, int depth, float t) {
  if (depth == 0) {
    float x2 = x1 + (x5 - x1) * t;
    float y2 = y1 + (y5 - y1) * t;
    line(x1, y1, x2, y2);
  } else {
    float deltaX = (x5 - x1) / 3;
    float deltaY = (y5 - y1) / 3;
    float x2 = x1 + deltaX;
    float y2 = y1 + deltaY;
    float x3 = x2 + cos(PI / 3) * deltaX - sin(PI / 3) * deltaY;
    float y3 = y2 + sin(PI / 3) * deltaX + cos(PI / 3) * deltaY;
    float x4 = x1 + 2 * deltaX;
    float y4 = y1 + 2 * deltaY;

    koch(x1, y1, x2, y2, depth - 1, t);
    koch(x2, y2, x3, y3, depth - 1, t);
    koch(x3, y3, x4, y4, depth - 1, t);
    koch(x4, y4, x5, y5, depth - 1, t);
  }
}

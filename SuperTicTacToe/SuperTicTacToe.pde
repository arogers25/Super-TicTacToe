void setup() {
  strokeCap(SQUARE);
  fullScreen();
}

void draw() {
  background(255);
  drawGrid((width / 2) - (height / 2), 0, height, height / 3, 3, color(170)); // TODO make scaling and centering apart of class
}

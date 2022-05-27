void setup() {
  strokeCap(SQUARE);
  fullScreen();
}

void draw() {
  background(255);
  /*for (int x = 0; x < 3; x++) {
    for (int y = 0; y < 3; y++) {
      drawGrid(((width / 2) - (height / 2)) + (height / 3) * x, (height / 3) * y, height / 3, height / 9, 3, color(70));
    }
  }*/
  drawGrid(0, 0, height, height / 3, 3, color(170), true);
  //drawGrid((width / 2) - (height / 2), 0, height, height / 3, 3, color(170));
}

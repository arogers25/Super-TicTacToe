Board board;

void setup() {
  strokeCap(SQUARE);
  fullScreen();
  board = new Board(3, height);
}

void draw() {
  background(255);
  board.draw((width / 2) - (board.drawSize / 2), 0);
}

void mousePressed() {
  board.mousePressed((width / 2) - (board.drawSize / 2), 0);
}
/*for (int x = 0; x < 3; x++) {
    for (int y = 0; y < 3; y++) {
      drawGrid(((width / 2) - (height / 2)) + (height / 3) * x, (height / 3) * y, height / 3, height / 9, 3, color(70));
    }
  }*/

GlobalBoard globalBoard;

void setup() {
  strokeCap(SQUARE);
  fullScreen();
  globalBoard = new GlobalBoard(3, height);
}

void draw() {
  background(255);
  globalBoard.draw(0, 0);
}

void mousePressed() {
  println(globalBoard.mousePressed(0, 0, 'X'));
}

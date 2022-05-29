GlobalBoard globalBoard;
Game currentGame;

void setup() {
  strokeCap(SQUARE);
  fullScreen();
  globalBoard = new GlobalBoard(3, height);
  currentGame = new Game(globalBoard, 2, 'X');
}

void draw() {
  background(255);
  globalBoard.draw(0, 0);
}

void mousePressed() {
  currentGame.mousePressed();
}

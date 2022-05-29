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
  currentGame.draw();
}

void mousePressed() {
  currentGame.mousePressed();
}

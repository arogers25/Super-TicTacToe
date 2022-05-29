Game currentGame;

void setup() {
  strokeCap(SQUARE);
  fullScreen();
  GlobalBoard newGameBoard = new GlobalBoard(3, height);
  currentGame = new Game(newGameBoard, 'X');
}

void draw() {
  background(255);
  currentGame.draw();
}

void mousePressed() {
  currentGame.mousePressed();
}

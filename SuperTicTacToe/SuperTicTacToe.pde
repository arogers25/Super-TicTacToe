Game currentGame;

void setup() {
  strokeCap(SQUARE);
  fullScreen();
  GlobalBoard newGameBoard = new GlobalBoard(3, height);
  currentGame = new Game(newGameBoard, 'X');
}

void draw() {
  background(255);
  char winner = currentGame.gameBoard.getWinner();
  if (winner != 0) {
    println(winner);
  }
  currentGame.draw();
}

void mousePressed() {
  currentGame.mousePressed();
}

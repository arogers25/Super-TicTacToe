Game currentGame;
Button newButton;

void setup() {
  strokeCap(SQUARE);
  fullScreen();
  GlobalBoard newGameBoard = new GlobalBoard(3, height);
  currentGame = new Game(newGameBoard, 'X');
  newButton = new Button("Test", 100, 100, 100, 100);
}

void draw() {
  background(255);
  char winner = currentGame.gameBoard.getWinner();
  if (winner != 0) {
    println(winner);
  }
  currentGame.draw();
  newButton.draw();
}

void mousePressed() {
  currentGame.mousePressed();
  if (newButton.hovering) {
    println("Test");
  }
}

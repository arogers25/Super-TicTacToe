Game currentGame;
Button newButton;

void setup() {
  strokeCap(SQUARE);
  fullScreen();
  gameFont = createFont("Arial", 32);
  textFont(gameFont);
  GlobalBoard newGameBoard = new GlobalBoard(3, height * 0.70);
  currentGame = new Game(newGameBoard, 'X');
  newButton = new Button("Exit", width - 100, 0, 100, 100, color(255, 0, 0));
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
    exit();
  }
}

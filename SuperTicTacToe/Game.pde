class Game {
  int playerAmount = 2;
  char startingSide = 'X';
  char currentSide = 0;
  GlobalBoard gameBoard;
  
  Game(GlobalBoard newGameBoard, int newPlayerAmount, char newStartingSide) {
    gameBoard = newGameBoard;
    playerAmount = newPlayerAmount;
    startingSide = newStartingSide;
    currentSide = startingSide;
  }
  
  void switchSides() {
    if (currentSide == 'X') {
      currentSide = 'O';
    } else {
      currentSide = 'X';
    }
  }
  
  void draw() {
    gameBoard.draw(0, 0);
    drawPiece(0, 0, 100, currentSide);
  }
  
  void mousePressed() {
    gameBoard.mousePressed(0, 0, currentSide);
    switchSides();
  }
}

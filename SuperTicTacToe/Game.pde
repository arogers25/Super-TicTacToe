class Game {
  char startingSide = 'X';
  char currentSide = 0;
  GlobalBoard gameBoard;
  
  Game(GlobalBoard newGameBoard, char newStartingSide) {
    gameBoard = newGameBoard;
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
    drawPiece(10, 10, 70, currentSide);
  }
  
  void mousePressed() {
    if (gameBoard.mousePressed(0, 0, currentSide)) {
      switchSides();
    }
  }
}

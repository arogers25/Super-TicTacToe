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
  
  void mousePressed() {
    gameBoard.mousePressed(0, 0, currentSide);
    switchSides();
  }
}

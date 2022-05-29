class Game {
  int playerAmount = 2;
  char startingSide = 'X';
  GlobalBoard gameBoard;
  
  Game(GlobalBoard newGameBoard, int newPlayerAmount, char newStartingSide) {
    gameBoard = newGameBoard;
    playerAmount = newPlayerAmount;
    startingSide = newStartingSide;
    gameBoard.currentSide = startingSide;
  }
  
  void draw() {
    gameBoard.draw(0, 0);
    drawPiece(0, 0, 100, gameBoard.currentSide);
  }
  
  void mousePressed() {
    gameBoard.mousePressed(0, 0);
  }
}

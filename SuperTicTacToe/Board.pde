class Board {
  int boardSize = 3;
  float drawSize = 0;
  float pieceSize = 0;
  char[][] pieceArr;
  
  Board(int newBoardSize, float newDrawSize) {
    boardSize = newBoardSize;
    drawSize = newDrawSize;
    pieceSize = newDrawSize / boardSize;
    pieceArr = new char[boardSize][boardSize];
  }
  
  
}

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

  void draw(float posX, float posY) {
    drawGrid(posX, posY, drawSize, pieceSize, boardSize, color(170));
  }

  void mousePressed(float posX, float posY, char side) {
    int gridClickX = floor((mouseX - posX) / pieceSize);
    int gridClickY = floor((mouseY - posY) / pieceSize);
    if (gridClickX >= 0 && gridClickX < boardSize && gridClickY >= 0 && gridClickY < boardSize) {
      println("Board:", gridClickX, gridClickY);
    }
  }

  char getWinner() {
    return 0;
  }
}

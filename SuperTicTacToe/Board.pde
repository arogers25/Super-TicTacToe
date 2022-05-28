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

  void draw(float x, float y) {
    drawGrid(x, y, drawSize, pieceSize, boardSize, color(170));
  }

  void mousePressed(float x, float y, char side) {
    int gridClickX = floor((mouseX - x) / pieceSize);
    int gridClickY = floor((mouseY - y) / pieceSize);
    if (gridClickX >= 0 && gridClickX < boardSize && gridClickY >= 0 && gridClickY < boardSize) {
      println(gridClickX, gridClickY);
    }
  }
}

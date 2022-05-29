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

  void drawPieces(float posX, float posY) { 
    for (int x = 0; x < boardSize; x++) {
      for (int y = 0; y < boardSize; y++) {
        if (pieceArr[x][y] != 0) {
          float pieceOffset = pieceSize / 4;
          drawPiece(posX + (x * pieceSize) + pieceOffset, posY + (y * pieceSize) + pieceOffset, pieceSize / 2, pieceArr[x][y]);
        }
      }
    }
  }
  
  void doMove(int moveX, int moveY, char side) {
    if (pieceArr[moveX][moveY] == 0) {
      pieceArr[moveX][moveY] = side;
    }
  }
  
  boolean validClick(float posX, float posY, char side) {
    int gridClickX = floor((mouseX - posX) / pieceSize);
    int gridClickY = floor((mouseY - posY) / pieceSize);
    
    if (gridClickX >= 0 && gridClickX < boardSize && gridClickY >= 0 && gridClickY < boardSize && pieceArr[gridClickX][gridClickY] == 0) {
      doMove(gridClickX, gridClickY, side);
      println("Board:", gridClickX, gridClickY);
      return true;
    }
    
    return false;
  }
  
  ArrayList<int[]> getAvailableMoves() {
    ArrayList<int[]> availableMoves = new ArrayList<int[]>();
    
    for (int x = 0; x < boardSize; x++) {
      for (int y = 0; y < boardSize; y++) {
        if (pieceArr[x][y] == 0) {
          availableMoves.add(new int[]{x, y});
        }
      }
    }
    return availableMoves;
  }

  char getWinner() {
    return 0;
  }
  
  void draw(float posX, float posY) {
    drawGrid(posX, posY, drawSize, pieceSize, boardSize, color(170));
    drawPieces(posX, posY);
  }
}

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
  
  char getRowWinner() {
    for (int y = 0; y < boardSize; y++) {
      for (int x = 0; x < boardSize; x++) {
        if (pieceArr[0][y] != pieceArr[x][y] || pieceArr[x][y] == 0) {
          break;
        } else {
          if (x == boardSize - 1) {
            return pieceArr[x][y];
          }
        }
      }
    }
    return 0;
  }
  
  char getColWinner() {
    for (int x = 0; x < boardSize; x++) {
      for (int y = 0; y < boardSize; y++) {
        if (pieceArr[x][0] != pieceArr[x][y] || pieceArr[x][y] == 0) {
          break;
        } else {
          if (y == boardSize - 1) {
            return pieceArr[x][y];
          }
        }
      }
    }
    return 0;
  }

  char getDiagsWinner() {
    for (int i = 0; i < boardSize; i++) { // Diagonal check
      if (pieceArr[0][0] != pieceArr[i][i] || pieceArr[i][i] == 0) {
        break;
      } else {
        if (i == boardSize - 1) {
          return pieceArr[i][i];
        }
      }
    }
    
    for (int i = 0; i < boardSize; i++) { // Reverse diagonal check
      if (pieceArr[0][boardSize - 1] != pieceArr[i][boardSize - 1 - i] || pieceArr[i][boardSize - 1 - i] == 0) {
        break;
      } else {
        if (i == boardSize - 1) {
          return pieceArr[i][boardSize - 1 - i];
        }
      }
    }
    return 0;
  }

  char getWinner() {
    if (getRowWinner() != 0 && getRowWinner() != 'T') {
      return getRowWinner();
    }
    if (getColWinner() != 0 && getColWinner() != 'T') {
      return getColWinner();
    }
    if (getDiagsWinner() != 0 && getDiagsWinner() != 'T') {
      return getDiagsWinner();
    }
    if (getAvailableMoves().size() == 0) {
      return 'T';
    }
    return 0;
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
      return true;
    }
    return false;
  }

  void draw(float posX, float posY) {
    drawGrid(posX, posY, drawSize, pieceSize, boardSize, color(170));
    drawPieces(posX, posY);
  }
}

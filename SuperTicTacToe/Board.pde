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
      println(gridClickX, gridClickY);
    }
  }
  
  char getWinner() {
    return 0;
  }
}

class GlobalBoard extends Board {
  Board boardArr[][];

  GlobalBoard(int newBoardSize, int newDrawSize) {
    super(newBoardSize, newDrawSize);
    boardArr = new Board[boardSize][boardSize];

    for (int x = 0; x < boardSize; x++) {
      for (int y = 0; y < boardSize; y++) {
        if (boardArr[x][y] == null) {
          boardArr[x][y] = new Board(boardSize, drawSize / boardSize);
        } else {
          continue;
        }
      }
    }
  }
  
  void updateGlobalBoard() { // Updates the pieces of the global board to the winner of every board in it
    for (int x = 0; x < boardSize; x++) {
      for (int y = 0; y < boardSize; y++) {
        pieceArr[x][y] = boardArr[x][y].getWinner();
      }
    }
  }
  
  void draw(float posX, float posY) { // The global board is meant to be centered, so posX and posY should be 0
    posX += (width / 2) - (drawSize / 2);
    posY += (height / 2) - (drawSize / 2);
    
    for (int x = 0; x < boardSize; x++) {
      for (int y = 0; y < boardSize; y++) {
        Board current = boardArr[x][y];
        current.draw(posX + (x * current.drawSize), posY + (y * current.drawSize));
      }
    }
    
    drawGrid(posX, posY, drawSize, pieceSize, boardSize, color(0));
  }
}

class GlobalBoard extends Board {
  Board boardArr[][];
  float localSizeMultiplier = 0.80; // For local board scaling

  GlobalBoard(int newBoardSize, float newDrawSize) {
    super(newBoardSize, newDrawSize);
    boardArr = new Board[boardSize][boardSize];

    for (int x = 0; x < boardSize; x++) {
      for (int y = 0; y < boardSize; y++) {
        if (boardArr[x][y] == null) {
          boardArr[x][y] = new Board(boardSize, (drawSize / boardSize) * localSizeMultiplier);
        } else {
          continue;
        }
      }
    }
  }

  void updateGlobalBoard() { // Updates the pieces of the global board to the winner of every local board in it
    for (int x = 0; x < boardSize; x++) {
      for (int y = 0; y < boardSize; y++) {
        pieceArr[x][y] = boardArr[x][y].getWinner();
      }
    }
  }

  void drawPieces(float posX, float posY) { // A local board is a piece on a global board
    for (int x = 0; x < boardSize; x++) {
      for (int y = 0; y < boardSize; y++) {
        Board current = boardArr[x][y];
        float centerOffset = (pieceSize - current.drawSize) / 2;
        current.draw(posX + (x * pieceSize) + centerOffset, posY + (y * pieceSize) + centerOffset);
        if (current.getWinner() != 0) {
          noStroke();
          fill(current.getWinner() == 'X' ? color(255, 0, 0, 150) : color(0, 0, 255, 150));
          rect(posX + (x * pieceSize), posY + (y * pieceSize), pieceSize, pieceSize);
        }
      }
    }
  }

  void draw(float posX, float posY) { // The global board is meant to be centered, so posX and posY should be 0
    posX += (width / 2) - (drawSize / 2);
    posY += (height / 2) - (drawSize / 2);

    drawGrid(posX, posY, drawSize, pieceSize, boardSize, color(0));
    drawPieces(posX, posY);
  }

  boolean validClick(float posX, float posY, char side) { //TODO cleanup
    posX += (width / 2) - (drawSize / 2);
    posY += (height / 2) - (drawSize / 2);
    int gridClickX = floor((mouseX - posX) / pieceSize);
    int gridClickY = floor((mouseY - posY) / pieceSize);

    if (gridClickX >= 0 && gridClickX < boardSize && gridClickY >= 0 && gridClickY < boardSize) {
      Board clickedBoard = boardArr[gridClickX][gridClickY];
      float boardOffsetX = (gridClickX * pieceSize);
      float boardOffsetY = (gridClickY * pieceSize);
      float centerOffset = (pieceSize - clickedBoard.drawSize) / 2;

      if (clickedBoard.getWinner() == 0) {
        println("Global Board:", gridClickX, gridClickY);
        if (clickedBoard.validClick(posX + boardOffsetX + centerOffset, posY + boardOffsetY + centerOffset, side)) {
          updateGlobalBoard(); // Put this in a different place
          return true;
        }
      }
    }
    return false;
  }
}

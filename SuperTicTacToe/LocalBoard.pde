class LocalBoard extends Board {
  GlobalBoard parentBoard;

  LocalBoard(GlobalBoard newParentBoard, int newBoardSize, float newDrawSize) {
    super(newBoardSize, newDrawSize);
    parentBoard = newParentBoard;
  }

  void doMove(int moveX, int moveY, char side) {
    if (pieceArr[moveX][moveY] == 0) {
      pieceArr[moveX][moveY] = side;
      
      LocalBoard boardToMove = parentBoard.boardArr[moveX][moveY];
      if (boardToMove.getWinner() != 0) {
        parentBoard.currentPlayBoard = null;
        parentBoard.playBoardX = -1;
        parentBoard.playBoardY = -1;
      } else {
        parentBoard.currentPlayBoard = boardToMove;
        parentBoard.playBoardX = moveX;
        parentBoard.playBoardY = moveY;
      }
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
    if ((parentBoard.currentPlayBoard == null || parentBoard.currentPlayBoard == this) && this.getWinner() == 0 && currentGame.winner == 0) {
      noStroke();
      fill(color(0, 255, 0, 100));
      rect(posX, posY, drawSize, drawSize);
    }
  }
}

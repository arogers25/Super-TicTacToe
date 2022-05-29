class LocalBoard extends Board {
  GlobalBoard parentBoard;
  
  LocalBoard(GlobalBoard newParentBoard, int newBoardSize, float newDrawSize) {
    super(newBoardSize, newDrawSize);
    parentBoard = newParentBoard;
  }
  
  boolean validClick(float posX, float posY, char side) {
    int gridClickX = floor((mouseX - posX) / pieceSize);
    int gridClickY = floor((mouseY - posY) / pieceSize);

    if (gridClickX >= 0 && gridClickX < boardSize && gridClickY >= 0 && gridClickY < boardSize && pieceArr[gridClickX][gridClickY] == 0) {
      doMove(gridClickX, gridClickY, side);
      LocalBoard boardToMove = parentBoard.boardArr[gridClickX][gridClickY];
      if (boardToMove.getWinner() != 0) {
        parentBoard.currentPlayBoard = null;
      } else {
        parentBoard.currentPlayBoard = boardToMove;
      }
      return true;
    }
    return false;
  }
}

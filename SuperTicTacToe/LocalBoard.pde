class LocalBoard extends Board {
  GlobalBoard parentBoard;
  
  LocalBoard(GlobalBoard newParentBoard, int newBoardSize, float newDrawSize) {
    super(newBoardSize, newDrawSize);
    parentBoard = newParentBoard;
  }
}

class Game {
  char startingSide = 'X';
  char currentSide = 0;
  GlobalBoard gameBoard;
  JSONArray savedBoard;

  Game(GlobalBoard newGameBoard, char newStartingSide) {
    gameBoard = newGameBoard;
    startingSide = newStartingSide;
    currentSide = startingSide;
    savedBoard = new JSONArray();
  }

  void switchSides() {
    if (currentSide == 'X') {
      currentSide = 'O';
    } else {
      currentSide = 'X';
    }
  }

  JSONArray saveLocalBoard(LocalBoard localBoard) {
    JSONArray savedLocalBoard = new JSONArray();
    for (int x = 0; x < localBoard.boardSize; x++) {
      JSONArray colArr = new JSONArray();
      for (int y = 0; y < localBoard.boardSize; y++) {
        colArr.setInt(y, localBoard.pieceArr[x][y]);
      }
      savedLocalBoard.setJSONArray(x, colArr);
    }
    return savedLocalBoard;
  }

  void save() {
    for (int x = 0; x < gameBoard.boardSize; x++) {
      JSONArray colArr = new JSONArray();
      for (int y = 0; y < gameBoard.boardSize; y++) {
        colArr.setJSONArray(y, saveLocalBoard(gameBoard.boardArr[x][y]));
      }
      savedBoard.setJSONArray(x, colArr);
    }
  }

  void load() {
    int testX = 2;
    int testY = 1;
    println(savedBoard.getJSONArray(0).getJSONArray(0).getJSONArray(testX).getInt(testY));
  }

  void draw() {
    gameBoard.draw(0, 0);
    drawPiece(10, 10, 70, currentSide);
  }

  void mousePressed() {
    if (gameBoard.validClick(0, 0, currentSide)) {
      switchSides();
    }
  }
}

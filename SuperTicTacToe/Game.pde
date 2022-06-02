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
    JSONArray savedBoard = new JSONArray();
    for (int x = 0; x < localBoard.boardSize; x++) {
      JSONArray colArr = new JSONArray();
      for (int y = 0; y < localBoard.boardSize; y++) {
        colArr.setString(y, Character.toString(localBoard.pieceArr[x][y]));
      }
      savedBoard.setJSONArray(x, colArr);
    }
    return savedBoard;
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
    println(savedBoard.getJSONArray(2));
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

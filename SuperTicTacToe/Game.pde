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
    for (int globalX = 0; globalX < 3; globalX++) {
      for (int globalY = 0; globalY < 3; globalY++) {
        for (int x = 0; x < 3; x++) {
          for (int y = 0; y < 3; y++) {
            gameBoard.boardArr[globalX][globalY].pieceArr[x][y] = (char)savedBoard.getJSONArray(globalX).getJSONArray(globalY).getJSONArray(x).getInt(y);
          }
        }
      }
    }
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

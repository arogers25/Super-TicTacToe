class Game {
  char startingSide = 'X';
  char currentSide = 0;
  GlobalBoard gameBoard;
  JSONObject savedGame;

  Game(GlobalBoard newGameBoard, char newStartingSide) {
    gameBoard = newGameBoard;
    startingSide = newStartingSide;
    currentSide = startingSide;
    savedGame = new JSONObject();
    savedGame.setJSONArray("gameBoard", new JSONArray());
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
    savedGame.setInt("currentSide", currentSide);
    savedGame.setInt("playBoardX", gameBoard.playBoardX);
    savedGame.setInt("playBoardY", gameBoard.playBoardY);
    for (int x = 0; x < gameBoard.boardSize; x++) {
      JSONArray colArr = new JSONArray();
      for (int y = 0; y < gameBoard.boardSize; y++) {
        colArr.setJSONArray(y, saveLocalBoard(gameBoard.boardArr[x][y]));
      }
      savedGame.getJSONArray("gameBoard").setJSONArray(x, colArr);
    }
    saveJSONObject(savedGame, "saveFile.json");
  }
  
  void load() {
    savedGame = loadJSONObject("saveFile.json");
    JSONArray savedBoard = savedGame.getJSONArray("gameBoard");
    currentSide = (char)savedGame.getInt("currentSide");
    int boardSize = gameBoard.boardSize;
    if (savedGame.getInt("playBoardX") >= 0 && savedGame.getInt("playBoardX") < boardSize) { // TODO cleanup
      gameBoard.currentPlayBoard = gameBoard.boardArr[savedGame.getInt("playBoardX")][savedGame.getInt("playBoardY")];
    } else {
      gameBoard.currentPlayBoard = null;
    }
    
    for (int globalX = 0; globalX < boardSize; globalX++) {
      for (int globalY = 0; globalY < boardSize; globalY++) {
        for (int x = 0; x < boardSize; x++) {
          for (int y = 0; y < boardSize; y++) {
            char boardPiece = (char)savedBoard.getJSONArray(globalX).getJSONArray(globalY).getJSONArray(x).getInt(y);
            gameBoard.boardArr[globalX][globalY].pieceArr[x][y] = boardPiece;
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

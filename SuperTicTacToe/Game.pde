class Game {
  char startingSide = 'X';
  char currentSide = 0;
  char humanSide = 0;
  char winner = 0;
  GlobalBoard gameBoard;
  JSONObject savedGame;
  int player1Score = 0, player2Score = 0;
  ArrayList<Bot> bots;

  Game(GlobalBoard newGameBoard, char newStartingSide) {
    gameBoard = newGameBoard;
    startingSide = newStartingSide;
    currentSide = startingSide;
    savedGame = new JSONObject();
    savedGame.setJSONArray("gameBoard", new JSONArray());
  }

  Game(GlobalBoard newGameBoard, char newStartingSide, int savedPlayer1Score, int savedPlayer2Score) {
    gameBoard = newGameBoard;
    startingSide = newStartingSide;
    currentSide = startingSide;
    savedGame = new JSONObject();
    player1Score = savedPlayer1Score;
    player2Score = savedPlayer2Score;
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
    savedGame.setInt("player1Score", player1Score);
    savedGame.setInt("player2Score", player2Score);
    savedGame.setInt("humanSide", humanSide);
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
    if (loadStrings("saveFile.json") == null) {
      println("Savefile does not exist!");
      return;
    }

    savedGame = loadJSONObject("saveFile.json");
    player1Score = savedGame.getInt("player1Score");
    player2Score = savedGame.getInt("player2Score");
    humanSide = (char)savedGame.getInt("humanSide");

    JSONArray savedBoard = savedGame.getJSONArray("gameBoard");
    currentSide = (char)savedGame.getInt("currentSide");
    int boardSize = gameBoard.boardSize;
    if (savedGame.getInt("playBoardX") >= 0 && savedGame.getInt("playBoardX") < boardSize) {
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
    gameBoard.updateGlobalBoard();
    if (gameBoard.getWinner() != 0) {
      winner = gameBoard.getWinner();
    }
  }

  void draw() {
    gameBoard.draw(0, 0);
    if (winner == 0) {
      if (bots.size() > 0) {
      for (Bot i : bots) {
        i.doRandomMove();
      }
      }
      winner = gameBoard.getWinner();
      if (gameBoard.getWinner() == 'X') player1Score++;
      if (gameBoard.getWinner() == 'O') player2Score++;
    } else {
      noStroke();
      fill(getSideColor(winner, 190));
      rect((width / 2) - (gameBoard.drawSize / 2), (height / 2) - (gameBoard.drawSize / 2), gameBoard.drawSize, gameBoard.drawSize);
      fill(0);
      float winnerTextSize = height * 0.08;
      textSize(winnerTextSize);
      while (textWidth("X Wins") > gameBoard.drawSize) textSize(winnerTextSize--);
      text("X Wins", width / 2, height * 0.5);
    }
    textSize(height * 0.10);
    fill(0);
    text(player1Score + " - " + player2Score, width / 2, height * 0.05);
    textSize(height * 0.05);
    text(" Moves", width / 2, height - (gameBoard.pieceSize * 0.4));
    drawPiece((width * 0.49) - textWidth("Moves"), height - (gameBoard.pieceSize * 0.5), gameBoard.pieceSize * 0.3, currentSide);
    //drawPiece(10, 10, 70, currentSide);
  }

  void mousePressed() {
    if (bots.size() > 1 || (bots.size() == 1 && currentSide == bots.get(0).side)) {
      return;
    }
    if (gameBoard.validClick(0, 0, currentSide) ) {
      switchSides();
    }
  }
}

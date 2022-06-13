class Bot {
  Game game;
  GlobalBoard globalBoard;
  char side = 'X';
  
  Bot(Game newGame, char newSide) {
    game = newGame;
    globalBoard = game.gameBoard;
    side = newSide;
  }
  
  void doRandomMove() {
    ArrayList<int[]> availableBoards = globalBoard.getAvailableMoves();
    if (globalBoard.currentPlayBoard == null) {
      if (availableBoards.size() > 0) {
        int[] randomBoard = availableBoards.get(floor(random(0, availableBoards.size())));
        globalBoard.currentPlayBoard = globalBoard.boardArr[randomBoard[0]][randomBoard[1]];
      }
    } else {
      ArrayList<int[]> availableMoves = globalBoard.currentPlayBoard.getAvailableMoves();
      int[] randomMove = availableMoves.get(floor(random(0, availableMoves.size())));
      globalBoard.currentPlayBoard.doMove(randomMove[0], randomMove[1], side);
    }
    game.switchSides();
  }
}

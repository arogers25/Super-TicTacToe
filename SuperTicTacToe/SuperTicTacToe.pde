Game currentGame;
Menu currentMenu;
Menu inGameMenu;
Menu mainMenu;

void setup() {
  strokeCap(SQUARE);
  fullScreen();
  gameFont = createFont("Arial", 32);
  textFont(gameFont);
  currentGame = new Game(new GlobalBoard(3, height * 0.80), 'X');
  
  mainMenu = new MainMenu();
  inGameMenu = new MainMenu();
  currentMenu = mainMenu;
}

void draw() {
  background(255);
  if (currentMenu == inGameMenu) {
    char winner = currentGame.gameBoard.getWinner();
    if (winner != 0) {
      println(winner);
    }
    currentGame.draw();
  }
  currentMenu.draw();
}

void mousePressed() {
  if (currentMenu == inGameMenu) {
    currentGame.mousePressed();
  }
  currentMenu.input();
}

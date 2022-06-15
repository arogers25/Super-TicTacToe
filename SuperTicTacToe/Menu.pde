Menu currentMenu;
Menu inGameMenu;
Menu mainMenu;

class Menu {
  ArrayList<Button> buttons;
  Button exitButton;

  Menu() {
    exitButton = new Button("Exit", width - (height * 0.2), 0, (height * 0.2), (height * 0.1), color(255, 0, 0));
    buttons = new ArrayList<Button>();
    buttons.add(exitButton);
  }

  void draw() {
    for (Button i : buttons) {
      textSize(32); // Default text size
      i.draw();
    }
  }

  void input() {
    if (exitButton.hovering) {
      exit();
    }
    for (Button i : buttons) {
      i.input();
    }
  }
}

class MainMenu extends Menu {
  Button playButton;
  Button loadButton;
  ButtonList playerAmountButton;
  ButtonList startingSideButton;
  int playerAmount = 2;

  MainMenu() {
    super();
    float optionY = (height / 2);
    float optionH = (height * 0.07);

    playButton = new Button("Play", (width * 0.35), optionY + optionH * 4.3, width * 0.3, optionH, color(100, 255, 100));
    loadButton = new Button("Load Previous Game", (width * 0.35), optionY + optionH * 3, width * 0.3, optionH, color(200));

    playerAmountButton = new ButtonList(new String[]{"Zero Players", "One Player", "Two Players"}, width * 0.35, optionY + optionH, width * 0.3, optionH);
    playerAmountButton.value = playerAmount;

    startingSideButton = new ButtonList(new String[]{"", ""}, width * 0.4, height * 0.25, width * 0.2, width * 0.1);

    buttons.add(playerAmountButton);
    buttons.add(startingSideButton);
    buttons.add(loadButton);
    buttons.add(playButton);
    updateSideButtons();
  }

  void draw() {
    super.draw();
    fill(0);
    textSize(height * 0.10);
    text("Super Tic Tac Toe", width / 2, height * 0.07);
    textSize(height * 0.05);
    text("Who Goes First?", width / 2, height * 0.20);
    text("How Many Players?", width / 2, height * 0.50);

    if (playerAmount != 1) {
      float pieceW = startingSideButton.buttons.get(0).w / 2;
      drawPiece(startingSideButton.buttons.get(0).x + (pieceW / 2), startingSideButton.buttons.get(0).y + (pieceW / 2), pieceW, 'X');
      drawPiece(startingSideButton.buttons.get(1).x + (pieceW / 2), startingSideButton.buttons.get(1).y + (pieceW / 2), pieceW, 'O');
    }
  }

  void updateSideButtons() { // Find a different way to do this
    if (playerAmount == 1) {
      startingSideButton.buttons.get(0).label = "Human";
      startingSideButton.buttons.get(1).label = "Computer";
    } else {
      startingSideButton.buttons.get(0).label = "";
      startingSideButton.buttons.get(1).label = "";
    }
  }

  void input() {
    super.input();
    playerAmount = playerAmountButton.value;
    char selectedSide = startingSideButton.value == 0 ? 'X' : 'O';

    updateSideButtons();
    if (playButton.hovering) {
      currentGame = new Game(new GlobalBoard(3, height * 0.70), selectedSide);
      currentGame.bots = new ArrayList<Bot>();
      switch (playerAmount) {
      case 0: 
        {
          currentGame.bots.add(new Bot(currentGame, 'X'));
          currentGame.bots.add(new Bot(currentGame, 'O'));
        }
      case 1: 
        {
          currentGame.startingSide = 'X';
          currentGame.bots.add(new Bot(currentGame, selectedSide == 'X' ? 'O' : 'X')); // Need to fix bot starting side
        }
      }
      currentMenu = inGameMenu;
    }
    if (loadButton.hovering) {
      currentGame = new Game(new GlobalBoard(3, height * 0.70), selectedSide);
      currentGame.load();
      currentMenu = inGameMenu;
    }
  }
}

class GameMenu extends Menu {
  Button backButton;
  Button restartButton;
  Button saveButton;
  Button loadButton;

  GameMenu() {
    super();
    backButton = new Button("Back To Menu", 0, 0, (height * 0.2), (height * 0.1), color(200));
    restartButton = new Button("Play Again", (width / 2) - (height * 0.1), (height / 2) + (height * 0.05), (height * 0.2), (height * 0.05), color(200));
    saveButton = new Button("Save", 0, height - (height * 0.1), (height * 0.2), (height * 0.1), color(100, 100, 255));
    loadButton = new Button("Load", width - (height * 0.2), height - (height * 0.1), (height * 0.2), (height * 0.1), color(100, 255, 100));
    buttons.add(backButton);
    buttons.add(saveButton);
    buttons.add(loadButton);
    buttons.add(restartButton);
  }

  void draw() {
    for (Button i : buttons) {
      textSize(32);
      if (i == restartButton && currentGame.winner == 0) {
        continue;
      }
      i.draw();
    }
  }

  void input() {
    super.input();
    if (backButton.hovering) {
      currentMenu = mainMenu;
    }
    if (restartButton.hovering && currentGame.winner != 0) {
      currentGame = new Game(new GlobalBoard(3, height * 0.70), currentGame.startingSide, currentGame.player1Score, currentGame.player2Score);
      int playerAmount = 2 - currentGame.bots.size();
      char botSide = 0;
      if (playerAmount == 1) {
        botSide = currentGame.bots.get(0).side;
      }
      currentGame.bots = new ArrayList<Bot>();
      switch (playerAmount) {
      case 0: 
        {
          currentGame.bots.add(new Bot(currentGame, 'X'));
          currentGame.bots.add(new Bot(currentGame, 'O'));
        }
      case 1: 
        {
          currentGame.bots.add(new Bot(currentGame, botSide));
        }
      }
    }
    if (saveButton.hovering) {
      currentGame.save();
    }
    if (loadButton.hovering) {
      currentGame.load();
    }
  }
}

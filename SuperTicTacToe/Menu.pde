class Menu {
  ArrayList<Button> buttons;
  Button exitButton;

  Menu() {
    exitButton = new Button("Exit", width - (height * 0.2), 0, (height * 0.2), (height * 0.07), color(255, 0, 0));
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
  ButtonList playerAmountButton;
  ButtonList startingSideButton;
  int playerAmount = 0;

  MainMenu() {
    super();
    float optionY = (height / 2);
    float optionH = (height * 0.07);

    playButton = new Button("Play", (width * 0.35), optionY + optionH * 3, width * 0.3, optionH, color(100, 255, 100));

    playerAmountButton = new ButtonList(new String[]{"Zero Players", "One Player", "Two Players"}, width * 0.35, height * 0.55, width * 0.3, optionH);
    playerAmount = playerAmountButton.value;

    startingSideButton = new ButtonList(new String[]{"", ""}, width * 0.4, height * 0.25, width * 0.2, width * 0.1);

    buttons.add(playerAmountButton);
    buttons.add(startingSideButton);
    buttons.add(playButton);
    updateSideButtons();
  }
  
  void draw() {
    super.draw();
    fill(0);
    textSize(72);
    text("Super Tic Tac Toe", width / 2, height * 0.07);
    textSize(48);
    text("Who Goes First?", width / 2, height * 0.20);
    text("How Many Players?", width / 2, height * 0.50);
    if (playerAmount != 1) {
      //println(startingSideButton.buttons.get(0).x);
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
    updateSideButtons();
    if (playButton.hovering) {
      currentGame = new Game(new GlobalBoard(3, height * 0.70), 'X');
      currentMenu = inGameMenu;
    }
  }
}

class GameMenu extends Menu {
  Button backButton;
  Button restartButton;
  
  GameMenu() {
    super();
    backButton = new Button("Back To Menu", 0, 0, (height * 0.2), (height * 0.07), color(200));
    buttons.add(backButton);
  }
  
  void draw() {
    for (Button i : buttons) {
      textSize(32);
      if (i == restartButton && currentGame.gameBoard.getWinner() == 0) {
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
  }
}

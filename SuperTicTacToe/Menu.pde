class Menu {
  ArrayList<Button> buttons;
  Button exitButton;
  
  Menu() {
    exitButton = new Button("Exit", width - (height * 0.1), 0, (height * 0.1), (height * 0.1), color(255, 0, 0));
    buttons = new ArrayList<Button>();
    buttons.add(exitButton);
  }
  
  void draw() {
    for (Button i : buttons) {
      i.draw();
    }
  }
  
  void input() {
    if (exitButton.hovering) {
      exit();
    }
  }
}

class MainMenu extends Menu {
  Button testButton;
  
  MainMenu() {
    super();
    float optionY = (height / 2);
    float optionH = (height * 0.07);
    testButton = new Button("Test", width / 3, optionY, width / 3, optionH, color(200));
    buttons.add(testButton);
  }
  
  void input() {
    super.input();
    
    if (testButton.hovering) {
      currentGame = new Game(new GlobalBoard(3, height * 0.80), 'X');
      currentMenu = inGameMenu;
    }
  }
}

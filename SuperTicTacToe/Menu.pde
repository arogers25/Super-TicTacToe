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
    for (Button i : buttons) {
      i.input();
    }
  }
}

class MainMenu extends Menu {
  Button testButton;
  ButtonList testButtonList;
  int buttonListVal = 0;
  
  MainMenu() {
    super();
    float optionY = (height / 2);
    float optionH = (height * 0.07);
    testButton = new Button("Play", (width / 2) - (width * 0.15), optionY + optionH * 3, width * 0.3, optionH, color(100, 255, 100));
    testButtonList = new ButtonList(new String[]{"Test", "Test 2", "Test 3"}, 100, 100, 300, 100, color(200));
    buttonListVal = testButtonList.value;
    buttons.add(testButtonList);
    buttons.add(testButton);
  }
  
  void input() {
    super.input();
    buttonListVal = testButtonList.value;
    if (testButton.hovering) {
      currentGame = new Game(new GlobalBoard(3, height * 0.80), 'X');
      currentMenu = inGameMenu;
    }
  }
}

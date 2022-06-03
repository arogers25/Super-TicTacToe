Game currentGame;
Button exitButton;
Button saveButton;
Button loadButton;
Button newGameButton;

void setup() {
  strokeCap(SQUARE);
  size(720, 1080);
  gameFont = createFont("Arial", 32);
  textFont(gameFont);
  GlobalBoard newGameBoard = new GlobalBoard(3, width * 0.80);
  currentGame = new Game(newGameBoard, 'X');
  exitButton = new Button("Exit", width - 100, 0, 100, 100, color(255, 0, 0));
  loadButton = new Button("Load", width - 200, 0, 100, 100, color(200));
  saveButton = new Button("Save", width - 300, 0, 100, 100, color(200));
  newGameButton = new Button("Reset", width - 400, 0, 100, 100, color(200));
}

void draw() {
  background(255);
  char winner = currentGame.gameBoard.getWinner();
  if (winner != 0) {
    println(winner);
  }
  currentGame.draw();
  exitButton.draw();
  saveButton.draw();
  loadButton.draw();
  newGameButton.draw();
}

void mousePressed() {
  currentGame.mousePressed();
  if (saveButton.hovering) {
    println("Saved");
    currentGame.save();
  }
  if (loadButton.hovering) {
    println("Loaded");
    currentGame.load();
  }
  if (exitButton.hovering) {
    exit();
  }
  if (newGameButton.hovering) {
    currentGame = new Game(new GlobalBoard(3, currentGame.gameBoard.drawSize), currentGame.startingSide);
  }
}

Game currentGame;
Button newButton;
Button saveButton;
Button loadButton;

void setup() {
  strokeCap(SQUARE);
  size(720, 1080);
  gameFont = createFont("Arial", 32);
  textFont(gameFont);
  GlobalBoard newGameBoard = new GlobalBoard(3, width * 0.80);
  currentGame = new Game(newGameBoard, 'X');
  newButton = new Button("Exit", width - 100, 0, 100, 100, color(255, 0, 0));
  loadButton = new Button("Load", width - 200, 0, 100, 100, color(200));
  saveButton = new Button("Save", width - 300, 0, 100, 100, color(200));
}

void draw() {
  background(255);
  char winner = currentGame.gameBoard.getWinner();
  if (winner != 0) {
    println(winner);
  }
  currentGame.draw();
  newButton.draw();
  saveButton.draw();
  loadButton.draw();
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
  if (newButton.hovering) {
    exit();
  }
}

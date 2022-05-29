Game currentGame;

void setup() {
  strokeCap(SQUARE);
  fullScreen();
  currentGame = new Game(new GlobalBoard(3, height), 'X');
}

void draw() {
  background(255);
  currentGame.draw();
}

void mousePressed() {
  currentGame.mousePressed();
}

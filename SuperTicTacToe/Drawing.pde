PFont gameFont;

void drawGrid(float x, float y, float w, float boxSize, int boxes, color col) {
  strokeWeight(9.0);
  stroke(col);

  for (int i = 1; i < boxes; i++) {
    line(x, y + (boxSize * i), x + w, y + (boxSize * i));
    line(x + (boxSize * i), y, x + (boxSize * i), y + w);
  }
}

color getSideColor(char side, int newAlpha) {
  switch (side) {
  case 'X':
    return color(255, 0, 0, newAlpha);
  case 'O':
    return color(0, 0, 255, newAlpha);
  default:
    return color(120, 120, 120, newAlpha);
  }
}

void drawX(float x, float y, float w) {
  noFill();
  strokeWeight(7.0);
  stroke(getSideColor('X', 255));
  line(x, y, x + w, y + w);
  line(x + w, y, x, y + w);
}

void drawO(float x, float y, float w) {
  noFill();
  strokeWeight(7.0);
  stroke(getSideColor('O', 255));
  stroke(color(0, 0, 255));
  circle(x + (w / 2), y + (w / 2), w);
}

void drawPiece(float x, float y, float w, char side) {
  switch (side) {
  case 'X':
    drawX(x, y, w);
    break;
  case 'O':
    drawO(x, y, w);
    break;
  default:
    break;
  }
}

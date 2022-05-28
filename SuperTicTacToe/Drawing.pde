void drawGrid(float x, float y, float w, float boxSize, int boxes, color col) {
  strokeWeight(7.0);
  stroke(col);
  
  /*if (centered) {
    x += (width / 2) - (w / 2);
    y += (height / 2) - (w / 2); 
  }*/
  
  for (int i = 1; i < boxes; i++) {
    line(x, y + (boxSize * i), x + w, y + (boxSize * i));
    line(x + (boxSize * i), y, x + (boxSize * i), y + w);
  }
}

void drawX(float x, float y, float w) {
  strokeWeight(7.0);
  stroke(color(255, 0, 0));
  line(x, y, x + w, y + w);
  line(x + w, y, x, y + w);
}

void drawO(float x, float y, float w) {
  strokeWeight(7.0);
  stroke(color(0, 0, 255));
  circle(x + (w / 2), y + (w / 2), w);
}

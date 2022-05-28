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

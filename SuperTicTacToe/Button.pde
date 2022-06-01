class Button {
  float x, y, w, h;
  String label;
  boolean hovering;
  color col;
  
  Button(String newLabel, float newX, float newY, float newW, float newH, color newCol) {
    label = newLabel;
    x = newX;
    y = newY;
    w = newW;
    h = newH;
    col = newCol;
  }
  
  void draw() {
    hovering = (mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + h);
    
    stroke(0);
    strokeWeight(1);
    fill(col);
    rect(x, y, w, h);
    textAlign(CENTER, CENTER);
    fill(0);
    text(label, x + w / 2, (y + h / 2) - (textDescent() / 2));
    if (hovering) {
      fill(color(255, 255, 255, 100));
      rect(x, y, w, h);
    }
  }
}

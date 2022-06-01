class Button {
  float x, y, w, h;
  String label;
  boolean hovering;
  
  Button(String newLabel, float newX, float newY, float newW, float newH) {
    label = newLabel;
    x = newX;
    y = newY;
    w = newW;
    h = newH;
  }
  
  void draw() {
    hovering = (mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + h);
    stroke(0);
    strokeWeight(1);
    fill(255);
    rect(x, y, w, h);
  }
}

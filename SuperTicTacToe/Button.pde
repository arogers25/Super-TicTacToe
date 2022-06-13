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
    int newTextSize = 32;
    while (textWidth(label) > (w * 0.9)) textSize(newTextSize--);
    fill(0);
    text(label, x + w / 2, (y + h / 2) - (textDescent() / 2));
    if (hovering) {
      fill(color(255, 255, 255, 100));
      rect(x, y, w, h);
    }
  }
  
  void input() {
  }
  
}

class ButtonList extends Button{
  ArrayList<Button> buttons;
  int value = 0;
  
  ButtonList(String[] optionsList, float newX, float newY, float newW, float newH) {
    super("", newX, newY, newW, newH, color(200));
    buttons = new ArrayList<Button>();
    float buttonW = w / optionsList.length;
    for (int i = 0; i < optionsList.length; i++) {
      buttons.add(new Button(optionsList[i], x + buttonW * i, y, buttonW, newH, color(200)));
    }
  }
  
  void draw() {
    hovering = (mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + h);
    for (int i = 0; i < buttons.size(); i++) {
      if (value == i) {
        buttons.get(i).col = color(170);
      } else {
        buttons.get(i).col = color(200);
      }
      buttons.get(i).draw();
    }
  }
  
  void input() {
    for (int i = 0; i < buttons.size(); i++) {
      if (buttons.get(i).hovering) {
        value = i;
      }
    }
  }
}

class FloatingText {
  String message;
  float x;
  float y;
  int c;
  int life = 55;

  FloatingText(String message, float x, float y, int c) {
    this.message = message;
    this.x = x;
    this.y = y;
    this.c = c;
  }

  void update() {
    y -= 0.8;
    life--;
  }

  void display() {
    textAlign(CENTER, CENTER);
    textSize(18);
    fill(c, map(life, 0, 55, 0, 255));
    text(message, x, y);
  }

  boolean finished() {
    return life <= 0;
  }
}

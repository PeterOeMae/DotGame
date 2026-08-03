class Star {
  float x;
  float y;
  float speed;
  float alpha;

  Star() {
    x = random(width);
    y = random(60, height);
    speed = random(0.2f, 0.8f);
    alpha = random(28, 90);
  }

  void update() {
    y += speed;
    if (y > height) {
      y = 60;
      x = random(width);
    }
  }

  void display() {
    noStroke();
    fill(95, 150, 95, alpha);
    ellipse(x, y, 3, 3);
  }
}

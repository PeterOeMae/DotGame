class Farmer {
  float x;
  float y;
  float dx;
  float dy;
  float size = 34;
  float rotation = 0;
  PImage img;

  Farmer(PImage img) {
    this.img = img;
    chooseDirection();
  }

  void update(int level) {
    float speed = 2.0f + min(4.0f, level * 0.28f);
    x += dx * speed;
    y += dy * speed;
    rotation += 0.03 + level * 0.004;

    if (x < size / 2 || x > width - size / 2) {
      dx *= -1;
      x = constrain(x, size / 2, width - size / 2);
    }

    if (y < 72 || y > height - size / 2) {
      dy *= -1;
      y = constrain(y, 72, height - size / 2);
    }
  }

  void display() {
    pushMatrix();
    translate(x, y);
    rotate(rotation);
    imageMode(CENTER);
    image(img, 0, 0, size, size);
    imageMode(CORNER);
    popMatrix();
  }

  boolean hits(Player player) {
    return dist(x, y, player.x, player.y) < (size + player.size) * 0.43;
  }

  void respawnAwayFrom(float avoidX, float avoidY) {
    int attempts = 0;
    do {
      x = random(45, width - 45);
      y = random(90, height - 55);
      attempts++;
    } while (dist(x, y, avoidX, avoidY) < 220 && attempts < 80);
    chooseDirection();
  }

  void chooseDirection() {
    float angle = random(TWO_PI);
    dx = cos(angle);
    dy = sin(angle);
  }
}

class Cow {
  float x;
  float y;
  float size = 34;
  PImage img;

  Cow(PImage img) {
    this.img = img;
    respawnAwayFrom(width / 2, height / 2);
  }

  void update() {
    // The cow gently bobs to make the target easier to spot.
  }

  void display() {
    pushMatrix();
    translate(x, y + sin(frameCount * 0.08f) * 3);
    scale(1.0f + sin(frameCount * 0.05f) * 0.03f);
    imageMode(CENTER);
    image(img, 0, 0, size, size);
    imageMode(CORNER);
    popMatrix();
  }

  boolean hits(Player player) {
    return dist(x, y, player.x, player.y) < (size + player.size) * 0.45;
  }

  void respawnAwayFrom(float avoidX, float avoidY) {
    int attempts = 0;
    do {
      x = random(45, width - 45);
      y = random(90, height - 55);
      attempts++;
    } while (dist(x, y, avoidX, avoidY) < 180 && attempts < 60);
  }
}

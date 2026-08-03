class Player {
  float x;
  float y;
  float size = 34;
  float speed = 5.2f;
  PImage idleImage;
  PImage carryingImage;

  Player(float startX, float startY, PImage idleImage, PImage carryingImage) {
    this.x = startX;
    this.y = startY;
    this.idleImage = idleImage;
    this.carryingImage = carryingImage;
  }

  void update(boolean up, boolean down, boolean left, boolean right) {
    float dx = 0;
    float dy = 0;

    if (up) dy -= 1;
    if (down) dy += 1;
    if (left) dx -= 1;
    if (right) dx += 1;

    if (dx != 0 || dy != 0) {
      float magnitude = sqrt(dx * dx + dy * dy);
      x += (dx / magnitude) * speed;
      y += (dy / magnitude) * speed;
    }

    x = constrain(x, size / 2, width - size / 2);
    y = constrain(y, 72, height - size / 2);
  }

  void display(boolean invincible) {
    if (invincible && frameCount % 12 < 6) {
      return;
    }

    pushMatrix();
    translate(x, y);

    // Small tilt adds a visible transformation requirement and movement feel.
    float tilt = 0;
    if (left) tilt = -0.18f;
    if (right) tilt = 0.18f;
    rotate(tilt);

    imageMode(CENTER);
    image(frameCount % 30 < 15 ? idleImage : carryingImage, 0, 0, size, size);
    imageMode(CORNER);
    popMatrix();
  }

  void resetPosition() {
    x = width / 2;
    y = height - 90;
  }
}

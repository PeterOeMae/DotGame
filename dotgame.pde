// HerdDash / DotGame
// Coding Camp II Project 1 rescue build
// Interactive Processing arcade game using classes, ArrayLists, and transformations.

PImage playerImage1, playerImage2, cowImage, farmerImage;

Player player;
Cow cow;
ArrayList<Farmer> farmers = new ArrayList<Farmer>();
ArrayList<Star> stars = new ArrayList<Star>();
ArrayList<FloatingText> floatingTexts = new ArrayList<FloatingText>();

boolean up, down, left, right;

int score = 0;
int lives = 3;
int level = 1;
int gameState = 0; // 0 = start, 1 = playing, 2 = game over
int nextFarmerSpawnFrame = 0;
int invincibleUntilFrame = 0;

final int STARTING_FARMERS = 2;
final int MAX_FARMERS = 18;
final int ROUND_SECONDS = 90;
int gameStartMillis = 0;

void setup() {
  size(900, 600);
  smooth();

  // Load image assets once. The original version loaded these every frame.
  playerImage1 = loadImage("player1.png");
  playerImage2 = loadImage("player2.png");
  cowImage = loadImage("cow.png");
  farmerImage = loadImage("farmer.png");

  for (int i = 0; i < 120; i++) {
    stars.add(new Star());
  }

  resetGame();
}

void draw() {
  drawBackground();

  if (gameState == 0) {
    drawStartScreen();
    return;
  }

  if (gameState == 1) {
    updateGame();
    drawGame();
    drawHud();
    return;
  }

  drawGame();
  drawGameOverScreen();
}

void resetGame() {
  score = 0;
  lives = 3;
  level = 1;
  gameStartMillis = millis();
  invincibleUntilFrame = 0;
  nextFarmerSpawnFrame = frameCount + 180;

  player = new Player(width / 2, height - 90, playerImage1, playerImage2);
  cow = new Cow(cowImage);
  farmers.clear();
  floatingTexts.clear();

  for (int i = 0; i < STARTING_FARMERS; i++) {
    spawnFarmer();
  }
}

void updateGame() {
  player.update(up, down, left, right);
  cow.update();

  int secondsLeft = max(0, ROUND_SECONDS - ((millis() - gameStartMillis) / 1000));
  level = 1 + score / 200 + (ROUND_SECONDS - secondsLeft) / 30;

  if (frameCount >= nextFarmerSpawnFrame && farmers.size() < MAX_FARMERS) {
    spawnFarmer();
    nextFarmerSpawnFrame = frameCount + max(70, 220 - level * 18);
  }

  for (int i = farmers.size() - 1; i >= 0; i--) {
    Farmer farmer = farmers.get(i);
    farmer.update(level);

    if (farmer.hits(player) && frameCount > invincibleUntilFrame) {
      lives--;
      invincibleUntilFrame = frameCount + 90;
      floatingTexts.add(new FloatingText("-1 life", player.x, player.y - 25, color(230, 45, 45)));
      farmer.respawnAwayFrom(player.x, player.y);
      player.resetPosition();

      if (lives <= 0) {
        gameState = 2;
      }
    }
  }

  if (cow.hits(player)) {
    int gained = 25 * max(1, level);
    score += gained;
    floatingTexts.add(new FloatingText("+" + gained, cow.x, cow.y, color(20, 145, 65)));
    cow.respawnAwayFrom(player.x, player.y);
  }

  for (int i = floatingTexts.size() - 1; i >= 0; i--) {
    FloatingText ft = floatingTexts.get(i);
    ft.update();
    if (ft.finished()) {
      floatingTexts.remove(i);
    }
  }

  if (secondsLeft <= 0) {
    gameState = 2;
  }
}

void drawGame() {
  cow.display();

  for (Farmer farmer : farmers) {
    farmer.display();
  }

  boolean invincible = frameCount < invincibleUntilFrame;
  player.display(invincible);

  for (FloatingText ft : floatingTexts) {
    ft.display();
  }
}

void drawBackground() {
  background(245, 250, 242);

  // Soft field/grid gives movement context without needing more assets.
  stroke(220, 235, 215);
  for (int y = 60; y < height; y += 60) {
    line(0, y, width, y);
  }

  noStroke();
  for (Star star : stars) {
    star.update();
    star.display();
  }
}

void drawHud() {
  int secondsLeft = max(0, ROUND_SECONDS - ((millis() - gameStartMillis) / 1000));

  fill(20, 32, 45, 220);
  rect(0, 0, width, 56);

  fill(255);
  textSize(20);
  textAlign(LEFT, CENTER);
  text("Lives: " + lives, 20, 28);
  text("Level: " + level, 150, 28);
  text("Farmers: " + farmers.size(), 270, 28);

  textAlign(RIGHT, CENTER);
  text("Score: " + score, width - 20, 28);
  textAlign(CENTER, CENTER);
  text("Time: " + secondsLeft + "s", width / 2, 28);
}

void drawStartScreen() {
  fill(0, 125);
  rect(0, 0, width, height);

  fill(255);
  textAlign(CENTER, CENTER);
  textSize(46);
  text("HerdDash", width / 2, height / 2 - 105);

  textSize(20);
  text("Collect cows. Avoid farmers. Survive 90 seconds.", width / 2, height / 2 - 50);
  text("Arrow keys or WASD to move", width / 2, height / 2 - 18);
  text("Difficulty rises with score and time", width / 2, height / 2 + 14);

  textSize(24);
  text("Press SPACE to start", width / 2, height / 2 + 75);
}

void drawGameOverScreen() {
  fill(0, 170);
  rect(0, 0, width, height);

  fill(255);
  textAlign(CENTER, CENTER);
  textSize(42);
  text("Game Over", width / 2, height / 2 - 50);

  textSize(24);
  text("Final score: " + score, width / 2, height / 2);
  text("Press SPACE to restart", width / 2, height / 2 + 55);
}

void spawnFarmer() {
  Farmer farmer = new Farmer(farmerImage);
  farmer.respawnAwayFrom(player == null ? width / 2 : player.x, player == null ? height / 2 : player.y);
  farmers.add(farmer);
}

void keyPressed() {
  if (keyCode == UP || key == 'w' || key == 'W') up = true;
  if (keyCode == DOWN || key == 's' || key == 'S') down = true;
  if (keyCode == LEFT || key == 'a' || key == 'A') left = true;
  if (keyCode == RIGHT || key == 'd' || key == 'D') right = true;

  if (key == ' ') {
    if (gameState == 0 || gameState == 2) {
      resetGame();
      gameState = 1;
    }
  }
}

void keyReleased() {
  if (keyCode == UP || key == 'w' || key == 'W') up = false;
  if (keyCode == DOWN || key == 's' || key == 'S') down = false;
  if (keyCode == LEFT || key == 'a' || key == 'A') left = false;
  if (keyCode == RIGHT || key == 'd' || key == 'D') right = false;
}

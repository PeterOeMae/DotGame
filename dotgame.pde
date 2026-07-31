float playerX = 300;
float playerY = 200;
float playerSize = 30;
float playerSpeed = 4;

float blueX;
float blueY;

int points = 0;
int lives = 3;

boolean up;
boolean down;
boolean left;
boolean right;

int maxRedBalls = 20;
int numberOfRedBalls = 1;
int spawnCounter = 0;

float[] redX = new float[maxRedBalls];
float[] redY = new float[maxRedBalls];
float[] redDirectionX = new float[maxRedBalls];
float[] redDirectionY = new float[maxRedBalls];

float redSpeed = 2;

void setup() {
  size(600, 400);

  moveBlueDot();
  createRedBall(0);
}

void draw() {
  background(255);

  movePlayer();
  spawnRedBall();
  moveRedBalls();
  checkCollisions();

  // Blue dot
  fill(0, 100, 255);
  circle(blueX, blueY, 20);

  // Red balls
  fill(255, 0, 0);

  for (int i = 0; i < numberOfRedBalls; i++) {
    circle(redX[i], redY[i], 20);
  }

  // Player
  fill(50);
  rect(playerX, playerY, playerSize, playerSize);

  // Lives counter
  fill(0);
  textSize(20);
  textAlign(LEFT);
  text("Lives: " + lives, 15, 30);

  // Points counter
  textAlign(RIGHT);
  text("Points: " + points, width - 15, 30);

  if (lives <= 0) {
    background(0);

    fill(255);
    textAlign(CENTER);
    textSize(32);
    text("Game Over", width / 2, height / 2);

    textSize(20);
    text("Points: " + points, width / 2, height / 2 + 40);

    noLoop();
  }
}

void spawnRedBall() {
  spawnCounter++;

  // 300 frames is about 5 seconds at 60 FPS
  if (spawnCounter >= 300 && numberOfRedBalls < maxRedBalls) {
    createRedBall(numberOfRedBalls);
    numberOfRedBalls++;
    spawnCounter = 0;
  }
}

void createRedBall(int ballNumber) {
  redX[ballNumber] = random(width);
  redY[ballNumber] = random(50, height);

  float angle = random(TWO_PI);

  redDirectionX[ballNumber] = cos(angle);
  redDirectionY[ballNumber] = sin(angle);
}

void moveRedBalls() {
  for (int i = 0; i < numberOfRedBalls; i++) {
    redX[i] += redDirectionX[i] * redSpeed;
    redY[i] += redDirectionY[i] * redSpeed;

    // Red ball wraps around the screen
    if (redX[i] > width + 10) {
      redX[i] = -10;
    }

    if (redX[i] < -10) {
      redX[i] = width + 10;
    }

    if (redY[i] > height + 10) {
      redY[i] = -10;
    }

    if (redY[i] < -10) {
      redY[i] = height + 10;
    }
  }
}

void checkCollisions() {
  float playerCenterX = playerX + playerSize / 2;
  float playerCenterY = playerY + playerSize / 2;

  // Collision with blue dot
  if (dist(playerCenterX, playerCenterY, blueX, blueY) < 25) {
    points += 25*numberOfRedBalls;
    moveBlueDot();
  }

  // Collision with red balls
  for (int i = 0; i < numberOfRedBalls; i++) {
    if (dist(playerCenterX, playerCenterY, redX[i], redY[i]) < 25) {
      lives--;

      createRedBall(i);

      // Move player away after being hit
      playerX = width / 2;
      playerY = height / 2;

      break;
    }
  }
}

void moveBlueDot() {
  blueX = random(20, width - 20);
  blueY = random(50, height - 20);
}

void keyPressed() {
  if (keyCode == UP) {
    up = true;
  }

  if (keyCode == DOWN) {
    down = true;
  }

  if (keyCode == LEFT) {
    left = true;
  }

  if (keyCode == RIGHT) {
    right = true;
  }
}

void keyReleased() {
  if (keyCode == UP) {
    up = false;
  }

  if (keyCode == DOWN) {
    down = false;
  }

  if (keyCode == LEFT) {
    left = false;
  }

  if (keyCode == RIGHT) {
    right = false;
  }
}

void movePlayer() {
  if (up) {
    playerY -= playerSpeed;
  }

  if (down) {
    playerY += playerSpeed;
  }

  if (left) {
    playerX -= playerSpeed;
  }

  if (right) {
    playerX += playerSpeed;
  }

  // Player wraps around the screen
  if (playerX > width) {
    playerX = -playerSize;
  }

  if (playerX + playerSize < 0) {
    playerX = width;
  }

  if (playerY > height) {
    playerY = -playerSize;
  }

  if (playerY + playerSize < 0) {
    playerY = height;
  }
}

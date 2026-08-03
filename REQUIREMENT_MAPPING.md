# Requirement Mapping - HerdDash / DotGame

This file maps the project to the visible Coding Camp II Project 1 requirements from the screenshots.

## 1. Interactive game in Processing

**Evidence:** `dotgame.pde`

- Processing sketch with `setup()` and `draw()` loop.
- Player-controlled movement using arrow keys and W/A/S/D.
- Real-time score/lives/timer updates.
- Collision detection between player, cows, and farmers.

## 2. At least 3 classes

The project has five classes:

1. `Player` - movement, boundary checks, sprite display
2. `Cow` - collectible target, respawn behavior, animated display
3. `Farmer` - hazard movement, collision, respawn, rotation
4. `Star` - animated background object
5. `FloatingText` - temporary feedback text for scoring/life loss

## 3. Arrays / ArrayLists

**Evidence:** `dotgame.pde`

```java
ArrayList<Farmer> farmers = new ArrayList<Farmer>();
ArrayList<Star> stars = new ArrayList<Star>();
ArrayList<FloatingText> floatingTexts = new ArrayList<FloatingText>();
```

The game uses these lists to dynamically manage multiple moving hazards, background elements, and temporary feedback messages.

## 4. Transformations

The game uses Processing transformations to render objects around their centers and animate them:

- `pushMatrix()`
- `translate()`
- `rotate()`
- `scale()`
- `popMatrix()`

**Evidence:**

- `Player.pde`: player is translated to center and slightly rotated based on movement direction.
- `Cow.pde`: cow is translated and gently scaled/bobbed.
- `Farmer.pde`: farmer sprites are translated and rotated while moving.

## 5. Images / graphics

**Evidence:**

- `player1.png`
- `player2.png`
- `cow.png`
- `farmer.png`

The game uses custom sprites for the player, collectible cow, and farmer hazards.

## 6. Game states and polish

**Evidence:** `dotgame.pde`

The game now includes:

- Start screen
- Active gameplay state
- Game-over screen
- Restart flow
- HUD with lives, level, farmer count, timer, and score
- Floating feedback text
- Difficulty progression

## 7. Collaboration/process evidence to submit

Recommended evidence bundle:

- GitHub repo link
- GitHub commit history screenshots or link
- Yellowdig post link and screenshots
- Team discussion screenshots
- Final gameplay screenshot
- This requirement mapping file
- Project report/manual PDF or Markdown

# Run HerdDash Locally and Test

## Option 1: easiest route using the submission zip

1. Download `dotgame-submission-2026-08-03.zip`.
2. Extract it.
3. Open the extracted `dotgame` folder.
4. Open `dotgame.pde` in Processing 4.x.
5. Press **Run**.

## Option 2: test directly from GitHub PR branch

```bash
git clone https://github.com/KingOrchiz/DotGame.git
cd DotGame
git checkout herddash-project1-upgrade
```

Then open `dotgame.pde` in Processing 4.x and press **Run**.

If Processing complains about the sketch folder name, rename the folder to `dotgame` or use the submission zip, which already uses the correct folder structure.

## What to test

### Start screen

Expected:

- Title shows **HerdDash**.
- Instructions explain collecting cows, avoiding farmers, surviving 90 seconds.
- Spacebar starts the game.

### Player movement

Expected:

- Arrow keys move the player.
- W/A/S/D also move the player.
- Player stays inside the play area.

### Scoring

Expected:

- Touching a cow increases score.
- Floating `+25` or similar feedback appears.
- Cow respawns somewhere else.

### Farmer collision

Expected:

- Touching a farmer reduces lives.
- Player resets near the bottom center.
- A short invincibility blink prevents immediate repeated hits.

### HUD and difficulty

Expected:

- HUD shows lives, level, farmer count, time, and score.
- Timer counts down from 90 seconds.
- More farmers appear over time or as difficulty increases.

### Game over and restart

Expected:

- Game ends when lives reach zero or timer reaches zero.
- Game-over screen shows final score.
- Spacebar restarts the game.

## Files to review

- `dotgame.pde`: main setup, draw loop, game states, HUD, controls
- `Player.pde`: player movement and display
- `Cow.pde`: collectible cow behavior
- `Farmer.pde`: hazard movement and collision
- `Star.pde`: animated background
- `FloatingText.pde`: score/life feedback
- `README.md`: setup and requirement mapping summary
- `REQUIREMENT_MAPPING.md`: explicit rubric mapping
- `TEST_EVIDENCE.md`: validation summary

## PR link

https://github.com/PeterOeMae/DotGame/pull/1

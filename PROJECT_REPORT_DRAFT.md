# Coding Camp II Project 1 Report Draft - HerdDash / DotGame

## 1. Project overview

**Project name:** HerdDash / DotGame  
**Course:** Coding Camp II: Interactivity  
**Tool:** Processing 4.x  
**Team:** Oche Eluma and Peter Maegaard

HerdDash is an interactive arcade-style Processing game. The player moves around a field, collects cows for points, and avoids farmers. The game uses score, lives, a countdown timer, and increasing difficulty to create a complete gameplay loop.


## 2. Collaboration narrative: how we selected the game

At the start of the project, we discussed more than one possible game direction. Oche initially suggested an arcade-style **Asteroid Defender** game where a player controls a spaceship, shoots falling meteorites, and manages score, lives, and difficulty. This idea would have worked well with classes such as `Spaceship`, `Bullet`, and `Meteorite`.

Peter had already made progress on a different Processing prototype called **DotGame**. His prototype evolved from simple dots/shapes into a cow/farmer game where the player collects cows while avoiding farmers. Peter also added image assets, used AI-supported graphics, fixed errors, and pushed the game to GitHub.

Because Peter already had a working game, assets, and GitHub progress, we decided to build on his prototype instead of restarting from scratch. This decision helped us preserve progress and gave the team a more realistic path to completing the submission on time.

The final direction is to evolve **DotGame** into **HerdDash**. The original repo name shows the prototype stage, while HerdDash better describes the final game identity: collecting/herding cows while quickly avoiding farmers.

The work therefore shifted from starting a new game to improving Peter's existing game so it clearly satisfies the Project 1 rubric. The main improvements are class structure, ArrayLists, transformations, gameplay polish, documentation, screenshots, and collaboration evidence.

## 3. Game objective

The objective is to collect as many cows as possible within 90 seconds while avoiding farmers. Each cow collected increases the score. Farmers move around the screen and cause the player to lose a life on collision. The game ends when the player runs out of lives or the timer reaches zero.

## 4. Controls and interaction

- Arrow keys or W/A/S/D move the player.
- Space starts or restarts the game.
- The player receives immediate visual feedback through score changes, floating text, lives, timer, and game-over state.

## 5. Technical implementation

The sketch is implemented in Processing and split into multiple `.pde` files for clarity:

- `dotgame.pde`: main game state, setup, draw loop, HUD, controls, spawning, collision flow
- `Player.pde`: player movement and rendering
- `Cow.pde`: collectible target behavior and rendering
- `Farmer.pde`: enemy/hazard behavior and rendering
- `Star.pde`: animated background element
- `FloatingText.pde`: visual feedback after scoring or losing a life

## 6. Requirement mapping

### At least 3 classes

The project includes five classes:

1. `Player`
2. `Cow`
3. `Farmer`
4. `Star`
5. `FloatingText`

### Arrays / ArrayLists

The project uses ArrayLists to manage dynamic game objects:

- `ArrayList<Farmer> farmers`
- `ArrayList<Star> stars`
- `ArrayList<FloatingText> floatingTexts`

This allows the game to add hazards and feedback objects dynamically during runtime.

### Transformations

The project uses Processing transformations in object display methods:

- `pushMatrix()` and `popMatrix()` isolate transformations.
- `translate()` positions sprites around their object centers.
- `rotate()` animates player tilt and farmer movement.
- `scale()` creates a subtle cow animation.

These appear in `Player.pde`, `Cow.pde`, and `Farmer.pde`.

### Interactive gameplay

The player directly controls the character using keyboard input. The game responds continuously with movement, collisions, scoring, lives, timer, and changing difficulty.

## 7. Design choices

The team kept the cow/farmer idea because it was already playable and had custom assets. Rather than changing to a completely new game near submission time, the prototype was improved into a clearer, more structured Processing project. The design uses simple visuals so the mechanics and code requirements remain easy to understand.

## 8. Collaboration and process

Evidence to include in final submission:

- GitHub repository link: `https://github.com/PeterOeMae/DotGame`
- GitHub commit history showing development progress
- Yellowdig post link from Peter: `https://yellowdig.app/n/german-uds/community/6a38064b-acd5-4964-b9be-17709d03893c`
- Screenshots of team discussion and planning
- Final game screenshots
- Brief description of each team member's contribution

Suggested contribution summary:

- Peter: initial game prototype, asset updates, farmer/cow theme, GitHub upload, Yellowdig post
- Oche: project review, requirement mapping, gameplay improvement direction, report coordination, submission packaging
- AI assistant: code review, refactoring suggestions, documentation draft, requirement mapping support

## 9. AI usage disclosure

AI was used as a support tool to review the prototype, identify gaps against the assignment requirements, propose improvements, refactor code structure, and draft documentation. The team remains responsible for reviewing, testing, understanding, and submitting the final work.

## 10. Testing performed

- Confirmed the sketch compiles in a local Java/Processing-core validation setup.
- Smoke-tested the game under a virtual display.
- Captured a runtime screenshot showing HUD, player, cow, farmers, timer, level, score, and lives.


## 11. Planned pull request / update summary

The proposed pull request should describe the change as an evolution from the initial DotGame prototype into HerdDash. The key updates are:

- Rename/present the game as HerdDash while preserving Peter's original cow/farmer concept.
- Split the sketch into multiple classes: `Player`, `Cow`, `Farmer`, `Star`, and `FloatingText`.
- Use `ArrayList`s for farmers, background elements, and floating feedback text.
- Add Processing transformations in object rendering.
- Add start/game-over screens, timer, levels, HUD, restart flow, and better collision feedback.
- Move image loading from `draw()` to `setup()`.
- Add README, requirement mapping, test evidence, screenshots, collaboration narrative, and AI usage disclosure.

## 12. Known limitations and future improvements

- The game currently uses keyboard input. A future version could add webcam color tracking or microphone input to align even more strongly with broader interactivity themes.
- More sound effects and animations could improve game feel.
- More levels, obstacles, and win conditions could make the game richer.
- A high-score table could improve replayability.

## 13. Conclusion

HerdDash demonstrates an interactive Processing game with multiple classes, dynamic object lists, transformations, sprite graphics, collision detection, scoring, lives, timer, and a complete start-to-game-over flow. The refactor improves both gameplay quality and alignment with the Project 1 coding requirements.

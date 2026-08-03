# HerdDash (DotGame)

A small arcade game built in **Processing** for **Coding Camp II: Interactivity, Project 1**.

The player herds cows while avoiding farmers. The goal is to score as many points as possible before time runs out or lives reach zero.

## Game concept

You control the player character in a field. Cows appear at random positions. Touching a cow earns points. Farmers move around the field as hazards. If a farmer touches the player, the player loses a life and briefly becomes invincible. The game becomes harder as score and time increase.

## Controls

- Arrow keys or `W/A/S/D`: move
- `Space`: start or restart the game

## Features

- Start screen, gameplay screen, HUD, and game-over screen
- Score, lives, level, timer, and hazard count
- Moving hazards with increasing difficulty
- Collision detection for cows and farmers
- Floating score/life feedback text
- Sprite assets created for the project
- Uses Processing transformations for animated/dynamic rendering

## Coding Camp II requirement mapping

| Requirement | Where it is shown |
|---|---|
| Interactive game | Player movement via keyboard, real-time collision and score/life feedback |
| At least 3 classes | `Player`, `Cow`, `Farmer`, `Star`, `FloatingText` |
| Arrays / ArrayLists | `ArrayList<Farmer>`, `ArrayList<Star>`, `ArrayList<FloatingText>` in `dotgame.pde` |
| Transformations | `pushMatrix()`, `translate()`, `rotate()`, `scale()`, `popMatrix()` in `Player.pde`, `Cow.pde`, and `Farmer.pde` |
| Images/graphics | `player1.png`, `player2.png`, `cow.png`, `farmer.png` |
| Progress/collaboration evidence | GitHub commit history, Yellowdig posts, and team report/reflection |

## File structure

- `dotgame.pde` - main game loop, state management, HUD, controls
- `Player.pde` - player movement and display
- `Cow.pde` - collectible cow behavior
- `Farmer.pde` - moving farmer hazards
- `Star.pde` - animated background elements
- `FloatingText.pde` - temporary feedback text after collisions
- `player1.png`, `player2.png`, `cow.png`, `farmer.png` - game sprites

## How to run

1. Install Processing 4.x.
2. Download or clone this repository.
3. Open the sketch folder in Processing.
4. Open `dotgame.pde`.
5. Press **Run**.

## Notes on development

The original prototype used global variables and arrays to move one cow and multiple farmers. The updated version keeps the same core idea but reorganizes the code into classes, adds screens and a stronger game loop, and makes the assignment requirements easier to verify.

## AI usage disclosure

AI support was used as a coding and review assistant to:

- Review the original game against the Project 1 requirements
- Suggest improvements to structure and gameplay
- Help refactor the sketch into classes
- Draft documentation and requirement mapping

All code should still be reviewed and tested by the team before final submission.

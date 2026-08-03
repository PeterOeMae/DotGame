# Collaboration Narrative - How We Settled on HerdDash

## Starting point

At the beginning of Project 1, we discussed possible game ideas that would satisfy the Coding Camp II requirements for an interactive Processing game. The main criteria we wanted to satisfy were:

- A working interactive game in Processing
- At least three classes
- Arrays or ArrayLists
- Transformations such as `pushMatrix()`, `translate()`, `rotate()`, and `popMatrix()`
- Clear evidence of progress, collaboration, and reflection

## Initial game ideas

Oche initially suggested building an arcade-style game similar to **Asteroid Defender**, where a player controls a spaceship, shoots falling asteroids, tracks score/lives, and uses classes such as `Spaceship`, `Bullet`, and `Meteorite`.

Peter had already made progress on a different prototype called **DotGame**. His prototype had evolved from simple dots/shapes into a game where a UFO/player collects cows and avoids farmers. He had also added image assets, created AI-supported graphics, fixed several errors, and pushed the updated files to GitHub.

## Decision to use Peter's prototype

Because Peter had already made tangible progress, including a working repo and custom game assets, we decided it was better to build on his existing work rather than restart from scratch. This decision helped us preserve progress and gave us a stronger base for meeting the deadline.

The plan became:

1. Keep Peter's cow/farmer game as the foundation.
2. Rename and evolve it from **DotGame** into **HerdDash**.
3. Refactor the code so the assignment requirements are easier to verify.
4. Improve gameplay polish with a start screen, HUD, timer, levels, collision feedback, and game-over/restart flow.
5. Document the work clearly with a README, report, requirement mapping, screenshots, GitHub evidence, Yellowdig posts, and AI usage disclosure.

## Why the name HerdDash

The original repository name, **DotGame**, reflected the early prototype stage, when the game was closer to dots and simple objects. As the game evolved into a cow-herding theme, a more descriptive name became useful.

**HerdDash** captures the current game concept:

- “Herd” refers to collecting/herding cows.
- “Dash” reflects fast arcade movement and avoiding farmers.
- The name is short, memorable, and better aligned with the final game identity.

## Planned evolution from DotGame to HerdDash

The planned update keeps Peter's concept and assets but strengthens the implementation:

- Move image loading from `draw()` to `setup()` for better performance.
- Split the code into multiple classes: `Player`, `Cow`, `Farmer`, `Star`, and `FloatingText`.
- Replace simple arrays/global state with `ArrayList`s for dynamic game objects.
- Add Processing transformations in object rendering.
- Add a start screen and game-over screen.
- Add a 90-second timer, levels, farmer count, score, and lives HUD.
- Add floating feedback text when the player scores or loses a life.
- Add clearer documentation and requirement mapping.

## Collaboration evidence to attach or reference

- GitHub repository: `https://github.com/PeterOeMae/DotGame`
- Yellowdig post from Peter: `https://yellowdig.app/n/german-uds/community/6a38064b-acd5-4964-b9be-17709d03893c`
- Screenshots of the chat where both ideas were discussed
- Screenshots of the game running
- Commit history showing the original prototype and later improvements
- Final report/manual with contribution log and AI usage disclosure

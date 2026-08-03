# Test Evidence - HerdDash / DotGame

Date: 2026-08-03

## Environment used for validation

- Host: OpenClaw workspace server
- Java: local workspace-only JDK 17
- Processing validation: Processing core library
- Display: Xvfb virtual display for headless smoke test

## Validation performed

1. Compiled the Processing sketch through a Java wrapper for headless validation.
2. Smoke-ran the game for 12 seconds under Xvfb.
3. Generated and visually inspected three screenshots:
   - `screenshots/herddash-01-start.png`
   - `screenshots/herddash-02-gameplay.png`
   - `screenshots/herddash-03-gameover.png`
4. Confirmed the visible screens include:
   - Start/title/instructions screen
   - Active gameplay with HUD, cows, farmers, score/lives/timer/level
   - Game-over screen with final score and restart instruction

## Results

- Compile result: passed
- Runtime smoke test: passed, exited only because of deliberate timeout
- Screenshot generation: passed
- Visual screenshot inspection: passed

## Notes

Processing PDE sketches are normally run inside the Processing IDE. The local validation used a Java wrapper to approximate Processing behavior in a headless environment. The actual submission should still be opened and run in Processing 4.x before final upload if a desktop Processing environment is available.

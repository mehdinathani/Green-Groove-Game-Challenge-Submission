import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart' hide Route;

import '../main.dart';

class GameOverScreen extends Component
    with HasGameRef<GreenGroove>, TapCallbacks {
  @override
  void onLoad() async {
    await super.onLoad();

    add(
      TextComponent(
        text: 'GAME OVER',
        anchor: Anchor.center,
        position: gameRef.size / 2,
        textRenderer:
            TextPaint(style: const TextStyle(fontSize: 64, color: Colors.red)),
      ),
    );
  }

  @override
  void update(double dt) {
    if (gameRef.elapsedTime.isRunning) {
      gameRef.elapsedTime.reset();
      gameRef.elapsedTime.stop();
    }
    super.update(dt);
  }

  @override
  bool containsLocalPoint(Vector2 point) => true;

  @override
  void onTapUp(TapUpEvent event) {
    gameRef.boy.position = Vector2(100, 180);
    gameRef.showingGameOverScreen = false;
    gameRef.gameOver = false;
    // gameRef.gravity = Vector2(0, 30);
    gameRef.router.pop();
    gameRef.elapsedTime.start();
    super.onTapUp(event);
  }
}

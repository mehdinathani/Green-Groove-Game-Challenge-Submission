import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:greengroovechallenge/main.dart';
import 'package:greengroovechallenge/sprites/player.dart';

class Coins extends SpriteAnimationComponent
    with HasGameRef<GreenGroove>, CollisionCallbacks {
  Coins() : super() {
    // debugMode = true;
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    final images = await Future.wait([
      for (int i = 1; i < 3; i++)
        Flame.images.load('Bronze_${i.toString().padLeft(1, '1')}.png'),
    ]);
    final coinSprites = images.map((image) => Sprite(image)).toList();

    animation = SpriteAnimation.spriteList(coinSprites, stepTime: 0.25);

    size = Vector2(gameRef.size.y * 800 / 469, gameRef.size.y) * .05;
    position = Vector2(gameRef.size.x * .95, gameRef.size.y / 2 * 0.8);
    add(
      CircleHitbox(
          anchor: Anchor.center, radius: size.y * .35, position: size / 2),
    );
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (!gameRef.gameOver) {
      x -= 100 * dt;
    } else if (gameRef.gameOver) {
      // gameRef.router.pushNamed("gameover");
    }
  }

  @override
  Future<void> onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) async {
    if (other is Boy) {
      removeFromParent();

      gameRef.coinCount++;
      debugPrint("${gameRef.coinCount} Coin");

      // gameRef.gameOver = true;
      game.showQuestionSheet();
      // Show the question dialog
    }
    super.onCollisionStart(intersectionPoints, other);
  }
}

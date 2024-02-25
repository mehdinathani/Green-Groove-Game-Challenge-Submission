import 'dart:async';
import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:greengroovechallenge/main.dart';
import 'package:greengroovechallenge/sprites/player.dart';

class DevilsProducts extends SpriteAnimationComponent
    with HasGameRef<GreenGroove>, CollisionCallbacks {
  DevilsProducts() : super();
  @override
  Future<FutureOr<void>> onLoad() async {
    await super.onLoad();
    final images = await Future.wait([
      for (int i = 1; i < 25; i++)
        Flame.images.load('dp${i.toString().padLeft(3, '0')}.png'),
      // Flame.images.load('kitkat.png'),
      // Flame.images.load('starbucksdrink.png'),
      // Flame.images.load('nescafecoffee.png'),
    ]);
    final devilsrandomSprites = images.map((image) => Sprite(image)).toList();

    // Initially set a random image
    animation = SpriteAnimation.spriteList(
        [devilsrandomSprites[Random().nextInt(devilsrandomSprites.length)]],
        stepTime: 0.25);
    size = Vector2(gameRef.size.x * 0.08, gameRef.size.x * 0.07);
    //Vector2(gameRef.size.y * 800 / 469, gameRef.size.y) * .05;
    position = Vector2(gameRef.size.x * .95, gameRef.size.y / 2 * 0.6);
    add(
      CircleHitbox(
          anchor: Anchor.center, radius: size.y * .35, position: size / 2),
    );
    void changeImage() {
      animation = SpriteAnimation.spriteList(
        [devilsrandomSprites[Random().nextInt(devilsrandomSprites.length)]],
        stepTime: 0.25,
      );
    }
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

      debugPrint("${gameRef.devilsProductEat} Devils Products Eat");

      game.eatDevilsProduct();
    }
    super.onCollisionStart(intersectionPoints, other);
  }
}

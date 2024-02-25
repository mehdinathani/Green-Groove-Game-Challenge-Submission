import 'dart:async';
import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:greengroovechallenge/main.dart';
import 'package:greengroovechallenge/sprites/bird.dart';
import 'package:greengroovechallenge/sprites/tree.dart';

class WeaponAxe extends SpriteComponent
    with HasGameRef<GreenGroove>, CollisionCallbacks {
  WeaponAxe() : super() {
    // debugMode = true;
  }
  final _random = Random();
  @override
  Future<FutureOr<void>> onLoad() async {
    await super.onLoad();
    sprite = await gameRef.loadSprite('Battleaxe01.png');
    angle =
        4.3161263275272; //11 * pi / 12; // Equivalent to ~82.5 degrees clockwise
    // flipHorizontallyAroundCenter();
    size = Vector2(gameRef.size.y * 600 / 469, gameRef.size.y * 3) * .03;

    // double yPosition = _random.nextDouble() * game.size.y;
    // Set the initial position at the top-left corner
    position = gameRef.boy.position.clone();
    // Vector2(0, gameRef.size.y * 0.1);

    add(
      CircleHitbox(
          anchor: Anchor.center, radius: size.y * .35, position: size / 2),
    );
  }

  @override
  void update(double dt) {
    super.update(dt);
    // Move towards bottom-left corner
    x += gameRef.size.y * dt * 0.5;
    // Rotate the weapon as it moves
    angle += 3 *
        dt; // Adjust the rotation speed // Decrease y value for downward path
    // y += 50 * dt; // Adjust this value for subtle downward curve
    // Remove if it goes off-screen to the left or bottom
    if (x < 0 - ((gameRef.size.y * 600 / 469) * .10) || y < 0) {
      removeFromParent();
      game.onmissileCollision();
    }
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is Bird || other is Tree) {
      removeFromParent();
      gameRef.coinCount--;
    }
    super.onCollision(intersectionPoints, other);
  }
}

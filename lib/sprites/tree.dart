import 'dart:async';
import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:greengroovechallenge/main.dart';
import 'package:greengroovechallenge/sprites/player.dart';
import 'package:greengroovechallenge/sprites/weapon_axe.dart';

class Tree extends SpriteComponent
    with HasGameRef<GreenGroove>, CollisionCallbacks {
  Tree() : super() {
    // debugMode = true;
  }
  final _random = Random();
  List<String> treeImages = [
    'tree1.png',
    'tree2.png',
    'tree3.png',
    'tree4.png',
    'tree5.png'
  ];

  @override
  Future<FutureOr<void>> onLoad() async {
    await super.onLoad();
    String randomTreeImage = treeImages[_random.nextInt(treeImages.length)];

    sprite = await gameRef.loadSprite(randomTreeImage);
    // angle =
    //     4.3161263275272; //11 * pi / 12; // Equivalent to ~82.5 degrees clockwise
    // flipHorizontallyAroundCenter();
    size = Vector2(gameRef.size.y * 3, gameRef.size.y * 3) * .10;

    // double yPosition = _random.nextDouble() * game.size.y;
    // Set initial position at the top-right corner
    position = Vector2(
        gameRef.size.x * 0.95, gameRef.size.y * 0.1); // Adjusted for top-right

    add(
      CircleHitbox(
          anchor: Anchor.center, radius: size.y * .35, position: size / 2),
    );
  }

  @override
  void update(double dt) {
    super.update(dt);

    // Move towards bottom-left corner
    x -= gameRef.size.y * dt * 0.45;
    // Decrease y value for downward path
    // y += 50 * dt; // Adjust this value for subtle downward curve
    // Remove if it goes off-screen to the left or bottom
    if (x < 0 - ((gameRef.size.y * 600 / 469) * .10) || y < 0) {
      removeFromParent();
    }
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is WeaponAxe || other is Boy) {
      gameRef.onTreeCut();
      // Check if it's not a border
      // Ignore collisions with non-border objects
      removeFromParent();
    }
    super.onCollision(intersectionPoints, other);
  }
}

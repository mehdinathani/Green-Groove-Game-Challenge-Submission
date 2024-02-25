import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:greengroovechallenge/main.dart';
import 'package:greengroovechallenge/sprites/player.dart';
import 'package:greengroovechallenge/sprites/weapon_axe.dart';

class Bird extends SpriteAnimationComponent
    with HasGameRef<GreenGroove>, CollisionCallbacks {
  Bird() : super() {
    // debugMode = true;
  }
  Vector2? dragDeltaPosition;
  bool isTap = false;

  // bool isJumping = false;
  late double groundY; // Adjust this value based on your game's layout;
  late double upperLimit;
  late double lowerLimit;

  @override
  void onLoad() async {
    groundY = Vector2(100, gameRef.size.y / 2).y;
    upperLimit = gameRef.size.y / 2 * 1.1;
    lowerLimit = gameRef.size.y / 2 * 0.4;
    await super.onLoad();

    final images = await Future.wait([
      for (int i = 1; i < 20; i++) Flame.images.load('spr_ababil_walk ($i).png')
    ]);
    final sprites = images.map((image) => Sprite(image)).toList();
//  final coinSprites = images.map((image) => Sprite(image)).toList();

//     animation = SpriteAnimation.spriteList(coinSprites, stepTime: 0.25);
    animation = SpriteAnimation.spriteList(sprites, stepTime: 0.07);
    // Flip the animation horizontally
    flipHorizontally();

    animation = animation;
    // Set random initial y position
    Random random = Random();
    position = Vector2(gameRef.size.x * 0.95,
        random.nextDouble() * (gameRef.size.y - size.y)); // Random y position
    size = Vector2(75, 100); // Set the size of the animation
    add(RectangleHitbox.relative(Vector2(.8, .9), parentSize: size));
  }

  @override
  void update(double dt) {
    super.update(dt);
    // Slow down the bird's x movement
    x -= (gameRef.size.y * dt) *
        0.8; // Adjust the multiplier to control the speed
    // Decrease y value for downward path
    // y += 50 * dt; // Adjust this value for subtle downward curve
    // Remove if it goes off-screen to the left or bottom
    if (x < 0 - ((gameRef.size.y * 600 / 469) * .10) || y < 0) {
      removeFromParent();
      //apply gravity if the Bird is jumping
      // if (isJumping) {
      //   position.y += 200 * dt;

      //   if (position.y >= groundY) {
      //     isJumping = false;
      //     position.y = groundY;
      //   }
      // }

      // if (isTap) {
      //   if (!isJumping) {
      //     position.y += gameRef.jump.y;

      //     isJumping = true;
      //   }
      //   isTap = false;
      // }
    }

    // @override
    // void onDragUpdate(DragUpdateEvent event) {
    //   // Extract the desired Y movement from the delta
    //   double yDelta = event.delta.y;

    //   // Update the Y position based on the yDelta
    //   position.y += yDelta;

    //   // Ensure the Bird stays within the vertical bounds
    //   position.y = position.y.clamp(lowerLimit, upperLimit);

    //   super.onDragUpdate(event);
    // }
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is WeaponAxe || other is Boy) {
      // Check if it's not a border
      // Ignore collisions with non-border objects
      gameRef.onmissileCollision();
      removeFromParent();
    }
    super.onCollision(intersectionPoints, other);
  }
}

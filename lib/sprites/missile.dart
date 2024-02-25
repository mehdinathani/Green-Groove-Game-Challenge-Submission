// import 'dart:async';
// import 'dart:math';

// import 'package:flame/collisions.dart';
// import 'package:flame/components.dart';
// import 'package:greengroovechallenge/main.dart';

// class Missile extends SpriteComponent
//     with HasGameRef<GreenGroove>, CollisionCallbacks {
//   Missile() : super() {
//     // debugMode = true;
//   }
//   final _random = Random();
//   @override
//   Future<FutureOr<void>> onLoad() async {
//     await super.onLoad();
//     sprite = await gameRef.loadSprite('Missile02D.png');
//     angle =
//         4.3161263275272; //11 * pi / 12; // Equivalent to ~82.5 degrees clockwise
//     flipHorizontallyAroundCenter();
//     size = Vector2(gameRef.size.y * 600 / 469, gameRef.size.y * 3) * .10;

//     // double yPosition = _random.nextDouble() * game.size.y;
//     // Set initial position at the top-right corner
//     position = Vector2(
//         gameRef.size.x * 0.95, gameRef.size.y * 0.01); // Adjusted for top-right

//     add(
//       CircleHitbox(
//           anchor: Anchor.center, radius: size.y * .35, position: size / 2),
//     );
//   }

//   @override
//   void update(double dt) {
//     super.update(dt);
//     // Move towards bottom-left corner
//     x -= gameRef.size.y * dt;
//     // Decrease y value for downward path
//     y += 50 * dt; // Adjust this value for subtle downward curve
//     // Remove if it goes off-screen to the left or bottom
//     if (x < 0 - ((gameRef.size.y * 600 / 469) * .10) || y < 0) {
//       removeFromParent();
//       game.onmissileCollision();
//     }
//   }

//   // @override
//   // void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
//   //   if (other is ScreenHitbox) {
//   //     // Check if it's not a border
//   //     // Ignore collisions with non-border objects
//   //     removeFromParent();
//   //     game.onmissileCollision();
//   //   } else {
//   //     return;
//   //   }
//   //   debugPrint("Missile collision");
//   //   super.onCollision(intersectionPoints, other);
//   // }
// }

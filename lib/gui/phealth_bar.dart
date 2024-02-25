// import 'dart:async';

// import 'package:deathofevil/main.dart';
// import 'package:flame/components.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';

// class PHealthBar extends PositionComponent with HasGameRef<DeathofDevil> {
//   // final Player player;

//   PHealthBar({
//     super.position,
//     super.size,
//     super.scale,
//     super.angle,
//     super.anchor,
//     super.children,
//     super.priority,
//   });
//   @override
//   Future<FutureOr<void>> onLoad() async {
//     add(SpriteComponent(
//       sprite: await Sprite.load("hearts symbol.png"),
//       size: Vector2(100, 100),
//       position: kIsWeb
//           ? Vector2(gameRef.size.x / 2 * -1.1, gameRef.size.y / 2 * 0.0001)
//           : Vector2(gameRef.size.x * .03, gameRef.size.y / 2 * 0.2),
//     ));
//     super.onLoad();
//   }

//   @override
//   void render(Canvas canvas) {
//     // Draw the background rectangle with a border
//     canvas.drawRect(
//       Rect.fromLTWH(-2, 5, 200, 40),
//       Paint()
//         ..color = Color.fromARGB(255, 0, 0, 0) // Background color
//         ..style = PaintingStyle.stroke // Set style to stroke for border
//         ..strokeWidth = 2, // Border width
//     );

//     // Draw the health bar rectangle on top
//     canvas.drawRect(
//       Rect.fromLTWH(-2, 5, gameRef.pScore.toDouble() * 2, 40),
//       Paint()..color = gameRef.pScore <= 25 ? Colors.red : Colors.green,
//     );

//     super.render(canvas);
//   }
// }

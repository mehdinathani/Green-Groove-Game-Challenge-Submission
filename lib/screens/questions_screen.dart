// import 'package:deathofevil/main.dart';
// import 'package:flame/components.dart';
// import 'package:flame/events.dart';
// import 'package:flame/flame.dart';

// class MyCustomScreen extends Component
//     with HasGameRef<DeathofDevil>, TapCallbacks {
//   YesButton yesButton = YesButton();
//   NoButton noButton = NoButton();
//   @override
//   void onLoad() async {
//     super.onLoad();

//     // Load sprites for the buttons
//     yesButton
//       ..sprite = await Flame.assets. //loadSprite('next_button.png')
//       ..size = buttonSize
//       ..position =
//           Vector2(size[0] - buttonSize[0] - 10, size[1] - buttonSize[1] - 10);
  

//     add(
//       PositionComponent(
//         position: gameRef.size / 2,
//         size: Vector2(400, 150), // Adjust size to accommodate all buttons
//         children: [
//           SpriteComponent(
//             sprite: yesSprite,
//             position: Vector2(0, 0), // Position the first button
//             size: Vector2(130, 50), // Adjust size based on sprite dimensions
//             onTap: buttonYesPressed,
//           ),
//           SpriteComponent(
//             sprite: sureSprite,
//             position: Vector2(150, 50), // Position the second button
//             size: Vector2(120, 50), // Adjust size accordingly
//             onTap: buttonSurePressed,
//           ),
//           SpriteComponent(
//             sprite: noThanksSprite,
//             position: Vector2(290, 100), // Position the third button
//             size: Vector2(110, 50), // Adjust size accordingly
//             onTap: buttonNoThanksPressed,
//           ),
//         ],
//       ),
//     );
//   }

//   // ... buttonYesPressed, buttonSurePressed, and buttonNoThanksPressed methods
// }

// class YesButton extends SpriteComponent
//     with HasGameRef<DeathofDevil>, TapCallbacks {
//   @override
//   void onTapDown(TapDownEvent event) {
//     gameRef.router.pushNamed("gameplay");
//     super.onTapDown(event);
//   }
// }

// class NoButton extends SpriteComponent
//     with HasGameRef<DeathofDevil>, TapCallbacks {
//   @override
//   void onTapDown(TapDownEvent event) {
//     gameRef.router.pushNamed("gameplay");
//     super.onTapDown(event);
//   }
// }

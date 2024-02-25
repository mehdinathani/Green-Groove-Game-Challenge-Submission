import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:greengroovechallenge/main.dart';

class Boy extends SpriteAnimationComponent
    with HasGameRef<GreenGroove>, CollisionCallbacks {
  Boy() : super() {
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
      for (int i = 0; i < 50; i++)
        Flame.images.load('running_${i.toString().padLeft(3, '0')}.png'),
    ]);
    final sprites = images.map((image) => Sprite(image)).toList();
//  final coinSprites = images.map((image) => Sprite(image)).toList();

//     animation = SpriteAnimation.spriteList(coinSprites, stepTime: 0.25);
    animation = SpriteAnimation.spriteList(sprites, stepTime: 0.05);

    animation = animation;
    position = Vector2(100, gameRef.size.y / 2); // Adjust position as desired
    size = Vector2(75, 100); // Set the size of the animation
    add(RectangleHitbox.relative(Vector2(.8, .9), parentSize: size));
  }

  @override
  void update(double dt) {
    super.update(dt);

    //apply gravity if the boy is jumping
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

  //   // Ensure the boy stays within the vertical bounds
  //   position.y = position.y.clamp(lowerLimit, upperLimit);

  //   super.onDragUpdate(event);
  // }
}

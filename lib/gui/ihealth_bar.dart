import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:greengroovechallenge/main.dart';

class IHealthBar extends PositionComponent with HasGameRef<GreenGroove> {
  IHealthBar({
    super.position,
    super.size,
    super.scale,
    super.angle,
    super.anchor,
    super.children,
    super.priority,
  });
  // final energySymbol = SpriteComponent();
  // @override
  // Future<FutureOr<void>> onLoad() async {
  //   add(energySymbol);

  //   await energySymbol
  //       .onLoad(); // Ensure symbol loads before adjusting properties

  //   energySymbol.sprite = await Sprite.load("enegy symbol.png");
  //   energySymbol.size = Vector2(30, 30);
  //   energySymbol.anchor = Anchor.centerLeft; // Align symbol to the left
  //   energySymbol.position = Vector2(-20, 5); // Position before the health bar

  //   super.onLoad();
  // }

  @override
  void render(Canvas canvas) {
    // energySymbol.render(canvas); // Render symbol before health bar
    // // Fill energy symbol with reference color (assuming a Color object named refColor)
    // energySymbol.paint.colorFilter = const ColorFilter.mode(
    //   Colors.red,
    //   BlendMode.srcIn,
    // );
    // energySymbol.paint.colorFilter =
    //     const ColorFilter.mode(Colors.red, BlendMode.srcATop);

    // Draw the background rectangle with a border
    canvas.drawRect(
      const Rect.fromLTWH(-2, 5, 200, 30),

      Paint()
        ..color = const Color.fromARGB(255, 0, 0, 0) // Background color
        ..style = PaintingStyle.stroke // Set style to stroke for border
        ..strokeWidth = 2, // Border width
    );

    // Draw the health bar rectangle on top
    canvas.drawRect(
      Rect.fromLTWH(-2, 5, gameRef.iScore.toDouble() * 2, 30),
      Paint()..color = Colors.red,
    );

    super.render(canvas);
  }
}

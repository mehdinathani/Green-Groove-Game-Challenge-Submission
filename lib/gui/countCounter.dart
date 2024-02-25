import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class CountCounter extends TextComponent with HasGameRef<GreenGroove> {
  @override
  void onLoad() async {
    await super.onLoad();
    scale = Vector2.all(2.0);
    position = Vector2(gameRef.size.x * .03, gameRef.size.y / 2 * 0.4);
    textRenderer = TextPaint(style: const TextStyle(color: Colors.black));
  }

  @override
  void update(double dt) {
    text = "🪙 ${gameRef.coinCount}";
    super.update(dt);
  }
}

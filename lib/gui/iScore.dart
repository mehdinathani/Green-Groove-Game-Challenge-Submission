import 'package:flame/components.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class IScore extends TextComponent with HasGameRef<GreenGroove> {
  @override
  void onLoad() async {
    await super.onLoad();
    scale = Vector2.all(2);
    position = kIsWeb
        ? Vector2(gameRef.size.x * .85, gameRef.size.y / 2 * 0.06)
        : Vector2(gameRef.size.x * .74, gameRef.size.y / 2 * 0.06);
    textRenderer = TextPaint(style: const TextStyle(color: Colors.black));
  }

  @override
  void update(double dt) {
    text = "${gameRef.iScore.toString()} %";
    super.update(dt);
  }
}

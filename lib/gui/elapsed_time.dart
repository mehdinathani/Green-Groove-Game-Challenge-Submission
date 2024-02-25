import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class ElapsedTime extends TextComponent with HasGameRef<GreenGroove> {
  @override
  void onLoad() async {
    await super.onLoad();
    scale = Vector2.all(2);
    position = Vector2(gameRef.size.x * 0.4, 4);
    textRenderer = TextPaint(style: const TextStyle(color: Colors.black));
  }

  @override
  void update(double dt) {
    final Duration elapsedDuration = gameRef.elapsedTime.elapsed;
    text = formatDuration(elapsedDuration);
    super.update(dt);
  }

  String formatDuration(Duration duration) {
    final hours = duration.inHours.remainder(60);
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);
    final milliseconds = duration.inMilliseconds.remainder(1000);

    // Format milliseconds with three digits, padded with leading zeros
    // final formattedMilliseconds = milliseconds.toString().padLeft(2, '0');

    return '$hours:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}:${milliseconds.toString().padLeft(2, '0')}';
  }
}

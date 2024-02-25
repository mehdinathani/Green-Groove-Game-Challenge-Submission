import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:greengroovechallenge/main.dart';

class PlayPauseButton extends PositionComponent
    with HasGameRef<GreenGroove>, TapCallbacks {
  bool isPaused = false;

  PlayPauseButton() {
    size = Vector2(50, 50); // Adjust size as needed
    anchor = Anchor.center;
  }

  @override
  Future<void> onLoad() async {
    super.onLoad();

    @override
    void render(Canvas canvas) {
      super.render(canvas);

      final icon = isPaused ? Icons.play_arrow : Icons.pause;
      final textSpan = TextSpan(
        text: String.fromCharCode(icon.codePoint),
        style: TextStyle(
          fontSize: 30,
          color: Colors.white,
          fontFamily: icon.fontFamily,
        ),
      );
      final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      final offset = Vector2(
        (position.x - size.x / 2),
        (position.y - size.y / 2),
      );
      textPainter.paint(canvas, offset.toOffset());
    }
  }

  @override
  void onTapDown(TapDownEvent event) {
    if (isPaused) {
      gameRef.resumeEngine();
    } else {
      gameRef.pauseEngine();
    }
    isPaused = !isPaused;
    super.onTapDown(event);
  }
}

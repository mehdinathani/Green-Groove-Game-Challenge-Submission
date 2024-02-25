import 'dart:ui' as ui;
import 'dart:math';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:greengroovechallenge/main.dart';

class CircularHealthBar extends PositionComponent with HasGameRef<GreenGroove> {
  final ui.Image bglobeImage; // Add this line

  CircularHealthBar(this.bglobeImage); // Update constructor

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    final double radius = size.x / 2; // Assuming size.x and size.y are equal

    // Draw the background image
    canvas.drawImageRect(
      bglobeImage, // Use the provided image
      Rect.fromLTWH(0, 0, gameRef.size.x, gameRef.size.y), // Source rect
      Rect.fromCircle(
          center: position.toOffset(), radius: radius), // Destination rect
      Paint(),
    );

    // Calculate angle based on score
    final double startAngle = -pi / 2; // Start angle (12 o'clock position)
    final double sweepAngle = (gameRef.iScore.toDouble() / 100) *
        (2 * pi); // Sweep angle based on score

    // Draw health arc
    final Paint healthPaint = Paint()
      ..color = Colors.red // Color of the health bar
      ..strokeWidth = 20 // Adjust thickness as needed
      ..style = PaintingStyle.stroke; // Draw only the border

    canvas.drawArc(
      Rect.fromCircle(center: position.toOffset(), radius: radius),
      startAngle,
      sweepAngle,
      false,
      healthPaint,
    );

    // Draw black layer over health bar based on score
    final Paint blackPaint = Paint()
      ..color = Colors.black.withOpacity(0.5); // Black layer with opacity

    final double remainingAngle = (2 * pi) - sweepAngle;

    canvas.drawArc(
      Rect.fromCircle(center: position.toOffset(), radius: radius),
      startAngle + sweepAngle,
      remainingAngle,
      false,
      blackPaint,
    );
  }
}

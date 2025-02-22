import 'dart:math';

import 'package:flutter/material.dart';

double degToRad(double deg) => deg * (pi / 180.0);

class _CurvePainter extends CustomPainter {
  _CurvePainter({required this.center, required this.increaseInStrokeWidth});
  Offset center;
  double increaseInStrokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    var Size(height: h, width: w) = size;
    double radius = (max(h, w) / 2) * 1.2;
    double curvePaintWidth = radius * (0.1 + (0.2 * increaseInStrokeWidth));

    // Paints
    Paint firstCurvePaint =
        Paint()
          ..color = Color.fromARGB(255, 14, 150, 200)
          ..style = PaintingStyle.stroke
          ..strokeWidth = curvePaintWidth;

    Paint secCurvePaint =
        Paint()
          ..color = Color.fromARGB(255, 90, 69, 89)
          ..style = PaintingStyle.stroke
          ..strokeWidth = curvePaintWidth;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      degToRad(120),
      degToRad(220),
      false,
      firstCurvePaint,
    );

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - curvePaintWidth),
      degToRad(120),
      degToRad(220),
      false,
      secCurvePaint,
    );
  }

  @override
  bool shouldRepaint(_CurvePainter oldDelegate) =>
      oldDelegate.center != center ||
      oldDelegate.increaseInStrokeWidth != increaseInStrokeWidth;

  @override
  bool shouldRebuildSemantics(_CurvePainter oldDelegate) =>
      oldDelegate.center != center ||
      oldDelegate.increaseInStrokeWidth != increaseInStrokeWidth;
}

class CurvesPaint extends StatelessWidget {
  const CurvesPaint({
    super.key,
    required this.size,
    required this.increaseInStrokeWidth,
    required this.center,
  });
  final Size size;
  final double increaseInStrokeWidth;
  final Offset center;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: size,
      painter: _CurvePainter(
        center: center,
        increaseInStrokeWidth: increaseInStrokeWidth,
      ),
    );
  }
}

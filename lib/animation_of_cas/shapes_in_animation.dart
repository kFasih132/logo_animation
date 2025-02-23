import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_cas_logo/animation_of_cas/curve_paint.dart';

class _ShapesRotaionPainter extends CustomPainter {
  _ShapesRotaionPainter({required this.angle, required this.reduceDiff, required this.reduceHeight});
  double angle ;
  double reduceDiff ;
  double reduceHeight ;

  @override
  void paint(Canvas canvas, Size size) {
    var Size(height: h, width: w) = size;
    double radius = min(w, h) / 2;
    double maxRadius = max(w, h) / 2;

    double diff = maxRadius - radius;

    double radiusOfShapes = radius * 0.2;

    // Paints
    Paint squarePaint =
        Paint()
          ..color = Color.fromARGB(255, 14, 150, 200)
          ..style = PaintingStyle.fill;
    Paint circlePaint =
        Paint()
          ..color = Color.fromARGB(255, 90, 69, 89)
          ..style = PaintingStyle.fill;

    // Draw shapes
    canvas.save();
    canvas.translate(w / 2, h / 2);
     canvas.rotate(degToRad(angle));
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCircle(
          center: Offset(0,(radius - radiusOfShapes)*reduceHeight),
          radius: radiusOfShapes,
        ),
        Radius.circular(radius * 0.1),
      ),
      squarePaint,
    );

    canvas.drawCircle(
      Offset(-((radius-radiusOfShapes) + (diff*reduceDiff)), 0),
      radiusOfShapes,
      circlePaint,
    );
    canvas.drawCircle(
      Offset(((radius-radiusOfShapes) + (diff*reduceDiff)), 0),
      radiusOfShapes,
      circlePaint,
    );
   

    canvas.restore();
  }

  @override
  bool shouldRepaint(_ShapesRotaionPainter oldDelegate) => oldDelegate.angle != angle || oldDelegate.reduceDiff != reduceDiff;

  @override
  bool shouldRebuildSemantics(_ShapesRotaionPainter oldDelegate) => oldDelegate.angle != angle || oldDelegate.reduceDiff != reduceDiff;
}

class ShapesRotation extends StatelessWidget {
  const ShapesRotation({
    super.key,
    required this.size,
    required this.angle,
    required this.reduceDiff,required this.reduceHeight
  });
  final Size size;
  final double angle;
  final double reduceDiff;
  final double reduceHeight;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _ShapesRotaionPainter(angle: angle, reduceDiff: reduceDiff, reduceHeight: reduceHeight),
      size: size,
    );
  }
}

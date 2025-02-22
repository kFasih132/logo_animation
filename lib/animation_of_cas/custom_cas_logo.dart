import 'package:flutter/material.dart';

class CasLogoPainter extends CustomPainter {
  CasLogoPainter({
    required this.heightdeivation,
    required this.cSide,
    required this.aSides,
    required this.sSides,
  });

  double heightdeivation;

  double aSides;
  double cSide;
  double sSides;
  @override
  void paint(Canvas canvas, Size size) {
    var Size(height: h, width: w) = size;

    // paths
    Path path1 = Path();
    path1.moveTo(w * 0.1089, h * (0.05 + (0.8875 * heightdeivation)));
    path1.lineTo(w * 0.0, h * 0.9375);
    path1.lineTo(w * 0.14535, h * 0.9375);
    path1.lineTo(w * 0.25425, h * (0.1125 + (0.825 * heightdeivation)));
    path1.close();

    Path path2 = Path();
    path2.moveTo(w * 0.25425, h * 0.9375 + (0.875));
    path2.lineTo(w * 0.409113, h * 0.9375);
    path2.lineTo(w * 0.59085, h * (0.0625 + (0.875 * heightdeivation)));
    path2.lineTo(w * 0.43605, h * (0.0625 + (0.875 * heightdeivation)));
    path2.close();

    Path path3 = Path();
    path3.moveTo(w * 0.59085, h * 0.9375);
    path3.lineTo(w * 0.7452, h * 0.9375);
    path3.lineTo(w * 0.86355, h * (0.0625 + (0.875 * heightdeivation)));
    path3.lineTo(w * 0.7272, h * (0.0625 + (0.875 * heightdeivation)));
    path3.close();

    Path path4 = Path();
    path4.moveTo(w * 0.25425, h * 0.1125);
    path4.lineTo(
      w * (0.4096 - (0.15535 * cSide)),
      h * (0.1875 - (0.075 * cSide)),
    );
    path4.lineTo(
      w * (0.3698 - (0.14355 * cSide)),
      h * (0.375 - (0.125 * cSide)),
    );
    path4.lineTo(w * 0.22725, h * 0.25);
    path4.close();

    Path path5 = Path();
    path5.moveTo(w * 0.13635, h * 0.91);
    path5.lineTo(w * (0.31815 - (0.1818 * cSide)), h * 0.91);
    path5.lineTo(
      w * (0.3636 - (0.22725 * cSide)),
      h * (0.64 + (0.086 * cSide)),
    );
    path5.lineTo(w * 0.13635, h * 0.726);
    path5.close();

    Path path6 = Path();
    path6.moveTo(w * 0.59085, h * 0.0625);
    path6.lineTo(
      w * (0.768 - (0.17715 * aSides)),
      h * (0.934 - (0.8715 * aSides)),
    );
    path6.lineTo(
      w * (0.6363 - (0.1363 * aSides)),
      h * (0.934 - (0.6215 * aSides)),
    );
    path6.lineTo(w * 0.5, h * 0.3125);
    path6.close();

    Path path7 = Path();
    path7.moveTo(w * 0.59085, h * 0.9375);
    path7.lineTo(
      w * (0.4545 + (0.13635 * sSides)),
      h * (0.5625 + (0.375 * sSides)),
    );
    path7.lineTo(
      w * (0.59085 + (0.15435 * sSides)),
      h * (0.5 + (0.4375 * sSides)),
    );
    path7.lineTo(w * 0.7452, h * 0.9375);
    path7.close();

    Path path8 = Path();
    path8.moveTo(w * 0.86355, h * 0.0625);
    path8.lineTo(w * (1 - (0.13645 * sSides)), h * (0.3125 - (0.25 * sSides)));
    path8.lineTo(
      w * (0.909 - (0.0909 * sSides)),
      h * (0.4375 - (0.1875 * sSides)),
    );
    path8.lineTo(w * 0.8181, h * 0.25);
    path8.close();

    //paint areas
    Paint paint1 =
        Paint()
          ..style = PaintingStyle.fill
          ..color = Color.fromARGB(255, 90, 69, 89);

    Paint paint2 =
        Paint()
          ..style = PaintingStyle.fill
          ..color = Color.fromARGB(255, 14, 150, 200);

    Paint paint3 =
        Paint()
          ..style = PaintingStyle.fill
          ..color = Color.fromARGB(255, 90, 69, 89);
    Paint paint4 =
        Paint()
          ..style = PaintingStyle.fill
          ..color = Color.fromARGB(255, 66, 49, 67);

    Paint paint5 =
        Paint()
          ..style = PaintingStyle.fill
          ..color = Color.fromARGB(255, 0, 109, 150);

    // draw paths
    canvas.drawPath(path4, paint4);
    canvas.drawPath(path5, paint4);
    canvas.drawPath(path6, paint5);
    canvas.drawPath(path7, paint4);
    canvas.drawPath(path8, paint4);
    canvas.drawPath(path1, paint1);
    canvas.drawPath(path2, paint2);
    canvas.drawPath(path3, paint3);
  }

  @override
  bool shouldRepaint(CasLogoPainter oldDelegate) =>
      oldDelegate.heightdeivation != heightdeivation ||
      oldDelegate.aSides != aSides ||
      oldDelegate.cSide != cSide ||
      oldDelegate.sSides != sSides;

  @override
  bool shouldRebuildSemantics(CasLogoPainter oldDelegate) =>
      oldDelegate.heightdeivation != heightdeivation ||
      oldDelegate.aSides != aSides ||
      oldDelegate.cSide != cSide ||
      oldDelegate.sSides != sSides;
}

class CaslogoWidget extends StatelessWidget {
  const CaslogoWidget({
    super.key,
    required this.size,
    required this.heightdeivation,
    required this.cSides,
    required this.aSides,
    required this.sSides,
  });
  final Size size;
  final double heightdeivation;
  final double cSides;
  final double aSides;
  final double sSides;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: size,
      painter: CasLogoPainter(
        heightdeivation: heightdeivation,
        cSide: cSides,
        aSides: aSides,
        sSides: sSides,
      ),
    );
  }
}

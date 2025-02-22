import 'package:flutter/material.dart';
import 'package:flutter_cas_logo/animation_of_cas/curve_paint.dart';
import 'package:flutter_cas_logo/animation_of_cas/custom_cas_logo.dart';
import 'package:flutter_cas_logo/animation_of_cas/shapes_in_animation.dart';

class LogoAnimation extends StatefulWidget {
  const LogoAnimation({super.key, required this.size});
  final Size size;

  @override
  State<LogoAnimation> createState() => _LogoAnimationState();
}

class _LogoAnimationState extends State<LogoAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  //curves animations
  late Animation<double> _increaseInStrokeWidthAnimation;
  late Animation<Offset> _centerAnimation;

  // shapes animations
  late Animation<double> _angleRotationShapesAnimation;
  late Animation<double> _reduceDiffAnimation;
  late Animation<double> _reduceHeightAnimation;

  // Logo Animation
  late Animation<double> _logoHeightAnimation;
  late Animation<double> _logoCSideAnimation;
  late Animation<double> _logoASideAnimation;
  late Animation<double> _logoSSideAnimation;

  //opacity animations
  late Animation<double> _curvesOpacityAnimation;

  late Animation<double> _shapesOpacityOutAnimation;
  late Animation<double> _shapesOpacityInAnimation;

  late Animation<double> _logoOpacityOutAnimation;
  late Animation<double> _logoOpacityInAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 6),
      vsync: this,
    )..addListener(() {
      setState(() {});
    })..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.repeat();
      }
    },);

    /// Animation for increasing the stroke width of the curves
    _increaseInStrokeWidthAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Interval(0, 0.25 ,curve: Curves.bounceIn)));

    _centerAnimation = Tween<Offset>(
      begin: Offset(widget.size.width * 0.3, widget.size.height * 0.2),
      end: Offset(widget.size.width * 1.4, widget.size.height * 1.4),
    ).animate(CurvedAnimation(parent: _controller, curve: Interval(0, .25 , curve: Curves.easeInOut)));
    _curvesOpacityAnimation = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(CurvedAnimation(parent: _controller, curve: Interval(0.2, 0.25)));

    ////////////////////////////////////////////////////////////////

    /// Animation for rotating the shapes

    _shapesOpacityInAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Interval(0.24, 0.27)),
    );

    _angleRotationShapesAnimation = Tween<double>(
      begin: 0,
      end: 540,
    ).animate(CurvedAnimation(parent: _controller, curve: Interval(0.25, 0.5,curve: Curves.decelerate)));

    _reduceDiffAnimation = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(CurvedAnimation(parent: _controller, curve: Interval(0.3, 0.45)));

    _reduceHeightAnimation = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(CurvedAnimation(parent: _controller, curve: Interval(0.4, 0.55)));

    _shapesOpacityOutAnimation = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(parent: _controller, curve: Interval(0.55, 0.65)),
    );

    ////////////////////////////////////////////////////////////////////////////
    ///
    ///
    ///Start the animation of Logo
    _logoOpacityInAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Interval(0.59, 0.62)),
    );
    _logoHeightAnimation = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(CurvedAnimation(parent: _controller, curve: Interval(0.6, 0.7,curve: Curves.bounceIn)));
    _logoCSideAnimation = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(CurvedAnimation(parent: _controller, curve: Interval(0.69, 0.78,curve: Curves.bounceOut)));
    _logoASideAnimation = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(CurvedAnimation(parent: _controller, curve: Interval(0.77, 0.86,curve: Curves.bounceOut)));
    _logoSSideAnimation = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(CurvedAnimation(parent: _controller, curve: Interval(0.85, 0.96,curve: Curves.bounceOut)));
    _logoOpacityOutAnimation = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(parent: _controller, curve: Interval(0.95, 1)),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var Size(height: h, width: w) = size;
    return Stack(
      children: [
        Opacity(
          opacity: _curvesOpacityAnimation.value,
          child: CurvesPaint(
            size: Size(w, h),
            increaseInStrokeWidth: _increaseInStrokeWidthAnimation.value,
            center: _centerAnimation.value,
          ),
        ),


        Opacity(
          opacity:
              _shapesOpacityInAnimation.value < 1
                  ? _shapesOpacityInAnimation.value
                  : _shapesOpacityOutAnimation.value,
          child: ShapesRotation(
            size: size,
            angle: _angleRotationShapesAnimation.value,
            reduceDiff: _reduceDiffAnimation.value,
            reduceHeight: _reduceHeightAnimation.value,
          ),
        ),
        Opacity(
          opacity: _logoOpacityInAnimation.value < 1
              ? _logoOpacityInAnimation.value
              : _logoOpacityOutAnimation.value,
          child: Align(
            alignment: Alignment.center,
            child: CaslogoWidget(
              size: Size(w*0.7, h*0.55),
              heightdeivation: _logoHeightAnimation.value,
              cSides: _logoCSideAnimation.value,
              aSides: _logoASideAnimation.value,
              sSides: _logoSSideAnimation.value,
            ),
          ),
        ),
      ],
    );
  }
}

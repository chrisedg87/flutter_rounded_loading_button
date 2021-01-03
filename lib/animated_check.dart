import 'dart:ui';

import 'package:flutter/material.dart';

class AnimatedCheck extends StatefulWidget {
  final Animation<double> progress;

  // The size of the checkmark
  final double size;

  // The primary color of the checkmark
  final Color color;

  // The width of the checkmark stroke
  final double strokeWidth;

  AnimatedCheck({
    @required this.progress,
    @required this.size,
    this.color,
    this.strokeWidth});

  @override
  State<StatefulWidget> createState() => AnimatedCheckState();
}

class AnimatedCheckState extends State<AnimatedCheck> with SingleTickerProviderStateMixin {

  @override
  void initState() { 
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return CustomPaint(
      foregroundPainter: AnimatedPathPainter(widget.progress, widget.color ?? theme.primaryColor, widget.strokeWidth),
      child: new SizedBox(
        width: widget.size,
        height: widget.size,
      )
    );
  }
}

class AnimatedPathPainter extends CustomPainter {
  final Animation<double> _animation;

  final Color _color;

  final double strokeWidth;

  AnimatedPathPainter(this._animation, this._color, this.strokeWidth) : super(repaint: _animation);

  Path _createAnyPath(Size size) {
    return Path()
      ..moveTo(0.27083 * size.width, 0.54167 * size.height)
      ..lineTo(0.41667 * size.width, 0.68750 * size.height)
      ..lineTo(0.75000 * size.width, 0.35417 * size.height);
  }

  Path createAnimatedPath(Path originalPath, double animationPercent) {
    final totalLength = originalPath
        .computeMetrics()
        .fold(0.0, (double prev, PathMetric metric) => prev + metric.length);

    final currentLength = totalLength * animationPercent;

    return extractPathUntilLength(originalPath, currentLength);
  }

  Path extractPathUntilLength(Path originalPath, double length) {
    var currentLength = 0.0;

    final path = new Path();

    var metricsIterator = originalPath.computeMetrics().iterator;

    while (metricsIterator.moveNext()) {
      var metric = metricsIterator.current;

      var nextLength = currentLength + metric.length;

      final isLastSegment = nextLength > length;
      if (isLastSegment) {
        final remainingLength = length - currentLength;
        final pathSegment = metric.extractPath(0.0, remainingLength);

        path.addPath(pathSegment, Offset.zero);
        break;
      } else {

        final pathSegment = metric.extractPath(0.0, metric.length);
        path.addPath(pathSegment, Offset.zero);
      }

      currentLength = nextLength;
    }

    return path;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final animationPercent = this._animation.value;

    final path = createAnimatedPath(_createAnyPath(size), animationPercent);

    final Paint paint = Paint();
    paint.color = _color;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = strokeWidth ?? size.width * 0.06;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
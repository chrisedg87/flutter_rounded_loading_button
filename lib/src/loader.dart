import 'package:flutter/material.dart';

/// Circular progress indicator
class Loader extends StatelessWidget {
  const Loader({
    super.key,
    required this.loaderStrokeWidth,
    required this.loaderSize,
    required this.iconsColor,
    this.progressIndicator,
  });
  final double loaderStrokeWidth;
  final double loaderSize;
  final Color iconsColor;
  final Widget? progressIndicator;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: loaderSize,
      width: loaderSize,
      child: progressIndicator ??
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(iconsColor),
            strokeWidth: loaderStrokeWidth,
          ),
    );
  }
}

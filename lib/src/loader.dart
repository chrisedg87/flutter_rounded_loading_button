import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({
    super.key,
    required this.loaderStrokeWidth,
    required this.loaderSize,
    required this.iconsColor,
  });
  final double loaderStrokeWidth;
  final double loaderSize;
  final Color iconsColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: loaderSize,
      width: loaderSize,
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(iconsColor),
        strokeWidth: loaderStrokeWidth,
      ),
    );
  }
}

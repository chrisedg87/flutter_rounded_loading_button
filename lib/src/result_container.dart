import 'package:flutter/material.dart';

/// Container that holds the icon showing the result (error or success)
class ResultContainer extends StatelessWidget {
  const ResultContainer({
    super.key,
    this.color,
    this.borderColor,
    required this.radius,
    required this.borderWidth,
    required this.icon,
    required this.iconsColor,
    required this.iconSize,
    required this.animationSize,
  });
  final Color? color;
  final Color? borderColor;
  final double radius;
  final double? borderWidth;
  final IconData icon;
  final Color iconsColor;
  final double? iconSize;
  final double animationSize;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: FractionalOffset.center,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          border: borderColor != null
              ? Border.all(
                  color: borderColor!,
                  width: borderWidth ?? 1,
                )
              : null),
      width: animationSize,
      height: animationSize,
      child: animationSize > 20
          ? Icon(
              icon,
              color: iconsColor,
              size: iconSize,
            )
          : null,
    );
  }
}

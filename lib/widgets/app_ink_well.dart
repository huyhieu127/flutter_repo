import 'package:flutter/material.dart';
import 'package:flutter_repo/utils/decoration.dart';

class AppInkWell extends InkWell {
  const AppInkWell({super.key, super.onTap, this.radius = 16, super.child});
  final double radius;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: AppDecorations.borderInkWell(radius: radius),
      onTap: onTap,
      child: child,
    );
  }
}

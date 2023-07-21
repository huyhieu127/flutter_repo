import 'package:flutter/material.dart';
import 'package:flutter_repo/utils/color_utils.dart';
import 'package:flutter_repo/utils/decoration.dart';
import 'package:flutter_repo/widgets/app_ink_well.dart';

class AppButtonPrimary extends InkWell {
  const AppButtonPrimary({super.key, required this.text, super.onTap});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Ink(
        decoration: AppDecorations.decorationLinearGradient(),
        child: AppInkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 60),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

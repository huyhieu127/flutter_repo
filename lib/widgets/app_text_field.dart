
import 'package:flutter/material.dart';
import 'package:flutter_repo/utils/color_utils.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({super.key, required this.hint, this.textInputAction = TextInputAction.next, this.isPassword = false});
  final String hint;
  final TextInputAction? textInputAction;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: TextField(
        style: const TextStyle(color: Colors.white70),
        textInputAction: textInputAction,
        cursorColor: const Color(0xFF15BE77),
        obscureText: isPassword,
        obscuringCharacter: "•",
        decoration: InputDecoration(
          fillColor: AppColor.colorBg.withAlpha(10),
          filled: true,
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white30, fontWeight: FontWeight.w400),
          contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: Colors.white54,
              width: 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: AppColor.colorBg.withAlpha(20),
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}

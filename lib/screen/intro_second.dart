import 'package:flutter/material.dart';
import 'package:flutter_repo/screen/sign_in.dart';
import 'package:flutter_repo/widgets/app_button_primary.dart';
import 'package:flutter_svg/svg.dart';

import '../gen/assets.gen.dart';

class IntroSecondScreen extends StatefulWidget {
  const IntroSecondScreen({super.key});

  @override
  State<IntroSecondScreen> createState() => _IntroSecondScreenState();
}

class _IntroSecondScreenState extends State<IntroSecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SvgPicture.asset(Assets.images.imgIntro2),
          ),
          Container(
            margin: const EdgeInsets.all(16),
            child: const Text(
              "Food Ninja is Where Your\nComfort Food Lives",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 24,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(16),
            child: const Text(
              "Enjoy a fast and smooth food delivery at\nyour doorstep",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(height: 40),
          AppButtonPrimary(
            text: "Next",
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SignInScreen()));
            },
          ),
          const SizedBox(height: 60)
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_repo/screen/intro_second.dart';
import 'package:flutter_repo/widgets/app_button_primary.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../gen/assets.gen.dart';

class IntroFirstScreen extends StatefulWidget {
  const IntroFirstScreen({super.key});

  @override
  State<IntroFirstScreen> createState() => _IntroFirstScreenState();
}

class _IntroFirstScreenState extends State<IntroFirstScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SvgPicture.asset(Assets.images.imgIntro1),
            ),
            Container(
              margin: const EdgeInsets.all(16),
              child: const Text(
                "Find your  Comfort"
                "\nFood here",
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
                "Here You Can find a chef or dish for every\n"
                "taste and color. Enjoy!",
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const IntroSecondScreen()));
                }),
            const SizedBox(height: 60)
          ],
        ),
      ),
    );
  }
}

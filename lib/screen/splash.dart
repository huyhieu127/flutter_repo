import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_repo/screen/intro_first.dart';
import 'package:flutter_repo/utils/config.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../gen/assets.gen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;

  void startTimer() {
    const oneSec = Duration(seconds: 2);
    _timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        setState(() {
          _timer.cancel();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const IntroFirstScreen()),
          );
        });
      },
    );
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Stack(
              children: [
                AspectRatio(
                  aspectRatio: Configs.ratioBgApp,
                  child: SvgPicture.asset(
                    Assets.images.imgBgApp,
                    width: double.infinity,
                  ),
                ),
                AspectRatio(
                  aspectRatio: Configs.ratioBgApp,
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black,
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Image.asset(
              Assets.images.imgLogoSplash.path,
              width: 188,
            ),
          )
        ],
      ),
    );
  }
}

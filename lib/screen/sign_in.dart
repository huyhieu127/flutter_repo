import 'package:flutter/material.dart';
import 'package:flutter_repo/gen/assets.gen.dart';
import 'package:flutter_repo/screen/home/home.dart';
import 'package:flutter_repo/utils/color_utils.dart';
import 'package:flutter_repo/utils/config.dart';
import 'package:flutter_repo/utils/decoration.dart';
import 'package:flutter_repo/widgets/app_button_primary.dart';
import 'package:flutter_repo/widgets/app_ink_well.dart';
import 'package:flutter_repo/widgets/app_text_field.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width,
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: IntrinsicHeight(
            child: Stack(
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
                SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Wrap(direction: Axis.horizontal, children: [
                          Image.asset(
                            Assets.images.imgLogoSplash.path,
                            width: 188,
                          ),
                        ]),
                      ),
                      const SizedBox(height: 40),
                      const Text(
                        "Login To Your Account",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 22,
                        ),
                      ),
                      const SizedBox(height: 40),
                      const AppTextField(hint: "Email"),
                      const SizedBox(height: 20),
                      const AppTextField(
                        hint: "Password",
                        textInputAction: TextInputAction.done,
                        isPassword: true,
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        "Or Continue With",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          children: [
                            Expanded(child: _buttonLogo("Facebook", Assets.images.icFacebook.path, () {})),
                            const SizedBox(width: 24),
                            Expanded(child: _buttonLogo("Google", Assets.images.icGoogle.path, () {})),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Forgot Your Password?",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: AppColor.endColor,
                          foreground: AppDecorations.paintLinearGradient,
                        ),
                      ),
                      const SizedBox(height: 40),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            AppButtonPrimary(
                              text: "Login",
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
                              },
                            ),
                            SizedBox(
                              height: 60,
                              child: Container(
                                margin: const EdgeInsets.only(top: 20),
                                child: Text(
                                  "Create a new account",
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    decorationColor: AppColor.endColor,
                                    foreground: AppDecorations.paintLinearGradient,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buttonLogo(String text, String name, GestureTapCallback onTap) => AppInkWell(
        onTap: onTap,
        child: Container(
          decoration: AppDecorations.decorationBgContainer(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  name,
                  width: 24,
                ),
                const SizedBox(width: 10),
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

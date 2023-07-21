import 'package:flutter/material.dart';
import 'package:flutter_repo/gen/assets.gen.dart';
import 'package:flutter_repo/utils/color_utils.dart';
import 'package:flutter_repo/utils/decoration.dart';
import 'package:flutter_repo/widgets/app_ink_well.dart';
import 'package:flutter_svg/flutter_svg.dart';

header() => Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(24),
          child: Row(
            children: [
              const Expanded(
                child: Text(
                  "Find Your\nFavorite Food",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 32,
                  ),
                ),
              ),
              AppInkWell(
                onTap: () {},
                child: Container(
                  width: 52,
                  height: 52,
                  decoration: AppDecorations.decorationBgContainer(radius: 16),
                  child: Stack(
                    children: [
                      Center(
                        child: SvgPicture.asset(Assets.images.icNotification),
                      ),
                      Positioned(
                        top: 14,
                        right: 14,
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            border: Border.all(color: Colors.white, width: 1),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: AppDecorations.decorationBgContainer(),
                  child: Row(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: SvgPicture.asset(Assets.images.icSearch)),
                      const Expanded(
                        child: TextField(
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          cursorColor: AppColor.endColor,
                          textAlign: TextAlign.justify,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: "What do you want to order?",
                            hintStyle: TextStyle(
                              color: Colors.white30,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                            contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 12),
              AppInkWell(
                onTap: () {},
                child: Container(
                  width: 58,
                  height: 58,
                  decoration: AppDecorations.decorationBgContainer(radius: 16),
                  child: Center(child: SvgPicture.asset(Assets.images.icFilter)),
                ),
              ),
            ],
          ),
        ),
      ],
    );

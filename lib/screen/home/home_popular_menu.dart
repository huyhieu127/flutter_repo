import 'package:flutter/material.dart';
import 'package:flutter_repo/models/food_form.dart';
import 'package:flutter_repo/utils/color_utils.dart';
import 'package:flutter_repo/utils/decoration.dart';
import 'package:flutter_repo/widgets/app_ink_well.dart';

popularMenu({required List<FoodForm> foodList}) => Column(
      children: [
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            children: [
              const Expanded(
                child: Text(
                  "Popular Menu",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              AppInkWell(
                onTap: () {},
                radius: 10,
                child: const Padding(
                  padding: EdgeInsets.all(6),
                  child: Text(
                    "View More",
                    style: TextStyle(
                      color: AppColor.secondary,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.only(left: 24, right: 24, bottom: 32),
          itemBuilder: (context, index) => _foodWidget(foodForm: foodList[index]),
          separatorBuilder: (context, index) => const SizedBox(height: 20),
          itemCount: foodList.length,
        ),
      ],
    );

_foodWidget({required FoodForm foodForm}) => Container(
      decoration: AppDecorations.decorationBgContainer(),
      height: 87,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 64 / 64,
              child: Image.asset(foodForm.image),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    foodForm.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    foodForm.desc,
                    style: const TextStyle(
                      color: Colors.white30,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            Text(
              "\$${foodForm.price}",
              style: const TextStyle(
                color: AppColor.secondaryAccent,
                fontSize: 22,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );

import 'package:flutter/material.dart';
import 'package:flutter_repo/models/restaurant_form.dart';
import 'package:flutter_repo/utils/color_utils.dart';
import 'package:flutter_repo/utils/decoration.dart';
import 'package:flutter_repo/widgets/app_ink_well.dart';

nearestRestaurant({required List<RestaurantForm> restaurantList}) => Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            children: [
              const Expanded(
                child: Text(
                  "Nearest Restaurant",
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
        SizedBox(
          height: 184,
          child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => _restaurantWidget(restaurantForm: restaurantList[index]),
              separatorBuilder: (context, index) => const SizedBox(width: 24),
              itemCount: restaurantList.length),
        ),
      ],
    );

_restaurantWidget({required RestaurantForm restaurantForm}) => AspectRatio(
      aspectRatio: 147 / 184,
      child: Container(
        decoration: AppDecorations.decorationBgContainer(),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 147 / 100,
              child: Image.asset(restaurantForm.image),
            ),
            const SizedBox(height: 12),
            Text(
              restaurantForm.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              restaurantForm.time,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white30,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );

import 'package:flutter/material.dart';
import 'package:flutter_repo/models/restaurant_form.dart';
import 'package:flutter_repo/utils/decoration.dart';

nearestRestaurantGrid({required BuildContext context, required List<RestaurantForm> restaurantList}) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            "Nearest Restaurant",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => _restaurantWidget(restaurantForm: restaurantList[index]),
            itemCount: restaurantList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 24,
              crossAxisSpacing: 24,
              childAspectRatio: 147 / 184,
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );

_restaurantWidget({required RestaurantForm restaurantForm}) => Container(
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
);

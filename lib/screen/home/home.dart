import 'package:flutter/material.dart';
import 'package:flutter_repo/gen/assets.gen.dart';
import 'package:flutter_repo/models/food_form.dart';
import 'package:flutter_repo/models/restaurant_form.dart';
import 'package:flutter_repo/screen/home/home_header.dart';
import 'package:flutter_repo/screen/home/home_nearest_restaurant.dart';
import 'package:flutter_repo/screen/home/home_promotion.dart';
import 'package:flutter_repo/utils/config.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'home_popular_menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<RestaurantForm> _restaurantList = [
    RestaurantForm(image: Assets.images.imgRestaurant1.path, name: "Vegan Resto", time: "12 Mins"),
    RestaurantForm(image: Assets.images.imgRestaurant2.path, name: "Healthy Food", time: "8 Mins"),
    RestaurantForm(image: Assets.images.imgRestaurant3.path, name: "Good Food", time: "12 Mins"),
    RestaurantForm(image: Assets.images.imgRestaurant4.path, name: "Smart Resto", time: "8 Mins"),
  ];

  final List<FoodForm> _foodList = [
    FoodForm (image: Assets.images.imgFood1.path, name: "Herbal Pancake", desc: "Warung Herbal", price: 7),
    FoodForm(image: Assets.images.imgFood2.path, name: "Fruit Salad", desc: "Wijie Resto", price: 5),
    FoodForm(image: Assets.images.imgFood3.path, name: "Green Noddle", desc: "Noodle Home", price: 15),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: AspectRatio(
              aspectRatio: Configs.ratioBgApp2,
              child: Opacity(
                opacity: 0.1,
                child: SvgPicture.asset(
                  Assets.images.imgBgApp2,
                  width: double.infinity,
                ),
              ),
            ),
          ),
          SafeArea(
            child: ListView(
              children: [
                header(),
                promotion(),
                nearestRestaurant(restaurantList: _restaurantList),
                popularMenu(foodList: _foodList),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

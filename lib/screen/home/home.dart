import 'package:flutter/material.dart';
import 'package:flutter_repo/gen/assets.gen.dart';
import 'package:flutter_repo/models/chip_form.dart';
import 'package:flutter_repo/models/food_form.dart';
import 'package:flutter_repo/models/restaurant_form.dart';
import 'package:flutter_repo/screen/home/components/home_chip.dart';
import 'package:flutter_repo/screen/home/components/home_filter.dart';
import 'package:flutter_repo/screen/home/components/home_header.dart';
import 'package:flutter_repo/screen/home/components/home_nearest_restaurant_grid.dart';
import 'package:flutter_repo/screen/home/components/home_nearest_restaurant_hz.dart';
import 'package:flutter_repo/utils/config.dart';
import 'package:flutter_repo/widgets/app_button_primary.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'components/home_popular_menu.dart';
import 'components/home_promotion.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FocusNode _focusNode = FocusNode();
  final _textEditingController = TextEditingController();
  bool _isFilter = false;

  final List<RestaurantForm> _restaurantList = [
    RestaurantForm(image: Assets.images.imgRestaurant1.path, name: "Vegan Resto", distance: 12.0, time: "16 Mins"),
    RestaurantForm(image: Assets.images.imgRestaurant2.path, name: "Healthy Food", distance: 5.0, time: "8 Mins"),
    RestaurantForm(image: Assets.images.imgRestaurant3.path, name: "Good Food", distance: 2.0, time: "4 Mins"),
    RestaurantForm(image: Assets.images.imgRestaurant4.path, name: "Smart Resto", distance: 10.0, time: "12 Mins"),
  ];

  final List<FoodForm> _foodList = [
    FoodForm(image: Assets.images.imgFood1.path, name: "Herbal Pancake", desc: "Cake, Warung Herbal", price: 7),
    FoodForm(image: Assets.images.imgFood2.path, name: "Fruit Salad", desc: "Soup, Wijie Resto", price: 5),
    FoodForm(image: Assets.images.imgFood3.path, name: "Green Noddle", desc: "Salad, Noodle Home", price: 15),
  ];

  final List<ChipForm> _typeChips = [
    ChipForm(id: 1, name: "Restaurant", type: 1),
    ChipForm(id: 2, name: "Menu", type: 1),
  ];

  final List<ChipForm> _locationChips = [
    ChipForm(id: 1, name: "1 Km", type: 2),
    ChipForm(id: 2, name: "> 10 Km", type: 2),
    ChipForm(id: 3, name: "< 10 Km", type: 2),
  ];
  final List<ChipForm> _foodChips = [
    ChipForm(id: 1, name: "Cake", type: 3),
    ChipForm(id: 2, name: "Soup", type: 3),
    ChipForm(id: 3, name: "Salad", type: 3),
  ];

  List<ChipForm> _selectedChips = [];

  List<RestaurantForm> _restaurantResults = [];
  List<FoodForm> _foodResults = [];

  @override
  void initState() {
    _textEditingController.addListener(() {
      _search();
    });
    _restaurantList.sort((a, b) => a.distance.compareTo(b.distance));
    _restaurantResults = _restaurantList;
    _foodResults = _foodList;
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _textEditingController.dispose();
    super.dispose();
  }

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
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      HomeHeader(
                        textEditingController: _textEditingController,
                        focusNode: _focusNode,
                        isFilter: !_isFilter,
                        isFilterType: _typeSelected().isNotEmpty,
                        onFocusChange: (focusState) {
                          setState(() {
                            //_focusNode.hasFocus;
                          });
                        },
                        onFilterClick: () {
                          setState(() {
                            _isFilter = true;
                          });
                        },
                      ),
                      Visibility(
                        visible: _selectedChips.isNotEmpty,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
                          child: HomeChip(
                            itemList: _selectedChips,
                            onDelete: (chip) {
                              setState(() {
                                chip.isSelected = false;
                                _selectedChips.remove(chip);
                                if (_selectedChips.isEmpty) {
                                  _isFilter = false;
                                }
                                _search();
                              });
                            },
                          ),
                        ),
                      ),
                      Visibility(
                        visible: _checkDefault(),
                        child: const HomePromotion(),
                      ),
                      _checkDefault()
                          ? HomeNearestRestaurantHz(restaurantList: _restaurantList)
                          : (Visibility(
                              visible: _checkRestaurant(),
                              child: HomeNearestRestaurantGird(
                                context: context,
                                restaurantList: _restaurantResults,
                              ),
                            )),
                      Visibility(
                        visible: _checkFood(),
                        child: HomePopularMenu(foodList: _foodResults, isViewMore: _checkDefault()),
                      ),
                      Visibility(
                          visible: _isFilter,
                          child: HomeFilter(
                            typeChips: _typeChips,
                            locationChips: _locationChips,
                            foodChips: _foodChips,
                            onTap: (selectedChips) {
                              setState(() {
                                _selectedChips = selectedChips;
                              });
                            },
                          ))
                    ],
                  ),
                ),
                Visibility(
                  visible: _isFilter,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    width: double.infinity,
                    child: AppButtonPrimary(
                      text: "Search",
                      flex: 1,
                      onTap: () {
                        setState(() {
                          _selectedChips.clear();
                          _selectedChips.addAll(_locationSelected());
                          _selectedChips.addAll(_foodSelected());
                          _focusNode.unfocus();
                          _isFilter = false;
                          _search();
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _search() {
    var keyword = _textEditingController.text;
    setState(() {
      _findRestaurant(keyword);
      _findFood(keyword);
    });
  }

  _checkRestaurant() =>
      !_isFilter &&
      _restaurantResults.isNotEmpty &&
      (_typeSelected().isEmpty || _typeSelected().where((value) => value.name == "Restaurant").isNotEmpty);

  _findRestaurant(String keyword) {
    ChipForm? locationSelected;
    try{
      locationSelected = _locationSelected().first;
    }catch(e){
      locationSelected = null;
    }

    _restaurantResults = _restaurantList
        .where((item) =>
            item.name.toLowerCase().contains(keyword.toLowerCase())
                && (
                locationSelected == null ||
                    ((locationSelected.id == 1 && item.distance <= 1.0 ||
                        locationSelected.id == 2 && item.distance > 10 ||
                        locationSelected.id == 3 && item.distance < 10)))
    )
        .toList();
  }

  _checkFood() =>
      !_isFilter &&
      _foodResults.isNotEmpty &&
      (_typeSelected().isEmpty || _typeSelected().where((value) => value.name == "Menu").isNotEmpty);

  _findFood(String keyword) {
    List<ChipForm> foodSelected = _foodSelected();
    _foodResults = _foodList
        .where((item) =>
            item.name.toLowerCase().contains(keyword.toLowerCase()) &&
            (foodSelected.isEmpty ||
                foodSelected
                    .where((selected) => item.desc.toLowerCase().contains(selected.name.toLowerCase()))
                    .toList()
                    .isNotEmpty))
        .toList();
  }

  _checkDefault() =>
      !_isFilter && _selectedChips.isEmpty && _textEditingController.text.isEmpty && _typeSelected().isEmpty;

  List<ChipForm> _typeSelected() => _typeChips.where((element) => element.isSelected).toList();

  List<ChipForm> _locationSelected() => _locationChips.where((element) => element.isSelected).toList();

  List<ChipForm> _foodSelected() => _foodChips.where((element) => element.isSelected).toList();
}

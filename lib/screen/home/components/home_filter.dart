import 'package:flutter/material.dart';
import 'package:flutter_repo/models/chip_form.dart';
import 'package:flutter_repo/utils/color_utils.dart';
import 'package:flutter_repo/utils/decoration.dart';
import 'package:flutter_repo/widgets/app_ink_well.dart';

class HomeFilter extends StatefulWidget {
  const HomeFilter(
      {super.key, required this.typeChips, required this.locationChips, required this.foodChips, required this.onTap});

  final List<ChipForm> typeChips;
  final List<ChipForm> locationChips;
  final List<ChipForm> foodChips;
  final Function(List<ChipForm> selectedChip) onTap;

  @override
  State<HomeFilter> createState() => _HomeFilterState();
}

class _HomeFilterState extends State<HomeFilter> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeTypeFilter(
            title: "Type",
            itemList: widget.typeChips,
            isJustOnly: true,
          ),
          const SizedBox(height: 16),
          HomeTypeFilter(
            title: "Location",
            itemList: widget.locationChips,
            isJustOnly: true,
          ),
          const SizedBox(height: 16),
          HomeTypeFilter(
            title: "Food",
            itemList: widget.foodChips,
          ),
        ],
      ),
    );
  }
}

class HomeTypeFilter extends StatefulWidget {
  const HomeTypeFilter({super.key, required this.title, required this.itemList, this.isJustOnly = false});

  final String title;
  final List<ChipForm> itemList;
  final bool isJustOnly;

  @override
  State<HomeTypeFilter> createState() => _HomeTypeFilterState();
}

class _HomeTypeFilterState extends State<HomeTypeFilter> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: widget.itemList
              .map(
                (item) => AppInkWell(
                  onTap: () {
                    setState(() {
                      if (widget.isJustOnly) {
                        for (var element in widget.itemList) {
                          if(element != item) {
                            element.isSelected = false;
                          }
                        }
                      }
                      item.isSelected = !item.isSelected;
                    });
                  },
                  child: Container(
                    decoration: AppDecorations.decorationBgContainer(
                        radius: 14,
                        color: item.isSelected ? AppColor.secondary.withAlpha(200) : AppColor.colorBg.withAlpha(20)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      child: Text(
                        item.name,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: item.isSelected ? FontWeight.w600 : FontWeight.w400),
                      ),
                    ),
                  ),
                ),
              )
              .toList()
              .cast<Widget>(),
        ),
      ],
    );
  }
}

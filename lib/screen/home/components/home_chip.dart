import 'package:flutter/material.dart';
import 'package:flutter_repo/models/chip_form.dart';
import 'package:flutter_repo/utils/decoration.dart';
import 'package:flutter_repo/widgets/app_ink_well.dart';

class HomeChip extends StatefulWidget {
  const HomeChip({super.key, required this.itemList, required this.onDelete});

  final List<ChipForm> itemList;
  final Function(ChipForm chipForm) onDelete;

  @override
  State<HomeChip> createState() => _HomeChipState();
}

class _HomeChipState extends State<HomeChip> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: widget.itemList
          .map(
            (item) => Container(
              decoration: AppDecorations.decorationBgContainer(radius: 16),
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: _itemChip(name: item.name, onDelete: (){
                  widget.onDelete(item);
                }),
              ),
            ),
          )
          .toList()
          .cast<Widget>(),
    );
  }

  _itemChip({required String name, required GestureTapCallback onDelete}) => Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 2),
            child: Text(
              name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          AppInkWell(
            onTap: onDelete,
            child: const Padding(
              padding: EdgeInsets.all(12),
              child: Icon(
                Icons.close,
                color: Colors.white,
                size: 16,
              ),
            ),
          ),
        ],
      );
}

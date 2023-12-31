import 'package:flutter/material.dart';
import 'package:flutter_repo/gen/assets.gen.dart';
import 'package:flutter_repo/utils/color_utils.dart';
import 'package:flutter_repo/utils/decoration.dart';
import 'package:flutter_repo/widgets/app_ink_well.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({
    super.key,
    required this.textEditingController,
    required this.focusNode,
    required this.isFilter,
    required this.isFilterType,
    required this.onFocusChange,
    required this.onFilterClick,
  });

  final TextEditingController textEditingController;
  final FocusNode focusNode;
  final bool isFilter;
  final bool isFilterType;
  final ValueChanged<bool>? onFocusChange;
  final GestureTapCallback? onFilterClick;

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _prepareAnimations();
    _runExpandCheck();
  }

  ///Setting up the animation
  void _prepareAnimations() {
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 350));
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    );
  }

  void _runExpandCheck() {
    if (widget.isFilter) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  void didUpdateWidget(HomeHeader oldWidget) {
    super.didUpdateWidget(oldWidget);
    _runExpandCheck();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
                  decoration: AppDecorations.decorationBgContainer(
                    color: widget.isFilterType ? AppColor.secondary.withAlpha(20) : Colors.white.withAlpha(20),
                  ),
                  child: Row(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(left: 16), child: SvgPicture.asset(Assets.images.icSearch)),
                      Expanded(
                        child: Focus(
                          onFocusChange: widget.onFocusChange,
                          child: TextField(
                            controller: widget.textEditingController,
                            focusNode: widget.focusNode,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            cursorColor: AppColor.endColor,
                            textAlign: TextAlign.justify,
                            decoration: const InputDecoration(
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
                      ),
                    ],
                  ),
                ),
              ),
              SizeTransition(
                  axisAlignment: 1.0,
                  axis: Axis.horizontal,
                  sizeFactor: _animation,
                  child: AnimatedScale(
                    duration: const Duration(milliseconds: 450),
                    scale: widget.isFilter ? 1.0 : 0.0,
                    curve: Curves.fastOutSlowIn,
                    child: AnimatedSlide(
                      duration: const Duration(milliseconds: 350),
                      offset: widget.isFilter ? const Offset(0, 0) : const Offset(0.5, 0),
                      curve: Curves.fastOutSlowIn,
                      child: Row(
                        children: [
                          const SizedBox(width: 12),
                          GestureDetector(
                            onTap: widget.onFilterClick,
                            child: Container(
                              width: 58,
                              height: 58,
                              decoration: AppDecorations.decorationBgContainer(
                                radius: 16,
                                color:
                                    widget.isFilterType ? AppColor.secondary.withAlpha(20) : Colors.white.withAlpha(20),
                              ),
                              child: Center(child: SvgPicture.asset(Assets.images.icFilter)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}

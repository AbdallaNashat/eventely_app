import 'package:eventely/core/theme/color_palette.dart';
import 'package:flutter/material.dart';

class TabBarWidgetCreateEvent extends StatelessWidget {
  final String text;
  final IconData? icon;
  final String? image;
  final bool isSelected;

  const TabBarWidgetCreateEvent({
    super.key,
    required this.text,
    this.icon,
    this.image,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? ColorPalette.primaryColor : Colors.transparent,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: ColorPalette.primaryColor,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

           if (icon != null)
            Icon(
              icon,
              color: isSelected ? ColorPalette.white : ColorPalette.primaryColor,
            ),
          const SizedBox(width: 5),
          Text(
            text,
            style: TextStyle(
              color: isSelected ? ColorPalette.white : ColorPalette.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}

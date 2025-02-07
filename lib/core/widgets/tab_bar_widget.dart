import 'package:eventely/core/theme/color_palette.dart';
import 'package:flutter/material.dart';

class TabBarWidget extends StatelessWidget {
  final String text;
  final IconData ? icon;
  final bool isSelected;
  final String? image;


  const TabBarWidget({
    super.key,
    required this.text,
    required this.icon,
    required this.isSelected,
    this.image,
  }
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:isSelected? ColorPalette.white: Colors.transparent ,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: ColorPalette.white,
        )
      ),
      padding: const EdgeInsets.all(4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon,
            color: isSelected?ColorPalette.primaryColor:ColorPalette.white,

          ),
          const SizedBox(
            width: 5,
          ),
           Text(
            text,
            style:  TextStyle(
              color: isSelected?ColorPalette.primaryColor:ColorPalette.white,
            ),
          ),
        ],
      ),
    );
  }
}

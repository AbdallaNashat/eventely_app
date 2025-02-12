import 'package:eventely/core/theme/color_palette.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final Color bgColor;
  final Color textColor;
  final String text;
  final double borderRadius;
  final Function()? onTab;
  const CustomElevatedButton(
      {super.key,
         this.onTab,
        required this.text,
        this.borderRadius = 16,
        this.bgColor = ColorPalette.primaryColor,
        this.textColor = ColorPalette.white,
      });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(8),
        backgroundColor: bgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius)
        )
      ),
        onPressed: onTab,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: textColor,
          ),
        ));
  }
}

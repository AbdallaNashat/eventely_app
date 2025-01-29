import 'package:flutter/material.dart';

extension PaddingExtension on Widget {
  Widget setHorizontalPadding (BuildContext context , double value,
      {bool enableMediaQuery = true}) {
    var mediaQuery= MediaQuery.of(context);
    return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: enableMediaQuery ?  mediaQuery.size.width * value : value,
        ),
      child: this,
    );
  }

  Widget setVerticalPadding (BuildContext context , double value,
      {bool enableMediaQuery = true}) {
    var mediaQuery= MediaQuery.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: enableMediaQuery ?  mediaQuery.size.height * value : value,
      ),
      child: this,
    );
  }
}

extension CenterExtension on Widget {
  Widget center() => Center(child: this);
}

extension BorderExtension on Widget {
  Widget withBorder({
    double width = 1.0,
    double radius = 8.0,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all( width: width),
        borderRadius: BorderRadius.circular(radius),
      ),
      child: this,
    );
  }
}

extension SizeExtension on Widget {
  Widget sized({double? width, double? height}) {
    return SizedBox(width: width, height: height, child: this);
  }
}

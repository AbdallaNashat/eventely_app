import 'package:eventely/model/on_boarding_model.dart';
import 'package:flutter/material.dart';

class OnBoardingItems extends StatelessWidget {
  final OnBoardingModel onBoardingModel;
  const OnBoardingItems({super.key, required this.onBoardingModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            onBoardingModel.imagePath,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            onBoardingModel.title,
            style: const TextStyle(
              color: Color(0xff5669FF),
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            onBoardingModel.description ?? "",
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}

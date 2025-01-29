import 'package:eventely/core/constants/app_assets.dart';
import 'package:eventely/core/theme/color_palette.dart';
import 'package:eventely/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(AppAssets.eventlyLogo ,
          height: size.size.height * 0.2,
          ),
          const Padding(
            padding:  EdgeInsets.symmetric(vertical: 8.0 , horizontal: 16.0),
            child:  CustomTextFormField(
              prefixIcon: ImageIcon(
                AssetImage(
                  AppAssets.emailIcon),
              ),
              hintText: "Email ",
              hintColor: ColorPalette.generalGrayColor ,
            ),
          ),
          const Padding(
            padding:  EdgeInsets.symmetric(vertical: 8.0 , horizontal: 16.0),
            child:  CustomTextFormField(
              isPassword: true,
              maxLines: 1,
              prefixIcon: ImageIcon(
                AssetImage(
                    AppAssets.lockIcon),
              ),
              hintText: "Password",
              hintColor: ColorPalette.generalGrayColor,
            ),
          ),
        ],
      ),
    );
  }
}

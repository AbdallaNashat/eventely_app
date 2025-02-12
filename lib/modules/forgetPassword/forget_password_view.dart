import 'package:eventely/core/constants/app_assets.dart';
import 'package:eventely/core/theme/color_palette.dart';
import 'package:flutter/material.dart';

import '../../core/widgets/custom_text_form_field.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPalette.white,
        title: const Text("Forget Password"),
        centerTitle:true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Image.asset(AppAssets.forgetPassword),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: CustomTextFormField(
              prefixIcon: ImageIcon(
                AssetImage(AppAssets.emailIcon),
              ),
              hintText: "Email ",
              hintColor: ColorPalette.generalGrayColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: ColorPalette.primaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  )),
              child: Text(
                "Reset Password",
                style: theme.textTheme.titleLarge?.copyWith(
                  color: ColorPalette.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

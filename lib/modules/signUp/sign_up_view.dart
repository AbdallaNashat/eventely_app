import 'package:eventely/core/constants/app_assets.dart';
import 'package:eventely/core/extinsions/validations.dart';
import 'package:eventely/core/routes/pages_route_name.dart';
import 'package:eventely/core/services/firebase_auth_service.dart';
import 'package:eventely/core/theme/color_palette.dart';
import 'package:eventely/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final navigatorKey = GlobalKey<NavigatorState>();
  final formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context);
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPalette.white,
        title: const Text("Register"),
        centerTitle: true,
      ),
      body: Form(
        key: formKey,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              AppAssets.eventlyLogo,
              height: size.size.height * 0.2,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: CustomTextFormField(
                onValidate: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Name is required";
                  }
                  return null;
                },
                onFieldSubmitted: (value) {},
                controller: _nameController,
                prefixIcon: const ImageIcon(
                  AssetImage(AppAssets.personIcon),
                ),
                hintText: "Name",
                hintColor: ColorPalette.generalGrayColor,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: CustomTextFormField(
                onValidate: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Email is required";
                  }
                  if (!Validations.validateEmail(value)) {
                    return "Email is required";
                  }
                  return null;
                },
                controller: _emailController,
                prefixIcon: const ImageIcon(
                  AssetImage(AppAssets.emailIcon),
                ),
                hintText: "Email",
                hintColor: ColorPalette.generalGrayColor,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: CustomTextFormField(
                onValidate: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "strong password is required";
                  }
                  if (!Validations.validatePassword(value)) {
                    return "strong password is required";
                  }
                  return null;
                },
                controller: _passwordController,
                isPassword: true,
                maxLines: 1,
                prefixIcon: const ImageIcon(
                  AssetImage(AppAssets.lockIcon),
                ),
                hintText: "Password",
                hintColor: ColorPalette.generalGrayColor,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: CustomTextFormField(
                onValidate: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Please Enter The Same As The Password";
                  }
                  if (value != _passwordController.text) {
                    return "Please Enter The Same As The Password";
                  }
                  return null;
                },
                isPassword: true,
                maxLines: 1,
                prefixIcon: const ImageIcon(
                  AssetImage(AppAssets.lockIcon),
                ),
                hintText: "Confirm Password",
                hintColor: ColorPalette.generalGrayColor,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16),
              child: ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {}
                  FirebaseAuthService.createAccount(
                    emailAddress: _emailController.text,
                    password: _passwordController.text,
                  ).then(
                    (value) {
                      EasyLoading.dismiss();
                      if (value == true) {
                        navigatorKey.currentState!.pushNamedAndRemoveUntil(PagesRouteName.signIn, (route) => false,);
                      }
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: ColorPalette.primaryColor,
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    )),
                child: Text(
                  "Create Account",
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: ColorPalette.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text.rich(
                textAlign: TextAlign.center,
                TextSpan(children: [
                  TextSpan(
                    text: "Already Have Account ?  ",
                    style: theme.textTheme.titleMedium,
                  ),
                  WidgetSpan(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(context, PagesRouteName.signIn,  (route) => false,);
                      },
                      child: Text(
                        "Login",
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: ColorPalette.primaryColor,
                          decoration: TextDecoration.underline,
                          decorationColor: ColorPalette.primaryColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

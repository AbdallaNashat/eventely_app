import 'package:eventely/core/constants/app_assets.dart';
import 'package:eventely/core/extinsions/validations.dart';
import 'package:eventely/core/routes/pages_route_name.dart';
import 'package:eventely/core/services/firebase_auth_service.dart';
import 'package:eventely/core/theme/color_palette.dart';
import 'package:eventely/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {

    final formKey = GlobalKey<FormState>();
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();

    var size = MediaQuery.of(context);
    var theme = Theme.of(context);
    return Scaffold(
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
                hintText: "Email ",
                hintColor: ColorPalette.generalGrayColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: CustomTextFormField(
                onValidate: (value) {
                  if (value == null || value.trim().isEmpty) {
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
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, PagesRouteName.forgetPassword);
                  },
                  child: Text("Forget Password?",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: ColorPalette.primaryColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            decoration: TextDecoration.underline,
                            decorationColor: ColorPalette.primaryColor,
                          )),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16),
              child: ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    EasyLoading.show(status: 'Logging in...');
                    bool loginSuccess = await FirebaseAuthService.login(
                      emailAddress: _emailController.text,
                      password: _passwordController.text,
                    );
                    EasyLoading.dismiss();
                    if (loginSuccess) {
                      Navigator.pushNamedAndRemoveUntil(context, PagesRouteName.layoutView, (route) => false);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Login failed. Please check your credentials.")),
                      );
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: ColorPalette.primaryColor,
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    )),
                child: Text(
                  "Login",
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
                    text: "Don’t Have Account ?  ",
                    style: theme.textTheme.titleMedium,
                  ),
                  WidgetSpan(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, PagesRouteName.signUp);
                      },
                      child: Text(
                        "Create Account",
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
            Row(
              children: [
                const Expanded(
                  child: Divider(
                    color: ColorPalette.primaryColor,
                    thickness: 2,
                    indent: 20,
                    endIndent: 20,
                  ),
                ),
                Text(
                  "OR",
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: ColorPalette.primaryColor,
                  ),
                ),
                const Expanded(
                  child: Divider(
                    color: ColorPalette.primaryColor,
                    thickness: 2,
                    indent: 20,
                    endIndent: 20,
                  ),
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: ColorPalette.white,
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: const BorderSide(
                            color: ColorPalette.primaryColor))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppAssets.googleIcon),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Sign In With Google",
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: ColorPalette.primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

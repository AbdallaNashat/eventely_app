import 'dart:async';
import 'package:eventely/core/constants/app_assets.dart';
import 'package:eventely/core/constants/local_storage_keys.dart';
import 'package:eventely/core/routes/pages_route_name.dart';
import 'package:eventely/core/services/local_storage_services.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2),
          () {
      var isFirstTimeRun = LocalStorageServices.getBool(LocalStorageKeys.isFirstTimeRun)??
            true;
      Navigator.pushNamedAndRemoveUntil(context,
        isFirstTimeRun?PagesRouteName.onBoarding: PagesRouteName.signIn,
          (route) => false,);
    },
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppAssets.eventlyLogo ,
            height: mediaQuery.size.height *0.22,
            ),
          ],
        ),
      ),
    );
  }
}

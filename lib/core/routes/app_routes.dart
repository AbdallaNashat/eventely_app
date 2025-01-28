import 'package:eventely/core/routes/pages_route_name.dart';
import 'package:eventely/modules/onBoarding/on_boarding_view.dart';
import 'package:eventely/modules/signIn/sign_in.dart';
import 'package:eventely/modules/spalsh/splash_view.dart';
import 'package:flutter/material.dart';

abstract class AppRoutes {
 static Route onGeneratedRoute(RouteSettings settings){
  switch(settings.name){
    case PagesRouteName.initial:
      return MaterialPageRoute(
        builder: (context) => const SplashView(),
          settings : settings,
      );

    case PagesRouteName.onBoarding:
      return MaterialPageRoute(
        builder: (context) => const OnBoardingView(),
          settings : settings,

      );
    case PagesRouteName.signIn:
      return MaterialPageRoute(
        builder: (context) => const SignIn(),
          settings : settings,
      );

    default:  return MaterialPageRoute(
      builder: (context) => const SplashView(),
      settings : settings,

    );
  }
 }
}
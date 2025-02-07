import 'package:eventely/core/routes/pages_route_name.dart';
import 'package:eventely/modules/create_event/create_event.dart';
import 'package:eventely/modules/forgetPassword/forget_password_view.dart';
import 'package:eventely/modules/onBoarding/on_boarding_view.dart';
import 'package:eventely/modules/signIn/sign_in.dart';
import 'package:eventely/modules/signUp/sign_up_view.dart';
import 'package:eventely/modules/spalsh/splash_view.dart';
import 'package:flutter/material.dart';

import '../../modules/layout_view/layout_view.dart';

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

    case PagesRouteName.signUp:
      return MaterialPageRoute(
        builder: (context) => const SignUp(),
        settings : settings,
      );

    case PagesRouteName.forgetPassword:
      return MaterialPageRoute(
        builder: (context) => const ForgetPasswordView(),
        settings : settings,
      );

    case PagesRouteName.layoutView:
      return MaterialPageRoute(
        builder: (context) => const LayoutView(),
        settings : settings,
      );

    case PagesRouteName.createEvent:
      return MaterialPageRoute(
        builder: (context) => const CreateEvent(),
        settings : settings,
      );

    default:  return MaterialPageRoute(
      builder: (context) => const SplashView(),
      settings : settings,

    );
  }
 }
}
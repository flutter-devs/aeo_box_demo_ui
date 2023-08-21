import 'package:aeo_box_demo_ui/presentation/views/home_screen/dashboard_screen.dart';
import 'package:aeo_box_demo_ui/presentation/views/on_boarding/login_landing_screen.dart';
import 'package:aeo_box_demo_ui/presentation/views/on_boarding/signin_screen.dart';
import 'package:aeo_box_demo_ui/presentation/views/on_boarding/signup_screen.dart';
import 'package:aeo_box_demo_ui/presentation/views/on_boarding/splash_screen.dart';
import 'package:flutter/material.dart';

import 'core/constants/route_constants.dart';

Route<dynamic> onGeneratedRoutes(RouteSettings settings) {
  switch (settings.name) {
    case RouteNames.splashScreen:
      return MaterialPageRoute(
        builder: (context) => const SplashScreen(),
        settings: settings,
      );

    case RouteNames.loginLanding:
      return MaterialPageRoute(
        builder: (context) => const LoginLandingScreen(),
        settings: settings,
      );

    case RouteNames.signIn:
      return MaterialPageRoute(
        builder: (context) => const SignInScreen(),
        settings: settings,
      );
    case RouteNames.signUp:
      return MaterialPageRoute(
        builder: (context) => const SignUpScreen(),
        settings: settings,
      );case RouteNames.dashboard:
      return MaterialPageRoute(
        builder: (context) => const DashBoardScreen(),
        settings: settings,
      );
    //
    // case RouteNames.bottomNavbar:
    //   return MaterialPageRoute(
    //     builder: (context) => BottomNavBarScreen(),
    //     settings: settings,
    //   );
    default:
      return MaterialPageRoute(builder: (context) => const SplashScreen());
  }
}

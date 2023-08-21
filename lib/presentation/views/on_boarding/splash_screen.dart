import 'package:flutter/material.dart';

import '../../../core/constants/constant_imports.dart';
import '../../../core/helper/routing_helper.dart';
import '../../widgets/custom/custom_scaffold_safe_area.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final String _redirectScreenName = RouteNames.loginLanding;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // await _decideRedirectScreen();
      Future.delayed(
        const Duration(seconds: 1),
        _redirectToScreen,
      );
    });
    super.initState();
  }

  // _decideRedirectScreen() async {
  //   const userGuid = 0;
  //
  //   if (userGuid > 0) {
  //     _redirectScreenName = RouteNames.bottomNavbar;
  //   }
  // }

  _redirectToScreen() async {
    RoutingHelper.pushNamedAndRemoveUntilRouteNamed(
      _redirectScreenName,
      ctx: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldSafeArea(
      body: SvgPicture.asset(
        ImageConstants.splashSvg,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}

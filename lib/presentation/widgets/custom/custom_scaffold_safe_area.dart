import 'package:flutter/material.dart';
import '../../../core/constants/constant_imports.dart';

class CustomScaffoldSafeArea extends StatelessWidget {
  final Color backgroundColor;
  final Widget body;
  final PreferredSizeWidget? appBar;
  final bool gradiantEnabled;

  const CustomScaffoldSafeArea({
    super.key,
    required this.body,
    this.appBar,
    this.backgroundColor = ColorConstants.white,
    this.gradiantEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // AppHelper.dismissKeyboard(ctx: context);
        // EasyLoading.dismiss();
        return true;
      },
      child: Scaffold(
        appBar: appBar,
        backgroundColor: backgroundColor,
        body: Container(
          decoration: gradiantEnabled
              ? const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      ColorConstants.white,
                      ColorConstants.loginGradiantClrDark,
                    ],
                    stops: [0.1, 0.7],
                  ),
                )
              : const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                ColorConstants.loginGradiantClrDark,
                ColorConstants.white,
              ],
              stops: [0.1, 0.7],
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: SafeArea(child: body),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

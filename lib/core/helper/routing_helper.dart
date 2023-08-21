import 'package:flutter/material.dart';

/// A convenient class wraps all functions of **RoutingHelper**
class RoutingHelper {
  /// this is a customize user define function
  /// this take some required input's for build and show bottomSheet
  /// and return the widget

  static void buildAndShowModalBottomSheetFor({
    bool isScrollControlled = true,
    required BuildContext ctx,
    required Widget widget,
  }) {
    showModalBottomSheet(
        isScrollControlled: isScrollControlled,
        backgroundColor: Colors.white,
        context: ctx,
        builder: (_) {
          return widget;
        });
  }

  /// this function is used for navigate the screen's
  /// it takes two inputs ctx and class name for navigating
  /// Push the given route onto the navigator,
  /// and then remove all the previous routes until the predicate returns true.
  static void pushAndRemoveUntilToScreen({
    required BuildContext ctx,
    required Widget screen,
  }) {
    debugPrint('pushAndRemoveUntilToScreen -> $screen');

    final route = MaterialPageRoute(builder: (ctx) => screen);
    Navigator.pushAndRemoveUntil(ctx, route, (route) => false);
  }

  static void pushNamedAndRemoveUntilRouteNamed(
    String routeName, {
    required BuildContext ctx,
  }) {
    debugPrint('pushNamedAndRemoveUntilRouteNamed -> $routeName');

    Navigator.pushNamedAndRemoveUntil(ctx, routeName, (route) => false);
  }

  /// this function is used for navigate the screen's
  /// it takes two inputs ctx and class name for navigating
  /// Push the given route onto the navigator,
  /// and not remove all the previous routes.

  static Future pushToRouteNamed({
    required BuildContext ctx,
    required String routeName,
    Object? arguments,
  }) {
    debugPrint('pushToRouteNamed -> $routeName');

    return Navigator.pushNamed(ctx, routeName, arguments: arguments);
  }

  static void pushReplacementToRouteNamed({
    required BuildContext ctx,
    required String name,
    Object? arguments,
  }) {
    debugPrint('pushReplacementToRouteNamed -> $name');

    Navigator.pushReplacementNamed(ctx, name, arguments: arguments);
  }

  static void pushToRouteNamedAnimated({
    required BuildContext ctx,
    required String name,
    Object? arguments,
  }) {
    debugPrint('pushToRouteNamedAnimated -> $name');

    Navigator.pushNamed(ctx, name, arguments: arguments);
  }
}

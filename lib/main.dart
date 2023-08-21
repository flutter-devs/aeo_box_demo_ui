import 'package:aeo_box_demo_ui/routes.dart';
import 'package:flutter/material.dart';

import 'core/constants/route_constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGeneratedRoutes,
      initialRoute: RouteNames.splashScreen,
      title: 'AeoBox Cloud Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
    );
  }
}


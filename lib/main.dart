import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:realestateapp/screens/landing_screen.dart';
import 'package:realestateapp/utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    double screenWidth = window.physicalSize.width;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: colorWhite,
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: colorDarkBlue),
        textTheme: screenWidth > 500 ? TEXT_THEME_SMALL : TEXT_THEME_DEFAULT,
      ),
      home: LandingPage(),
    );
  }
}

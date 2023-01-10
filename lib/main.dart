import 'package:flutter/material.dart';
import 'package:qr_code_scanner/homepage.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (
      BuildContext context,
      Orientation orientation,
      ScreenType screenType,
    ) {
      return MaterialApp(
        home: HomePage(),
      );
    });
  }
}

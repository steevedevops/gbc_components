import 'package:flutter/material.dart';

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  final swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}

class AppDefaultColor {
  
  static Color backgroundColor = const Color(0xffffffff);
  static Color scaffoldBackgroundColor = const Color(0xffF5F8FA);

  // CommonColors
  static Color ti00Color = const Color(0xff111827);
  static Color ti01Color = const Color(0xff263238);
  static Color ti02Color = const Color(0xff5E6278);
  static Color ti03Color = const Color(0xffA1A5B7);
  static Color ti04Color = const Color(0xffC5CAD3);
  static Color ti05Color = const Color(0xffF9F9F9);
  static Color ti06Color = const Color(0xffF5F8FA);
  static Color ti07Color = const Color(0xffD9D9D9);
  static Color ti08Color = const Color(0xffF4F4F4);
  static Color ti09Color = const Color(0xffE3E5EB);

  static Color borderColor = ti04Color;

  // Alertas
  static Color infoColor = const Color(0xff0358F1); 
  static Color erroColor = const Color(0xffF53D6B); 
  static Color sucessColor = const Color(0xff2DCA72);
  static Color warningColor = const Color(0xffF79E1E); 

  // Others
  static Color grey = const Color(0xffE3E5EB);
}


class AppDefaultFontSize { 
  static double sizeLabelSize = 13;
  static double fontSize11 = 11;
  static double fontSize12 = 12;
  static double fontSize13 = 13;
  static double fontSize14 = 14;
  static double fontSize15 = 15;
  static double fontSize16 = 16;
  static double cursorHeight = 15;
}


class AppDefaultSpaceSize { 
  static double spaceSize5 = 5;
  static double spaceSize10 = 10;
  static double spaceSize15 = 15;
  static double spaceSize20 = 20;
}

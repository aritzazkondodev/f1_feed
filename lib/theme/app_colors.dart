import 'package:flutter/material.dart';

// usage: Container(color: AppColors.container)
class AppColors {
  static Color darkBlack = const Color.fromARGB(255, 27, 28, 30);
  static Color intermediateBlack = const Color.fromARGB(255, 43, 43, 43);
  static Color softBlack = const Color.fromARGB(255, 48, 48, 48);

  static Color white = Colors.white;
  static Color softWhite = Color.fromARGB(255, 233, 233, 233);

  static Color mainColor = const Color.fromARGB(255, 255, 24, 1);
  static Color accentColor = const Color.fromARGB(255, 255, 140, 128);

  static Color danger = Colors.red;

  //EJEMPLOS
  static Color container = const Color.fromARGB(255, 37, 76, 95);
  static Color background = Colors.black;
  static Color textWhite = Colors.white;
  static Color textDark = Colors.grey;

  //CONSTRUCTORES
  static Color alfa = const Color.fromARGB(255, 201, 45, 75);
  static Color alphatauri = const Color.fromARGB(255, 94, 143, 170);
  static Color alpine = const Color.fromARGB(255, 0, 120, 193);
  static Color aston_martin = const Color.fromARGB(255, 53, 140, 117);
  static Color ferrari = const Color.fromARGB(255, 249, 21, 54);
  static Color haas = const Color.fromARGB(255, 182, 186, 189);
  static Color mclaren = const Color.fromARGB(255, 245, 128, 32);
  static Color mercedes = const Color.fromARGB(255, 108, 211, 191);
  static Color red_bull = const Color.fromARGB(255, 54, 113, 198);
  static Color williams = const Color.fromARGB(255, 4, 30, 66);

  Map<String, Color> toJson() {
    final Map<String, Color> data = <String, Color>{};
    data['alfa'] = alfa;
    data['alphatauri'] = alphatauri;
    data['alpine'] = alpine;
    data['aston_martin'] = aston_martin;
    data['ferrari'] = ferrari;
    data['haas'] = haas;
    data['mclaren'] = mclaren;
    data['mercedes'] = mercedes;
    data['red_bull'] = red_bull;
    data['williams'] = williams;
    return data;
  }
}

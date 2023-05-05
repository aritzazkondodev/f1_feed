import 'package:flutter/material.dart';

import 'package:f1_feed/theme/theme.dart';

class AppTheme {
  static final ThemeData ligthTheme = ThemeData(
    fontFamily: 'Formula1',
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: Colors.orange,
      secondary: Colors.orangeAccent,
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: AppColors.softWhite,
    textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.bold,
          color: AppColors.darkBlack,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          color: AppColors.darkBlack,
        ),
        headlineSmall: TextStyle(
          fontWeight: FontWeight.bold,
          color: AppColors.darkBlack,
        )),

    //Borde de los input(Textfield, ...)
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          width: 1,
          color: AppColors.mainColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          width: 1,
          color: AppColors.mainColor,
        ),
      ),
    ),

    //Color iconos
    iconTheme: IconThemeData(color: AppColors.white),
  );

  static final ThemeData darkTheme = ThemeData(
    fontFamily: 'Rubik',
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: Colors.orange,
      secondary: Colors.orangeAccent,
      brightness: Brightness.dark,
    ),
    scaffoldBackgroundColor: AppColors.softWhite,
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontSize: 35,
        fontWeight: FontWeight.bold,
        color: AppColors.white,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: AppColors.white,
      ),
    ),

    //Color iconos
    iconTheme: IconThemeData(color: AppColors.white),
  );
}

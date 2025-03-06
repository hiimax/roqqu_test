import 'package:flutter/material.dart';
import 'package:roqqu/resources/colors.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColors.primaryColor,
  scaffoldBackgroundColor: AppColors.lightBackground,
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.white,
    elevation: 0,
    surfaceTintColor: AppColors.transparent,
    iconTheme: IconThemeData(color: AppColors.black),
    titleTextStyle: TextStyle(
        color: AppColors.black, fontSize: 18, fontWeight: FontWeight.bold),
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(
        color: AppColors.lightStan, fontSize: 18, fontWeight: FontWeight.w500),
    bodyMedium: TextStyle(color: AppColors.lightStan, fontSize: 14),
    bodySmall: TextStyle(color: AppColors.lightStan, fontSize: 12),
    displayMedium: TextStyle(color: AppColors.lightStan, fontSize: 14),
  ),
  cardColor: AppColors.white,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: AppColors.white,
    selectedItemColor: AppColors.black,
    unselectedItemColor: AppColors.lightGrey,
  ),
  canvasColor: AppColors.lightCanvas,
  shadowColor: AppColors.lightCanvas,
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColors.lightGrey,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide.none,
    ),
  ),
  buttonTheme: ButtonThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    buttonColor: AppColors.primaryColor,
  ),
  bottomSheetTheme: BottomSheetThemeData(
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      backgroundColor: AppColors. white,
  )
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: AppColors.primaryColor,
  scaffoldBackgroundColor: AppColors.darkBackground,
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.darkBackground,
    elevation: 0,
    surfaceTintColor: AppColors.transparent,
    iconTheme: IconThemeData(color: AppColors.white),
    titleTextStyle: TextStyle(
        color: AppColors.white, fontSize: 18, fontWeight: FontWeight.bold),
  ),
  canvasColor: AppColors.darkBackground,
  shadowColor: AppColors.darkShadow,
  textTheme: TextTheme(
    bodyLarge: TextStyle(
        color: AppColors.lightStan, fontSize: 18, fontWeight: FontWeight.w500),
    bodyMedium: TextStyle(color: AppColors.white, fontSize: 14),
    bodySmall: TextStyle(color: AppColors.white, fontSize: 12),
  ),
  cardColor: AppColors.darkCard,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: AppColors.white,
    selectedItemColor: AppColors.primaryColor,
    unselectedItemColor: AppColors.lightGrey,
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColors.black,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide.none,
    ),
  ),
  buttonTheme: ButtonThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    buttonColor: AppColors.primaryColor,
  ),
   bottomSheetTheme: BottomSheetThemeData(
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      backgroundColor: AppColors. blackTint2,
  )
);

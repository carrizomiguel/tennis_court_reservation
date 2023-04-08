import 'package:flutter/material.dart';
import 'package:tennis_booking/ui/shared/shared.dart';

final ThemeData kLightTheme = ThemeData(
  useMaterial3: true,
  primaryColor: kPrimaryColor,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: kPrimaryColor,
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.white.withOpacity(0.6),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(kAccentColor),
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: kAccentColor,
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: kAccentColor,
    brightness: Brightness.light,
  ),
);

final ThemeData kDarkTheme = ThemeData(
  useMaterial3: true,
  primaryColor: kPrimaryColor,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: kPrimaryColor,
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.white.withOpacity(0.6),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(kAccentColor),
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: kAccentColor,
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: kAccentColor,
    brightness: Brightness.dark,
  ),
);

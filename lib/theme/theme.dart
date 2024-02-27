import 'package:flutter/material.dart';

final darkTheme = ThemeData(
    cardColor: Colors.black.withOpacity(0.5),
    textButtonTheme: TextButtonThemeData(
      style:
          ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white)),
    ),
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
        actionsIconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 63, 63, 62),
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700)),
    listTileTheme: const ListTileThemeData(iconColor: Colors.white),
    dividerColor: Colors.white24,
    scaffoldBackgroundColor: const Color.fromARGB(255, 9, 37, 53),
    useMaterial3: true,
    textTheme: TextTheme(
        headlineMedium: const TextStyle(color: Colors.black, fontSize: 14),
        headlineSmall: const TextStyle(color: Colors.white, fontSize: 12),
        headlineLarge: const TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.w800),
        bodyMedium: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),
        labelSmall: TextStyle(
            color: Colors.green.withOpacity(0.8),
            fontWeight: FontWeight.w700,
            fontSize: 20),
        labelMedium: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20)));

final lightTheme = ThemeData(
    cardColor: Colors.white,
    textButtonTheme: TextButtonThemeData(
      style:
          ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black)),
    ),
    appBarTheme: const AppBarTheme(
        actionsIconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700)),
    listTileTheme: const ListTileThemeData(iconColor: Colors.black),
    dividerColor: Colors.black,
    scaffoldBackgroundColor: const Color.fromARGB(255, 209, 205, 205),
    useMaterial3: true,
    textTheme: const TextTheme(
        headlineMedium: TextStyle(color: Colors.white, fontSize: 14),
        headlineSmall: TextStyle(color: Colors.black, fontSize: 12),
        headlineLarge: TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.w800),
        bodyMedium: TextStyle(
            color: Colors.black, fontWeight: FontWeight.w500, fontSize: 20),
        labelSmall: TextStyle(
            color: Colors.green, fontWeight: FontWeight.w700, fontSize: 20),
        labelMedium: TextStyle(
            color: Colors.black, fontWeight: FontWeight.w600, fontSize: 20)));

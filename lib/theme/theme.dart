import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

final darkTheme = ThemeData(
    appBarTheme: const AppBarTheme(
        actionsIconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 63, 63, 62),
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700)),
    listTileTheme: const ListTileThemeData(iconColor: Colors.white),
    dividerColor: Colors.white24,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
    scaffoldBackgroundColor: Color.fromARGB(255, 61, 65, 63),
    useMaterial3: true,
    textTheme: TextTheme(
        bodyMedium: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),
        labelSmall: TextStyle(
            color: Colors.white.withOpacity(0.6),
            fontWeight: FontWeight.w700,
            fontSize: 14)));

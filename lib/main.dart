import 'package:flutter/material.dart';

import 'package:harta_bendahara/architecture/dashboard.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 90, 90, 210));

void main() {
  runApp(
     MaterialApp(
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: const Color.fromARGB(255, 79, 66, 181),
          foregroundColor: kColorScheme.onPrimary,
        ),
        cardTheme:const CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor:const Color.fromARGB(255, 118, 194, 226),
          )
        ),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)
        ),
        ),
      home:const Dashboard(),
    ),
  );
}
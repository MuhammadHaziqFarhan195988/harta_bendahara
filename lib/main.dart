import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:harta_bendahara/architecture/dashboard.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 90, 90, 210));

var kDarkColorScheme = ColorScheme.fromSeed( //for dark mode
brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 5, 99, 125) 
  );

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,

  // ]).then((orientationScreen) {
runApp(
     MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkColorScheme,
        cardTheme:const CardTheme().copyWith(
          color: kDarkColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor:kDarkColorScheme.primaryContainer,
            foregroundColor: kDarkColorScheme.onPrimaryContainer
          )
        ),
      ),
      theme: ThemeData().copyWith(
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
          titleLarge: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black)
        ),
        ),

   //     themeMode: ThemeMode.system, //default
      home:const Dashboard(),
    ),
  );

  // } );
  
}
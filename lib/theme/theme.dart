import 'package:flutter/material.dart';

final theme = ThemeData(
  // Define the default brightness and colors.
  colorScheme: const ColorScheme(
    primary: Colors.blue, // focus
    onPrimary: Colors.black,
    primaryVariant: Colors.orange,

    background: Colors.red,
    onBackground: Colors.green,

    secondary: Colors.brown, //float action button
    onSecondary: Colors.white,
    secondaryVariant: Colors.deepOrange,

    error: Colors.indigo,
    onError: Colors.grey,

    surface: Colors.lime, // AppBar
    onSurface: Colors.blue, //icons, inputs

    brightness: Brightness.light,
  ),

  // Define the default font family.
  fontFamily: 'Hind',

  // Define the default `TextTheme`. Use this to specify the default
  // text styling for headlines, titles, bodies of text, and more.
  textTheme: const TextTheme(
    headline1: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
    headline6: TextStyle(fontSize: 20.0),
    bodyText2: TextStyle(fontSize: 18.0),
  ),
);

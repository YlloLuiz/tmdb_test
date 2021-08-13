import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  primaryColor: Colors.white,
  accentColor: Colors.green.shade600,
  errorColor: Colors.redAccent.shade200,
  splashColor: Colors.green.shade600,
  disabledColor: Colors.black38,
  scaffoldBackgroundColor: Colors.white,
  accentTextTheme: TextTheme(
    button: TextStyle(color: Colors.green.shade600),
  ),
  buttonColor: Colors.green.shade600,

  /// Sub themes
  inputDecorationTheme: _inputDecoration,
);

InputDecorationTheme _inputDecoration = InputDecorationTheme(
  hintStyle: TextStyle(
    color: Colors.black38,
    fontWeight: FontWeight.w500,
  ),
  disabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.black38,
    ),
  ),
  border: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.black38,
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.black38,
    ),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.redAccent.shade200,
      width: 2,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.green.shade600,
      width: 2,
    ),
  ),
);

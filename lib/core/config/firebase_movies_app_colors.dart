import 'package:flutter/material.dart';

class FirebaseMoviesAppColors {
  static final FirebaseMoviesAppColors _singleton = FirebaseMoviesAppColors._internal();

  factory FirebaseMoviesAppColors() {
    return _singleton;
  }
  
  FirebaseMoviesAppColors._internal();

  // Black
  static Color get primaryColor => const Color(0xFF000000);

  //Blue
  static Color get secondaryColor => const Color(0xFF2962FF);

  // Red
  static Color get errorColor => const Color(0xFFDC3545);
  static Color get favoriteColor =>  Colors.redAccent;

  //White
  static Color get whiteColor => const Color(0xFFFFFFFF);

  //Green
  static Color get successColor =>  Colors.green;
}
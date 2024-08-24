import 'package:flutter/material.dart';
import 'package:movies_app/core/config/firebase_movies_app_colors.dart';

class FirebaseMoviesAppMaterial {
  static final FirebaseMoviesAppMaterial _singleton =
      FirebaseMoviesAppMaterial._internal();

  factory FirebaseMoviesAppMaterial() {
    return _singleton;
  }

  FirebaseMoviesAppMaterial._internal();

  static const String title = 'Movies App';

  static const Locale locale = Locale('pt_BR');

  static ThemeData get getTheme => ThemeData(
        scaffoldBackgroundColor: FirebaseMoviesAppColors.primaryColor,
        primaryColor: FirebaseMoviesAppColors.primaryColor,
        appBarTheme: AppBarTheme(
          backgroundColor: FirebaseMoviesAppColors.primaryColor,
          titleTextStyle: TextStyle(
              color: FirebaseMoviesAppColors.whiteColor,
              fontWeight: FontWeight.bold,
              fontSize: 16),
          centerTitle: true,
          elevation: 0,
        ),
        fontFamily: 'Lato'
      );
}

import 'package:flutter/material.dart';
import 'package:movies_app/presentation/login/screens/login_screen.dart';
import 'package:movies_app/presentation/movie_details/screens/movie_details_screen.dart';
import 'package:movies_app/presentation/nav/screens/nav_screen.dart';
import 'package:movies_app/presentation/signup/screens/signup_sreen.dart';
import 'package:movies_app/presentation/spalsh/screens/spalsh_screen.dart';

class FirebaseMoviesAppRoutes {
  static final FirebaseMoviesAppRoutes _singleton =
      FirebaseMoviesAppRoutes._internal();

  factory FirebaseMoviesAppRoutes() {
    return _singleton;
  }

  FirebaseMoviesAppRoutes._internal();
  // com a mesma assinatura do "routes" dos widgtes, para ficar mais organizado
  static Map<String, Widget Function(BuildContext)> getRoutes() {
    return {
      SpalshScreen.routeName: (_) {
        return const SpalshScreen();
      },
      LoginScreen.routeName: (_) {
        return const LoginScreen();
      },
      SignupSreen.routeName: (_) {
        return const SignupSreen();
      },
      NavScreen.routeName: (_) {
        return const NavScreen();
      },
      MovieDetailsScreen.routeName: (_) {
        return const MovieDetailsScreen();
      },
    };
  }
}

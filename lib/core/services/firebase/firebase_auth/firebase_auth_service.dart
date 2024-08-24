import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthService {
  static final FirebaseAuthService _singleton = FirebaseAuthService._internal();

  factory FirebaseAuthService() {
    return _singleton;
  }

  FirebaseAuthService._internal();

  static User? get getUser => FirebaseAuth
      .instance.currentUser; // para saber se  o usuário está logado.

  static Stream<User?> getUserStream(BuildContext context) => FirebaseAuth
      .instance
      .authStateChanges(); // usar para quando estiver logado, para atualizar essas dados quando houver qualquer alteração.

  static Future<String?> login(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  static Future<(String? error, UserCredential?)> signup(
      String email, String password) async {
    try {
      final UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return (null, user);
    } on FirebaseAuthException catch (e) {
      return (e.message, null);
    }
  }

  static Future<String?> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}

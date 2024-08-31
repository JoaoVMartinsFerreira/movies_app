import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/services/firebase/firebase_auth/firebase_auth_service.dart';

class SignupController {
  final signUpFormKey = GlobalKey<FormState>();

  Future<(String? error, bool success)> onSignUp(String email, String password) async{
    if(signUpFormKey.currentState!.validate()){
      final (String? error, UserCredential?  user) = 
        await FirebaseAuthService.signup(email, password);
        if (user != null) {
          return (null, true);
        }
        return (error, false);
    }

    return (null, false);
  }
}
import 'package:flutter/material.dart';
mixin LoginTextEditingControllers {
  final emailTEC  = TextEditingController();
  final passwordTEC = TextEditingController();

  void disposeLogginTECs(){
    emailTEC.dispose();
    passwordTEC.dispose();
  }
}
import 'package:flutter/material.dart';

mixin SignupTextEditingControllerMixin {

  final emailTEC = TextEditingController();
  final passwordTEC = TextEditingController();

  void disposeTECs(){
    emailTEC.dispose();
    passwordTEC.dispose();
  }
}

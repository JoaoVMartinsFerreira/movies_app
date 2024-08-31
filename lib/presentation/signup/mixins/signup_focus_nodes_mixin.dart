import 'package:flutter/material.dart';

mixin SignupFocusNodesMixin {
  final emailFN = FocusNode();
  final passwordFN = FocusNode();

  void disposeFN(){
    emailFN.dispose();
    passwordFN.dispose();
  }
}
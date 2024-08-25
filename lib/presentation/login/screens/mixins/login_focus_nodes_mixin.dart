import 'package:flutter/material.dart';

mixin LoginFocusNodesMixin {
 final emailFN = FocusNode();
 final passwordFN = FocusNode();

  void dispose(){
   emailFN.dispose();
   passwordFN.dispose(); 
  }
}
import 'package:flutter/material.dart';
import 'package:movies_app/core/widgets/buttons/button_widget.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/login';
  const LoginScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: ButtonWidget(label: 'Login', onPressed: (){},),),
    );
  }
}
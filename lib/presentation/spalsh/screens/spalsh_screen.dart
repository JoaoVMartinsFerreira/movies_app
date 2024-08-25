import 'package:flutter/material.dart';
import 'package:movies_app/core/services/firebase/firebase_auth/firebase_auth_service.dart';
import 'package:provider/provider.dart';

import '../widgets/splash_screen_widget.dart';

class SpalshScreen extends StatelessWidget {
  static const String routeName = '/spash';
  const SpalshScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // é uma valor para recueprar de qualauqer lugar da aplicação e observar as alterações.
    return StreamProvider.value(
      value: FirebaseAuthService.getUserStream(context),
      initialData: null,
      child: const Scaffold(
        body: SplashScreenWidget(),
      ),
    );
  }
}

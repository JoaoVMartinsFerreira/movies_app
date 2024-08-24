import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  static final FirebaseService _singleton = FirebaseService._internal();

  factory FirebaseService() {
    return _singleton;
  }
  
  FirebaseService._internal();

  static Future<void> init()async{
    WidgetsFlutterBinding.ensureInitialized(); // para garantir que está inicializado
    final firebaseApp = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    FirebaseFirestore.instanceFor(app: firebaseApp);
  }
}
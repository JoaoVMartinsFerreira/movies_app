
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movies_app/core/config/firebase_movies_app.dart';

import 'core/services/firebase/firebase_service.dart';

void main() async{ 
  await FirebaseService.init();
  await dotenv.load();
  runApp(const FirebaseMoviesApp());
}



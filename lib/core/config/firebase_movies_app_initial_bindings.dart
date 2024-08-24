import 'package:provider/provider.dart';

import '../factories/api_repository_factory.dart';

class FirebaseMoviesAppInitialBindings {
  static final FirebaseMoviesAppInitialBindings _singleton = FirebaseMoviesAppInitialBindings._internal();

  factory FirebaseMoviesAppInitialBindings() {
    return _singleton;
  }
  
  FirebaseMoviesAppInitialBindings._internal();

  static List<Provider> dependencies(){
    return [ //
      makeApiRepository,
    ];
  }
}
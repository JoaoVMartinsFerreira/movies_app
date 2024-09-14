import 'package:flutter/material.dart';
import 'package:movies_app/core/services/firebase/firebase_store/firebase_store_service.dart';
import 'package:provider/provider.dart';

import '../../../core/factories/video_player_factory.dart';
import '../factories/movies_widget_controller_factory.dart';
import '../factories/nav_controller_factory.dart';

class NavScreen extends StatelessWidget {
  static const String routeName = '/nav';
  const NavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        makeNavController(context),
        makeVideoPlayer,
        makeMoviesWidgetController,
        StreamProvider.value(
          value: FirebaseStoreService().getFavoriteMovies,
          initialData: null,
        )
      ],
      child: Container(),
    );
  }
}

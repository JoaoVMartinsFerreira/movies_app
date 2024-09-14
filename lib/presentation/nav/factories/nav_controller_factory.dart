import 'package:flutter/material.dart';
import 'package:movies_app/data/repositories/api_repository/i_api_repository.dart';
import 'package:movies_app/data/repositories/movies_repository/get_movies_repository.dart';
import 'package:movies_app/presentation/nav/controllers/nav_controller.dart';
import 'package:provider/provider.dart';

import '../../../data/repositories/movies_repository/get_movie_video_repository.dart';

ChangeNotifierProvider<NavController> makeNavController(BuildContext context) =>
    ChangeNotifierProvider<NavController>(
      create: (_) => NavController(
        GetMoviesRepository(
          Provider.of<IApiRepository>(context),
          GetMovieVideoRepository(
            Provider.of<IApiRepository>(context),
          ),
        ),
      ),
    );

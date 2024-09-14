import 'package:flutter/material.dart';
import 'package:movies_app/data/models/movie_model.dart';
import 'package:movies_app/data/repositories/movies_repository/get_movies_repository.dart';

class NavController extends ChangeNotifier {
  final GetMoviesRepository _getMoviesRepo;

  NavController(this._getMoviesRepo);

  int navIndex = 0;

  final List<MovieModel> moviesList = [];

  String get getTitle{
    if (navIndex == 0) {
      return 'Filmes';
    }
    return 'Filmes Favoritos';
  }

  void slectNavIndex(int index){
    navIndex = index;
    notifyListeners();
  }

  Future<String?> getMovies() async{
    final (String? errorLoadingMovies, List<MovieModel> movies) = await _getMoviesRepo.getMovies();
    moviesList..clear()..addAll(movies);

    notifyListeners();

    return errorLoadingMovies;
  }
}
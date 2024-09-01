import 'package:movies_app/data/models/api_response_model.dart';
import 'package:movies_app/data/models/movie_model.dart';
import 'package:movies_app/data/models/video_model.dart';
import 'package:movies_app/data/repositories/movies_repository/get_movie_video_repository.dart';

import '../api_repository/i_api_repository.dart';

class GetMoviesRepository {
  final IApiRepository _api;
  final GetMovieVideoRepository _getMovieVideoRepository;

  GetMoviesRepository(this._api, this._getMovieVideoRepository);

  Future<(String? error, List<MovieModel> movies)> getMovies() async {
    final (
      String? getMoviesError,
      ApiResponseModel<Map>? moviesResponse
    ) = await _api.get(
        "/3/discover/movie?include_adult=false&language=pt-BR&page=1&sort_by=popularity.desc");

    final movieToReturn = <MovieModel>[];

    if (moviesResponse != null) {
      final moviesResults = moviesResponse.data['results'] as List;

      final List<Future<(String?, VideoModel?)>> moviesFuturesList = // É uma lista de funções assíncronas por que precisamos carregar o trailer de cada filme
          moviesResults
              .map<Future<(String?, VideoModel?)>>((movie) =>
                  _getMovieVideoRepository.getMovieVideo(movie['id'] as int))
              .toList();

     final videosResonse = await Future.wait(moviesFuturesList); // aqui ele chama o .getMovieVideo ao mesmo tempo.
     for (final movie in moviesResults) {
       final int videoIndex = videosResonse.indexWhere((video) => video.$2?.movieId == movie['id']); //ao desestruturar a variável queremos acessar o segundo valor. $1 seria o primeiro valor e $2 o segundo valor.

       if (videoIndex != -1) {
         movie['videoKey'] = videosResonse[videoIndex].$2?.videoKey; //está inserindo o videoKey dentro do map do filme
       }
     }
     final movies = moviesResults.map((movie) => MovieModel.fromMap(movie)).toList();

     movieToReturn.addAll(movies);
    }
    return(getMoviesError, movieToReturn);
  }
}

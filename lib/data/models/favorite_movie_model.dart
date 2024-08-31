import 'package:movies_app/data/models/movie_model.dart';

class FavoriteMovieModel extends MovieModel {
  final String favoriteId;
  FavoriteMovieModel({
    required this.favoriteId,
    required super.id,
    required super.title,
    required super.imagePath,
    required super.overview,
    required super.releaseDate,
    required super.voteAverage,
    super.videoId,
  });

  factory FavoriteMovieModel.fromMap(Map<String, dynamic> map, String favoriteId) {
    return FavoriteMovieModel(
      favoriteId: favoriteId,
      id: map['id'] as int,
      title: map['title'] as String,
      imagePath: map['poster_path'] as String,
      overview: map['overview'] as String,
      releaseDate: DateTime.parse(map['release_date'] as String),
      voteAverage: map['vote_average'] as num,
      videoId: map['videoKey'],
    );
  }
  
  @override
  Map<String, dynamic> toMap(){
    return <String,dynamic>{
      'id': id,
      'title': title,
      'poster_path': imagePath,
      'overview': overview,
      'releaseDate': releaseDate.toIso8601String(),
      'vote_average':  voteAverage,
      'videoKey': videoId
    };
  }
}

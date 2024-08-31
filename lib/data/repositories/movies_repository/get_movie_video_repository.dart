import 'package:movies_app/data/models/api_response_model.dart';
import 'package:movies_app/data/repositories/api_repository/i_api_repository.dart';

import '../../models/video_model.dart';

class GetMovieVideoRepository {
  final IApiRepository _api;

  GetMovieVideoRepository(this._api);

  Future<(String? error, VideoModel?  video)> getMovieVideo(int movieId) async{
    final(String? error, ApiResponseModel<Map>? response) = await _api.get('3/movie/$movieId/videos?language=pt-BR');

    if(response != null){
      final results = response.data['results'] as List;
      if(results.isNotEmpty){
        ((results.first) as Map)['movieId']  = movieId;
        final video = VideoModel.fromMap(results.first);
           return(null, video);
      }
      return("Trailer indisponível", null);
    }

    return(error, null);
  }
}
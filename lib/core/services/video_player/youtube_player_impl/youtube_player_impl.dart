  import 'package:movies_app/core/services/video_player/i_video_player.dart';
  import  'package:youtube_player_iframe/youtube_player_iframe.dart';

class YoutubePlayerImpl implements IVideoPlayer<YoutubePlayerController>{
  final YoutubePlayerController youtubePlayerCtrl;

  YoutubePlayerImpl({required this.youtubePlayerCtrl}); // passando por injeção  de depenência porque a interface IVideoPlayer  não depende do ytController.
  @override
  get getController =>  youtubePlayerCtrl;

  @override
  Future<void> load(String videoId, [bool loop = true]) {
    
    return youtubePlayerCtrl.loadVideoById(videoId: videoId);
  }

  @override
  Future<void> mute() {
    return youtubePlayerCtrl.mute();
  }

  @override
  Future<void> pause() {
    return youtubePlayerCtrl.pauseVideo();
  }

  @override
  Future<void> play() {
    return youtubePlayerCtrl.playVideo();
  }

  @override
  Future<void> unmute() {
    return youtubePlayerCtrl.unMute();
  }
    
  }
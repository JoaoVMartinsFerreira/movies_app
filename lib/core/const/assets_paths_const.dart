class AssetsPathsConst {
  static final AssetsPathsConst _singleton = AssetsPathsConst._internal();

  factory AssetsPathsConst() {
    return _singleton;
  }

  AssetsPathsConst._internal();

  static const String _animationFolder = 'assets/animations';

  static String get animationSplash =>
      '$_animationFolder/34590-movie-theatre.json';
      
  static String get animationLogin =>
      '$_animationFolder/26406-clapperboard.json';
}

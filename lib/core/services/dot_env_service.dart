import 'package:flutter_dotenv/flutter_dotenv.dart';

class DotEnvService {
  static final DotEnvService _singleton = DotEnvService._internal();

  factory DotEnvService() {
    return _singleton;
  }
  
  DotEnvService._internal();

  static String get getApiBaseUrl => dotenv.env['API_BASE_URL'] as String;

  static String get getApiImagesBaseUrl => dotenv.env['API_IMG_URL'] as String;

  static String get getApiToken => dotenv.env['API_TOKEN'] as String;

  static String get getVideoApiUrl => dotenv.env['API_VIDEO'] as String;
}
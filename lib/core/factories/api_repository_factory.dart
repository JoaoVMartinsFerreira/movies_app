import 'package:dio/dio.dart';
import 'package:movies_app/core/services/dot_env_service.dart';
import 'package:movies_app/data/repositories/api_repository/dio/dio_repository.dart';
import 'package:movies_app/data/repositories/api_repository/i_api_repository.dart';
import 'package:provider/provider.dart';

final makeApiRepository = Provider<IApiRepository>(
  create: (_) => DioRepositoryImpl(
    Dio(
      BaseOptions(
        baseUrl: DotEnvService.getApiBaseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    ),
  ),
);

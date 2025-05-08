import 'package:dio/dio.dart';
import 'package:udece_app/src/core/constants/api_constants.dart';

final dio = Dio(
  BaseOptions(
    baseUrl: ApiConstants.baseUrl,
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
    headers: {"Content-Type": "application/json"},
  ),
);

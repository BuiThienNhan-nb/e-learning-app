import 'package:dio/dio.dart';
import 'package:e_learning_app/core/app/values.dart';

abstract class BaseApi {
  Dio get dio => _initDio();

  Dio _initDio() {
    final Dio dio = Dio();

    final env = AppValues.instance.env;

    dio
      ..options.baseUrl = env.baseUrl
      ..options.connectTimeout = env.connectionTimeOut
      ..options.receiveTimeout = env.receiveTimeOut
      ..options.headers = {'Content-Type': 'application/json; charset=utf-8'};

    return dio;
  }
}

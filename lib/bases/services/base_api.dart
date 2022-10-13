import 'dart:io';

import 'package:dio/dio.dart';
import 'package:e_learning_app/core/app/values.dart';
import 'package:flutter/foundation.dart';

abstract class BaseApi {
  final Dio dio = Dio();

  List<Interceptor>? interceptors;

  BaseApi() {
    final env = AppValues.instance.env;

    dio
      ..options.baseUrl = env.baseUrl
      ..options.connectTimeout = env.connectionTimeOut
      ..options.receiveTimeout = env.receiveTimeOut
      ..httpClientAdapter
      ..options.headers = {'Content-Type': 'application/json; charset=utf-8'};

    if (interceptors?.isNotEmpty ?? false) {
      dio.interceptors.addAll(interceptors!);
    }
    if (kDebugMode) {
      dio.interceptors.add(
        LogInterceptor(
          responseBody: true,
          error: true,
          requestHeader: false,
          responseHeader: false,
          request: false,
          requestBody: false,
        ),
      );
    }
  }

  Future<dynamic> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> post(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}

import 'package:dio/dio.dart';
import 'package:e_learning_app/bases/services/base_api.dart';
import 'package:e_learning_app/generated/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../core/error/failures.dart';

abstract class Api extends BaseApi {
  Failure exceptionToFailure(Object exception) {
    String? message;

    if (exception is DioError) {
      switch (exception.type) {
        case DioErrorType.cancel:
          break;
        case DioErrorType.connectTimeout:
          message = LocaleKeys.connectTimeOUt.tr();
          break;
        case DioErrorType.receiveTimeout:
          break;
        case DioErrorType.response:
          switch (exception.response?.statusCode) {
            case 400:
              message = LocaleKeys.m400.tr();
              break;
            case 401:
              message = LocaleKeys.m401.tr();
              break;
            case 403:
              message = LocaleKeys.m403.tr();
              break;
            case 404:
              message = LocaleKeys.m404.tr();
              break;
            default:
              message = LocaleKeys.serverUnexpectedError.tr();
              break;
          }
          break;
        case DioErrorType.sendTimeout:
          break;
        case DioErrorType.other:
          break;
      }

      return UserFailure(message ?? LocaleKeys.serverUnexpectedError.tr());
    }
    return ServerFailure(exception.toString());
  }
}

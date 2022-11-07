import 'dart:async';
import 'package:dio/dio.dart';

import 'custom_on_error.dart';

class AppInterceptors extends Interceptor {
  @override
  Future<FutureOr> onError(
      DioError err, ErrorInterceptorHandler handler) async {
    final customError = await customOnError(err);
    handler.next(customError);
  }

  @override
  Future<dynamic> onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    handler.next(response);
  }
}

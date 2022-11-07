import 'package:dio/dio.dart';

import '../domain/repositories/http_proxy_repository.dart';
import 'interceptors/interceptor.dart';

class HttpImpl extends HttpProxyInterface {
  late Dio _http;
  HttpImpl() {
    _http = Dio()
      ..interceptors.add(AppInterceptors())
      ..options.connectTimeout = 40000
      ..options.receiveTimeout = 40000
      ..options.sendTimeout = 3000;
  }

  @override
  Dio instance() => _http;
}

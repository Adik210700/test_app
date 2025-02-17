import 'dart:developer';

import 'package:dio/dio.dart';

String baseUrl = 'https://github.com/fedeperin/potterapi';
const _duration = Duration(seconds: 30);

class AppDio {
  final Dio dio = Dio(BaseOptions(
    baseUrl: baseUrl,
    sendTimeout: _duration,
    connectTimeout: _duration,
    receiveTimeout: _duration,
  ));

  AppDio() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          log(options.path);
          log(options.uri.toString());
          log(options.queryParameters.toString());

          return handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          log(response.data);
          log(response.statusCode.toString());
          log(response.realUri.toString());

          return handler.next(response);
        },
        onError: (DioException error, ErrorInterceptorHandler handler) {
          // Do something with response error.
          // If you want to resolve the request with some custom data,
          // you can resolve a `Response` object using `handler.resolve(response)`.
          return handler.next(error);
        },
      ),
    );
  }
}

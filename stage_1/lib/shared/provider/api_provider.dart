import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:stage_1/constants/app_data.dart';
import 'package:stage_1/shared/provider/error_response.dart';

import 'log_provider.dart';
import 'package:flutter/foundation.dart';
import 'dart:io' as IO;

class ApiProvider {
  late Dio _dio;
  LogProvider get logger => const LogProvider('👋 ApiProvider');
  static final ApiProvider _instance = ApiProvider._internal();
  factory ApiProvider() {
    return _instance;
  }
  ApiProvider._internal() {
//     HttpClient client = new HttpClient();
// client.badCertificateCallback = ((X509Certificate cert, String host, int port) => true);
    final BaseOptions baseOptions = BaseOptions(baseUrl: AppData().baseUrl);
    _dio =  _dioClient(baseOptions);
  
    // _dio.badCertificateCallback =((X509Certificate cert, String host, int port) => true);
    // _dio.options.
    setUpInterceptor();
  }

  static Dio _dioClient(BaseOptions options) {
    Dio dio = Dio(options); // Getting Headers and Other data

    if (!kIsWeb) {
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (IO.HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };
    }
    return dio;
  }

  void setUpInterceptor() {
    _dio.interceptors.add(InterceptorsWrapper(
        onRequest: (options, handler) {
          logger.log('[${options.method}] - ${options.uri}');
          handler.next(options);
        },
        onResponse: (options, handler) => handler.next(options),
        onError: (DioError e, handler) {
          logger.log('😭 ' + e.toString());
          handler.next(e);
        }));
  }

  Future<Response> get(String path,
      {Map<String, dynamic>? querryParameter,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onReceiveProgress}) async {
    final res = await _dio.get(path,
        queryParameters: querryParameter,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress);
    if (res is! ErrorResponse) {
      return res;
    }
    throw res;
  }

  Future<Response> post(String path,
      {data,
      Map<String, dynamic>? querryParameter,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onReceiveProgress}) async {
    final res = await _dio.post(path,
        data: data,
        queryParameters: querryParameter,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress);
    if (res is! ErrorResponse) {
      return res;
    }
    throw res;
  }

  Future<Response> put(String path,
      {data,
      Map<String, dynamic>? querryParameter,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onReceiveProgress}) async {
    final res = await _dio.put(path,
        data: data,
        queryParameters: querryParameter,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress);
    if (res is! ErrorResponse) {
      return res;
    }
    throw res;
  }

  Future<Response> delete(
    String path, {
    data,
    Map<String, dynamic>? querryParameter,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    final res = await _dio.delete(
      path,
      data: data,
      queryParameters: querryParameter,
      options: options,
      cancelToken: cancelToken,
    );
    if (res is! ErrorResponse) {
      return res;
    }
    throw res;
  }
}

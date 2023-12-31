import 'package:dio/dio.dart';
import 'package:stage_1/constants/app_data.dart';
import 'package:stage_1/shared/provider/error_response.dart';

import 'log_provider.dart';

class Apiv1Provider {
  late Dio _dio;
  LogProvider get logger => const LogProvider('👋 Apiv1Provider');
  static final Apiv1Provider _instance = Apiv1Provider._internal();
  factory Apiv1Provider() {
    return _instance;
  }
  Apiv1Provider._internal() {
    final BaseOptions baseOptions = BaseOptions(baseUrl: AppData().baseUrlv1);
    _dio = Dio(baseOptions);
    setUpInterceptor();
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
}

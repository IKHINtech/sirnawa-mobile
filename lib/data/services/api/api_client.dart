import 'dart:async';

import 'package:dio/dio.dart';
import 'package:sirnawa_mobile/config/app_config.dart';
import 'package:sirnawa_mobile/data/services/api/dio_client.dart';

typedef AuthHeaderProvider = String? Function();


class ApiClient {
  final Dio _dio;
  AuthHeaderProvider? _authHeaderProvider;
  Future<String?> Function()? _refreshTokenCallback;
  bool _isRefreshing = false;
  final List<Function()> _retryQueue = [];

  ApiClient({Dio? dio})
      : _dio = dio ?? DioClient.create(baseUrl: AppConfig.apiBaseUrl) {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onError: (DioException error, ErrorInterceptorHandler handler) async {
          if (_isTokenExpiredError(error)) {
            if (!_isRefreshing) {
              _isRefreshing = true;
              final newToken = await _refreshTokenCallback?.call();
              _isRefreshing = false;

              if (newToken != null) {
                _authHeaderProvider = () => newToken;
                for (final retry in _retryQueue) {
                  retry();
                }
                _retryQueue.clear();
              } else {
                return handler.reject(error);
              }
            }

            final requestOptions = error.requestOptions;
            final completer = Completer<Response>();

            _retryQueue.add(() async {
              try {
                final response = await _dio.request(
                  requestOptions.path,
                  data: requestOptions.data,
                  queryParameters: requestOptions.queryParameters,
                  options: Options(
                    method: requestOptions.method,
                    headers: await _getAuthOptions().then((opt) => opt.headers),
                  ),
                );
                completer.complete(response);
              } catch (e) {
                completer.completeError(e);
              }
            });

            return handler.resolve(await completer.future);
          }

          return handler.next(error);
        },
      ),
    );
  }

  void setRefreshTokenCallback(Future<String?> Function() callback) {
    _refreshTokenCallback = callback;
  }

  bool _isTokenExpiredError(DioException error) => error.response?.statusCode == 401;

  set authHeaderProvider(AuthHeaderProvider authHeaderProvider) {
    _authHeaderProvider = authHeaderProvider;
  }

  Future<Options> _getAuthOptions([Options? options]) async {
    final token = _authHeaderProvider?.call();
    final headers = <String, String>{if (token != null) 'Authorization': token};
    return options?.copyWith(headers: {...?options.headers, ...headers}) ?? Options(headers: headers);
  }

  Future<Response> get(String path, {Map<String, dynamic>? queryParams, Options? options}) async {
    return await _dio.get(path, queryParameters: queryParams, options: await _getAuthOptions(options));
  }

  Future<Response> post(String path, {dynamic data, Options? options}) async {
    return await _dio.post(path, data: data, options: await _getAuthOptions(options));
  }

  Future<Response> put(String path, {dynamic data, Options? options}) async {
    return await _dio.put(path, data: data, options: await _getAuthOptions(options));
  }

  Future<Response> delete(String path, {dynamic data, Options? options}) async {
    return await _dio.delete(path, data: data, options: await _getAuthOptions(options));
  }

  Future<Response> patch(String path, {dynamic data, Options? options}) async {
    return await _dio.patch(path, data: data, options: await _getAuthOptions(options));
  }
}

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
            final RequestOptions requestOptions = error.requestOptions;
            final Completer<Response<dynamic>> completer =
                Completer<Response<dynamic>>();

            _retryQueue.add(() async {
              try {
                final Response<dynamic> response = await _dio.request<dynamic>(
                  requestOptions.path,
                  data: requestOptions.data,
                  queryParameters: requestOptions.queryParameters,
                  options: Options(
                    method: requestOptions.method,
                    headers: await _getAuthOptions()
                        .then<Map<String, dynamic>?>((opt) => opt.headers),
                  ),
                );
                if (!completer.isCompleted) {
                  completer.complete(response);
                }
              } catch (e) {
                if (!completer.isCompleted) {
                  completer.completeError(e);
                }
              }
            });

            if (!_isRefreshing) {
              _isRefreshing = true;
              try {
                final String? newToken = await _refreshTokenCallback?.call();

                if (newToken != null) {
                  _authHeaderProvider = () => newToken;
                  final retries = _retryQueue.toList();
                  _retryQueue.clear();
                  for (final retry in retries) {
                    retry();
                  }
                } else {
                  _retryQueue.clear();
                  return handler.reject(error);
                }
              } catch (e) {
                _retryQueue.clear();
                return handler.reject(error);
              } finally {
                _isRefreshing = false;
              }
            }
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

  bool _isTokenExpiredError(DioException error) =>
      error.response?.statusCode == 401;

  set authHeaderProvider(AuthHeaderProvider authHeaderProvider) {
    _authHeaderProvider = authHeaderProvider;
  }

  Future<Options> _getAuthOptions([Options? options]) async {
    final token = _authHeaderProvider?.call();
    final Map<String, dynamic> headers = <String, String>{
      if (token != null) 'Authorization': "Bearer $token",
    };
    return options?.copyWith(headers: {...?options.headers, ...headers}) ??
        Options(headers: headers);
  }

  Future<Response<dynamic>> get(
    String path, {
    Map<String, dynamic>? queryParams,
    Options? options,
  }) async {
    return await _dio.get<dynamic>(
      path,
      queryParameters: queryParams,
      options: await _getAuthOptions(options),
    );
  }

  Future<Response<dynamic>> post(
    String path, {
    dynamic data,
    Options? options,
  }) async {
    return await _dio.post<dynamic>(
      path,
      data: data,
      options: await _getAuthOptions(options),
    );
  }

  Future<Response<dynamic>> put(
    String path, {
    dynamic data,
    Options? options,
  }) async {
    return await _dio.put<dynamic>(
      path,
      data: data,
      options: await _getAuthOptions(options),
    );
  }

  Future<Response<dynamic>> delete(
    String path, {
    dynamic data,
    Options? options,
  }) async {
    return await _dio.delete<dynamic>(
      path,
      data: data,
      options: await _getAuthOptions(options),
    );
  }

  Future<Response<dynamic>> patch(
    String path, {
    dynamic data,
    Options? options,
  }) async {
    return await _dio.patch<dynamic>(
      path,
      data: data,
      options: await _getAuthOptions(options),
    );
  }
}

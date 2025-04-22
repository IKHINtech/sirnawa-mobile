import 'dart:async';

import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:flutter/foundation.dart';

typedef AuthHeaderProvider = String? Function();

class ApiClient {
  final Dio _dio;
  final CookieJar _cookieJar = CookieJar();

  AuthHeaderProvider? _authHeaderProvider;
  Future<String?> Function()? _refreshTokenCallback;
  bool _isRefreshing = false;
  final List<Function()> _retryQueue = [];

  ApiClient({required String baseUrl, Dio? dio})
    : _dio =
          dio ??
          Dio(
            BaseOptions(
              baseUrl: baseUrl,
              headers: {'Content-Type': 'application/json'},
            ),
          ) {
    if (!kIsWeb) {
      _dio.interceptors.add(CookieManager(_cookieJar));
    }

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
                // Retry all failed requests
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

  // Cek apakah error karena token expired
  bool _isTokenExpiredError(DioException error) {
    return error.response?.statusCode == 401;
  }

  // Setter untuk menyuntikkan token/jwt atau header lainnya
  set authHeaderProvider(AuthHeaderProvider authHeaderProvider) {
    _authHeaderProvider = authHeaderProvider;
  }

  // Helper: Generate option dengan Authorization header
  Future<Options> _getAuthOptions([Options? options]) async {
    final token = _authHeaderProvider?.call();
    final headers = <String, String>{if (token != null) 'Authorization': token};

    return options?.copyWith(headers: {...?options.headers, ...headers}) ??
        Options(headers: headers);
  }

  // General GET
  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParams,
    Options? options,
  }) async {
    return await _dio.get(
      path,
      queryParameters: queryParams,
      options: await _getAuthOptions(options),
    );
  }

  // General POST
  Future<Response> post(String path, {dynamic data, Options? options}) async {
    return await _dio.post(
      path,
      data: data,
      options: await _getAuthOptions(options),
    );
  }

  // General PUT
  Future<Response> put(String path, {dynamic data, Options? options}) async {
    return await _dio.put(
      path,
      data: data,
      options: await _getAuthOptions(options),
    );
  }

  // General DELETE
  Future<Response> delete(String path, {dynamic data, Options? options}) async {
    return await _dio.delete(
      path,
      data: data,
      options: await _getAuthOptions(options),
    );
  }

  // General PATCH
  Future<Response> patch(String path, {dynamic data, Options? options}) async {
    return await _dio.patch(
      path,
      data: data,
      options: await _getAuthOptions(options),
    );
  }
}

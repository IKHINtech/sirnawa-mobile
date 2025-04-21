import 'package:dio/dio.dart';

typedef AuthHeaderProvider = String? Function();

class ApiClient {
  ApiClient({required String baseUrl, Dio? dio})
    : _dio =
          dio ??
          Dio(
            BaseOptions(
              baseUrl: baseUrl,
              headers: {'Content-Type': 'application/json'},
            ),
          );

  final Dio _dio;
  AuthHeaderProvider? _authHeaderProvider;

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

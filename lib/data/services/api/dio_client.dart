import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/foundation.dart';

class DioClient {
  static final CookieJar _cookieJar = CookieJar();

  static Dio create({required String baseUrl}) {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        headers: {'Content-Type': 'application/json'},
      ),
    );

    // Untuk web, gunakan Interceptor khusus
    if (kIsWeb) {
      dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) async {
            // Pastikan credentials disertakan untuk web
            options.extra['withCredentials'] = true;
            return handler.next(options);
          },
        ),
      );
    } else {
      // Untuk mobile/native, gunakan CookieManager
      dio.interceptors.add(CookieManager(_cookieJar));
    }

    dio.interceptors.add(
      LogInterceptor(requestBody: true, responseBody: true), // Optional
    );

    return dio;
  }

  static CookieJar get cookieJar => _cookieJar;
}

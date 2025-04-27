import 'package:dio/dio.dart';

String? parseDioError(Object error) {
  if (error is DioException) {
    final response = error.response;
    if (response?.data is Map<String, dynamic>) {
      final data = response?.data as Map<String, dynamic>;
      final errorData = data['error'];
      if (errorData is Map<String, dynamic> && errorData['message'] is List) {
        final messages = errorData['message'] as List;
        if (messages.isNotEmpty) {
          return messages.join('\n'); // gabung semua pesan pakai newline
        }
      }
    }
    return error.message; // fallback ke error.message biasa
  }
  return error.toString(); // fallback kalau bukan DioException
}

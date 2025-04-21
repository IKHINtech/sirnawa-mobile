import 'package:dio/dio.dart';
import 'package:sirnawa_mobile/data/services/api/api_client.dart';
import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/domain/model/resident/resident_model.dart';
import 'package:sirnawa_mobile/utils/result.dart';

class ResidentService {
  final ApiClient apiClient;

  ResidentService(this.apiClient);

  Future<Result<ApiResponse<List<ResidentModel>>>> getResidents(
    Map<String, dynamic>? queryParams,
  ) async {
    try {
      final response = await apiClient.get(
        '/resident',
        queryParams: queryParams,
      );

      final data = ApiResponse<List<ResidentModel>>.fromJson(
        response.data,
        (json) =>
            (json as List)
                .map((e) => ResidentModel.fromJson(e as Map<String, dynamic>))
                .toList(),
      );

      return Result.ok(data);
    } catch (e) {
      return Result.error(Exception(_parseDioError(e)));
    }
  }

  // Helper untuk handle error dengan lebih rapi (opsional)
  String? _parseDioError(Object error) {
    if (error is DioException) {
      return error.message;
    }
    return error.toString();
  }
}

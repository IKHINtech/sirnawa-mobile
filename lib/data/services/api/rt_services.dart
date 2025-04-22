import 'package:dio/dio.dart';
import 'package:sirnawa_mobile/data/services/api/api_client.dart';
import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/domain/model/rt/rt_model.dart';
import 'package:sirnawa_mobile/utils/result.dart';

class RtService {
  final ApiClient apiClient;

  RtService(this.apiClient);

  Future<Result<ApiResponse<List<RtModel>>>> getRts(
    Map<String, dynamic>? queryParams,
  ) async {
    try {
      final response = await apiClient.get('/rt', queryParams: queryParams);

      final data = ApiResponse<List<RtModel>>.fromJson(
        response.data,
        (json) =>
            (json as List)
                .map((e) => RtModel.fromJson(e as Map<String, dynamic>))
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

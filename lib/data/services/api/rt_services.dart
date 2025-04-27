import 'package:dio/dio.dart';
import 'package:sirnawa_mobile/data/services/api/api_client.dart';
import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/domain/model/rt/rt_model.dart';
import 'package:sirnawa_mobile/utils/error_parser.dart';
import 'package:sirnawa_mobile/utils/result.dart';

class RtService {
  final ApiClient apiClient;

  RtService(this.apiClient);

  // ✅ GET /rt
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
      return Result.error(Exception(parseDioError(e)));
    }
  }

  // ✅ POST /rt
  Future<Result<ApiResponse<RtModel>>> createRt(RtModel rt) async {
    try {
      final response = await apiClient.post('/rt', data: rt.toJson());

      final data = ApiResponse<RtModel>.fromJson(
        response.data,
        (json) => RtModel.fromJson(json as Map<String, dynamic>),
      );

      return Result.ok(data);
    } catch (e) {
      return Result.error(Exception(parseDioError(e)));
    }
  }

  // ✅ PUT /rt/{id}
  Future<Result<ApiResponse<RtModel>>> updateRt(String id, RtModel rt) async {
    try {
      final response = await apiClient.put('/rt/$id', data: rt.toJson());

      final data = ApiResponse<RtModel>.fromJson(
        response.data,
        (json) => RtModel.fromJson(json as Map<String, dynamic>),
      );

      return Result.ok(data);
    } catch (e) {
      return Result.error(Exception(parseDioError(e)));
    }
  }

  // ✅ DELETE /rt/{id}
  Future<Result<void>> deleteRt(String id) async {
    try {
      await apiClient.delete('/rt/$id');
      return Result.ok(null);
    } catch (e) {
      return Result.error(Exception(parseDioError(e)));
    }
  }
}

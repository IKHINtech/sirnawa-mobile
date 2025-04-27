import 'package:dio/dio.dart';
import 'package:sirnawa_mobile/data/services/api/api_client.dart';
import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/data/services/api/model/rw/rw_request_model.dart';
import 'package:sirnawa_mobile/domain/model/rw/rw_model.dart';
import 'package:sirnawa_mobile/utils/error_parser.dart';
import 'package:sirnawa_mobile/utils/result.dart';

class RwService {
  final ApiClient apiClient;

  RwService(this.apiClient);

  // ✅ GET /rw
  Future<Result<ApiResponse<List<RwModel>>>> getRws(
    Map<String, dynamic>? queryParams,
  ) async {
    try {
      final response = await apiClient.get('/rw', queryParams: queryParams);

      final data = ApiResponse<List<RwModel>>.fromJson(
        response.data,
        (json) =>
            (json as List)
                .map((e) => RwModel.fromJson(e as Map<String, dynamic>))
                .toList(),
      );

      return Result.ok(data);
    } catch (e) {
      return Result.error(Exception(parseDioError(e)));
    }
  }

  // ✅ POST /rw
  Future<Result<ApiResponse<RwModel>>> createRw(RwRequestModel rw) async {
    try {
      final response = await apiClient.post('/rw', data: rw.toJson());

      final data = ApiResponse<RwModel>.fromJson(
        response.data,
        (json) => RwModel.fromJson(json as Map<String, dynamic>),
      );

      return Result.ok(data);
    } catch (e) {
      return Result.error(Exception(parseDioError(e)));
    }
  }

  // ✅ PUT /rw/{id}
  Future<Result<ApiResponse<RwModel>>> updateRw(
    String id,
    RwRequestModel rw,
  ) async {
    try {
      final response = await apiClient.put('/rw/$id', data: rw.toJson());

      final data = ApiResponse<RwModel>.fromJson(
        response.data,
        (json) => RwModel.fromJson(json as Map<String, dynamic>),
      );

      return Result.ok(data);
    } catch (e) {
      return Result.error(Exception(parseDioError(e)));
    }
  }

  // ✅ DELETE /rw/{id}
  Future<Result<void>> deleteRw(String id) async {
    try {
      await apiClient.delete('/rw/$id');
      return Result.ok(null);
    } catch (e) {
      return Result.error(Exception(parseDioError(e)));
    }
  }

  // Helper error parser
}

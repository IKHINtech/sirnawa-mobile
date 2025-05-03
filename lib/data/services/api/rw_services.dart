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
      final Response<dynamic> response = await apiClient.get(
        '/rw',
        queryParams: queryParams,
      );

      final ApiResponse<List<RwModel>> data =
          ApiResponse<List<RwModel>>.fromJson(
            response.data,
            (json) =>
                (json as List)
                    .map<RwModel>(
                      (e) => RwModel.fromJson(e as Map<String, dynamic>),
                    )
                    .toList(),
          );

      return Result<ApiResponse<List<RwModel>>>.ok(data);
    } catch (e) {
      return Result<ApiResponse<List<RwModel>>>.error(
        Exception(parseDioError(e)),
      );
    }
  }

  // ✅ POST /rw
  Future<Result<ApiResponse<RwModel>>> createRw(RwRequestModel rw) async {
    try {
      final Response<dynamic> response = await apiClient.post(
        '/rw',
        data: rw.toJson(),
      );

      final ApiResponse<RwModel> data = ApiResponse<RwModel>.fromJson(
        response.data,
        (json) => RwModel.fromJson(json as Map<String, dynamic>),
      );

      return Result<ApiResponse<RwModel>>.ok(data);
    } catch (e) {
      return Result<ApiResponse<RwModel>>.error(Exception(parseDioError(e)));
    }
  }

  // ✅ PUT /rw/{id}
  Future<Result<ApiResponse<RwModel>>> updateRw(
    String id,
    RwRequestModel rw,
  ) async {
    try {
      final Response<dynamic> response = await apiClient.put(
        '/rw/$id',
        data: rw.toJson(),
      );

      final ApiResponse<RwModel> data = ApiResponse<RwModel>.fromJson(
        response.data,
        (json) => RwModel.fromJson(json as Map<String, dynamic>),
      );

      return Result<ApiResponse<RwModel>>.ok(data);
    } catch (e) {
      return Result<ApiResponse<RwModel>>.error(Exception(parseDioError(e)));
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

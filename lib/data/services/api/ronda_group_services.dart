import 'package:dio/dio.dart';
import 'package:sirnawa_mobile/data/services/api/api_client.dart';
import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/data/services/api/model/ronda_group/ronda_group_request_model.dart';
import 'package:sirnawa_mobile/domain/model/ronda_group/ronda_group_model.dart';
import 'package:sirnawa_mobile/utils/error_parser.dart';
import 'package:sirnawa_mobile/utils/result.dart';

class RondaGroupService {
  final ApiClient apiClient;

  RondaGroupService(this.apiClient);

  // ✅ GET /ronda-group
  Future<Result<ApiResponse<List<RondaGroupModel>>>> getRondaGroups(
    Map<String, dynamic>? queryParams,
  ) async {
    try {
      final Response<dynamic> response = await apiClient.get(
        '/ronda-group',
        queryParams: queryParams,
      );

      final ApiResponse<List<RondaGroupModel>> data =
          ApiResponse<List<RondaGroupModel>>.fromJson(
            response.data,
            (json) =>
                (json as List)
                    .map<RondaGroupModel>(
                      (e) =>
                          RondaGroupModel.fromJson(e as Map<String, dynamic>),
                    )
                    .toList(),
          );

      return Result<ApiResponse<List<RondaGroupModel>>>.ok(data);
    } catch (e) {
      return Result<ApiResponse<List<RondaGroupModel>>>.error(
        Exception(parseDioError(e)),
      );
    }
  }

  // ✅ POST /ronda-group
  Future<Result<ApiResponse<RondaGroupModel>>> createRondaGroup(
    RondaGroupRequestModel rondaGroup,
  ) async {
    try {
      final Response<dynamic> response = await apiClient.post(
        '/ronda-group',
        data: rondaGroup.toJson(),
      );

      final ApiResponse<RondaGroupModel> data =
          ApiResponse<RondaGroupModel>.fromJson(
            response.data,
            (json) => RondaGroupModel.fromJson(json as Map<String, dynamic>),
          );

      return Result<ApiResponse<RondaGroupModel>>.ok(data);
    } catch (e) {
      return Result<ApiResponse<RondaGroupModel>>.error(
        Exception(parseDioError(e)),
      );
    }
  }

  // ✅ PUT /ronda-group/{id}
  Future<Result<ApiResponse<RondaGroupModel>>> updateRondaGroup(
    String id,
    RondaGroupRequestModel rondaGroup,
  ) async {
    try {
      final Response<dynamic> response = await apiClient.put(
        '/ronda-group/$id',
        data: rondaGroup.toJson(),
      );

      final ApiResponse<RondaGroupModel> data =
          ApiResponse<RondaGroupModel>.fromJson(
            response.data,
            (json) => RondaGroupModel.fromJson(json as Map<String, dynamic>),
          );

      return Result<ApiResponse<RondaGroupModel>>.ok(data);
    } catch (e) {
      return Result<ApiResponse<RondaGroupModel>>.error(
        Exception(parseDioError(e)),
      );
    }
  }

  // ✅ DELETE /ronda-group/{id}
  Future<Result<void>> deleteRondaGroup(String id) async {
    try {
      await apiClient.delete('/ronda-group/$id');
      return Result.ok(null);
    } catch (e) {
      return Result.error(Exception(parseDioError(e)));
    }
  }

  // Helper error parser
}

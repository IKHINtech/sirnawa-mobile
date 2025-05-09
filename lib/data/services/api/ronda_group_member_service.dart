import 'package:dio/dio.dart';
import 'package:sirnawa_mobile/data/services/api/api_client.dart';
import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/data/services/api/model/ronda_group_member/ronda_group_member_request_model.dart';
import 'package:sirnawa_mobile/domain/model/ronda_group_member/ronda_group_member_model.dart';
import 'package:sirnawa_mobile/utils/error_parser.dart';
import 'package:sirnawa_mobile/utils/result.dart';

class RondaGroupMemberService {
  final ApiClient apiClient;

  RondaGroupMemberService(this.apiClient);

  // ✅ GET /ronda-group-member
  Future<Result<ApiResponse<List<RondaGroupMemberModel>>>> getRondaGroupMembers(
    Map<String, dynamic>? queryParams,
  ) async {
    try {
      final Response<dynamic> response = await apiClient.get(
        '/ronda-group-member',
        queryParams: queryParams,
      );

      final ApiResponse<List<RondaGroupMemberModel>> data =
          ApiResponse<List<RondaGroupMemberModel>>.fromJson(
            response.data,
            (json) =>
                (json as List)
                    .map<RondaGroupMemberModel>(
                      (e) => RondaGroupMemberModel.fromJson(
                        e as Map<String, dynamic>,
                      ),
                    )
                    .toList(),
          );

      return Result<ApiResponse<List<RondaGroupMemberModel>>>.ok(data);
    } catch (e) {
      return Result<ApiResponse<List<RondaGroupMemberModel>>>.error(
        Exception(parseDioError(e)),
      );
    }
  }

  // ✅ POST /ronda-group-member
  Future<Result<ApiResponse<RondaGroupMemberModel>>> createRondaGroupMember(
    RondaGroupMemberRequestModel rondaGroupMember,
  ) async {
    try {
      final Response<dynamic> response = await apiClient.post(
        '/ronda-group-member',
        data: rondaGroupMember.toJson(),
      );

      final ApiResponse<RondaGroupMemberModel> data =
          ApiResponse<RondaGroupMemberModel>.fromJson(
            response.data,
            (json) =>
                RondaGroupMemberModel.fromJson(json as Map<String, dynamic>),
          );

      return Result<ApiResponse<RondaGroupMemberModel>>.ok(data);
    } catch (e) {
      return Result<ApiResponse<RondaGroupMemberModel>>.error(
        Exception(parseDioError(e)),
      );
    }
  }

  // ✅ PUT /ronda-group-member/{id}
  Future<Result<ApiResponse<RondaGroupMemberModel>>> updateRondaGroupMember(
    String id,
    RondaGroupMemberRequestModel rondaGroupMember,
  ) async {
    try {
      final Response<dynamic> response = await apiClient.put(
        '/ronda-group-member/$id',
        data: rondaGroupMember.toJson(),
      );

      final ApiResponse<RondaGroupMemberModel> data =
          ApiResponse<RondaGroupMemberModel>.fromJson(
            response.data,
            (json) =>
                RondaGroupMemberModel.fromJson(json as Map<String, dynamic>),
          );

      return Result<ApiResponse<RondaGroupMemberModel>>.ok(data);
    } catch (e) {
      return Result<ApiResponse<RondaGroupMemberModel>>.error(
        Exception(parseDioError(e)),
      );
    }
  }

  // ✅ DELETE /ronda-group-member/{id}
  Future<Result<void>> deleteRondaGroupMember(String id) async {
    try {
      await apiClient.delete('/ronda-group-member/$id');
      return Result.ok(null);
    } catch (e) {
      return Result.error(Exception(parseDioError(e)));
    }
  }

  // Helper error parser
}

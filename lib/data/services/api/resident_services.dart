import 'package:dio/dio.dart';
import 'package:sirnawa_mobile/data/services/api/api_client.dart';
import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/data/services/api/model/resident/resident_request_model.dart';
import 'package:sirnawa_mobile/domain/model/resident/resident_model.dart';
import 'package:sirnawa_mobile/utils/error_parser.dart';
import 'package:sirnawa_mobile/utils/result.dart';

class ResidentService {
  final ApiClient apiClient;

  ResidentService(this.apiClient);

  Future<Result<ApiResponse<List<ResidentModel>>>> getResidents(
    Map<String, dynamic>? queryParams,
  ) async {
    try {
      final Response<dynamic> response = await apiClient.get(
        '/resident',
        queryParams: queryParams,
      );

      final ApiResponse<List<ResidentModel>> data =
          ApiResponse<List<ResidentModel>>.fromJson(
            response.data,
            (json) =>
                (json as List)
                    .map<ResidentModel>(
                      (e) => ResidentModel.fromJson(e as Map<String, dynamic>),
                    )
                    .toList(),
          );

      return Result<ApiResponse<List<ResidentModel>>>.ok(data);
    } catch (e) {
      return Result<ApiResponse<List<ResidentModel>>>.error(
        Exception(parseDioError(e)),
      );
    }
  }

  // ✅ POST /resident
  Future<Result<ApiResponse<ResidentModel>>> createResident(
    ResidentRequestModel resident,
  ) async {
    try {
      final Response<dynamic> response = await apiClient.post(
        '/resident',
        data: resident.toJson(),
      );

      final ApiResponse<ResidentModel> data =
          ApiResponse<ResidentModel>.fromJson(
            response.data,
            (json) => ResidentModel.fromJson(json as Map<String, dynamic>),
          );

      return Result<ApiResponse<ResidentModel>>.ok(data);
    } catch (e) {
      return Result<ApiResponse<ResidentModel>>.error(
        Exception(parseDioError(e)),
      );
    }
  }

  // ✅ PUT /resident/{id}
  Future<Result<ApiResponse<ResidentModel>>> updateResident(
    String id,
    ResidentRequestModel resident,
  ) async {
    try {
      final Response<dynamic> response = await apiClient.put(
        '/resident/$id',
        data: resident.toJson(),
      );

      final ApiResponse<ResidentModel> data =
          ApiResponse<ResidentModel>.fromJson(
            response.data,
            (json) => ResidentModel.fromJson(json as Map<String, dynamic>),
          );

      return Result<ApiResponse<ResidentModel>>.ok(data);
    } catch (e) {
      return Result<ApiResponse<ResidentModel>>.error(
        Exception(parseDioError(e)),
      );
    }
  }

  // ✅ DELETE /resident/{id}
  Future<Result<void>> deleteResident(String id) async {
    try {
      await apiClient.delete('/resident/$id');
      return Result.ok(null);
    } catch (e) {
      return Result.error(Exception(parseDioError(e)));
    }
  }
}

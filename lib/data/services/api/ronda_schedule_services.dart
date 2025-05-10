import 'package:dio/dio.dart';
import 'package:sirnawa_mobile/data/services/api/api_client.dart';
import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/data/services/api/model/ronda_schedule/ronda_schedule_request_model.dart';
import 'package:sirnawa_mobile/domain/model/ronda_schedule/ronda_schedule_model.dart';
import 'package:sirnawa_mobile/utils/error_parser.dart';
import 'package:sirnawa_mobile/utils/result.dart';

class RondaScheduleService {
  final ApiClient apiClient;

  RondaScheduleService(this.apiClient);

  // ✅ GET /ronda-schedule
  Future<Result<ApiResponse<List<RondaScheduleModel>>>> getRondaSchedules(
    Map<String, dynamic>? queryParams,
  ) async {
    try {
      final Response<dynamic> response = await apiClient.get(
        '/ronda-schedule',
        queryParams: queryParams,
      );

      final ApiResponse<List<RondaScheduleModel>>
      data = ApiResponse<List<RondaScheduleModel>>.fromJson(
        response.data,
        (json) =>
            (json as List)
                .map<RondaScheduleModel>(
                  (e) => RondaScheduleModel.fromJson(e as Map<String, dynamic>),
                )
                .toList(),
      );

      return Result<ApiResponse<List<RondaScheduleModel>>>.ok(data);
    } catch (e) {
      return Result<ApiResponse<List<RondaScheduleModel>>>.error(
        Exception(parseDioError(e)),
      );
    }
  }

  Future<Result<ApiResponse<RondaScheduleModel>>> getDetailRondaSchedule({
    required String id,
  }) async {
    try {
      final Response<dynamic> response = await apiClient.get(
        '/ronda-schedule/$id',
      );

      final ApiResponse<RondaScheduleModel> data =
          ApiResponse<RondaScheduleModel>.fromJson(
            response.data,
            (json) => RondaScheduleModel.fromJson(json as Map<String, dynamic>),
          );

      return Result<ApiResponse<RondaScheduleModel>>.ok(data);
    } catch (e) {
      return Result<ApiResponse<RondaScheduleModel>>.error(
        Exception(parseDioError(e)),
      );
    }
  }

  // ✅ POST /ronda-schedule
  Future<Result<ApiResponse<RondaScheduleModel>>> createRondaSchedule(
    RondaScheduleRequestModel rondaSchedule,
  ) async {
    try {
      final Response<dynamic> response = await apiClient.post(
        '/ronda-schedule',
        data: rondaSchedule.toJson(),
      );

      final ApiResponse<RondaScheduleModel> data =
          ApiResponse<RondaScheduleModel>.fromJson(
            response.data,
            (json) => RondaScheduleModel.fromJson(json as Map<String, dynamic>),
          );

      return Result<ApiResponse<RondaScheduleModel>>.ok(data);
    } catch (e) {
      return Result<ApiResponse<RondaScheduleModel>>.error(
        Exception(parseDioError(e)),
      );
    }
  }

  // ✅ PUT /ronda-schedule/{id}
  Future<Result<ApiResponse<RondaScheduleModel>>> updateRondaSchedule(
    String id,
    RondaScheduleRequestModel rondaSchedule,
  ) async {
    try {
      final Response<dynamic> response = await apiClient.put(
        '/ronda-schedule/$id',
        data: rondaSchedule.toJson(),
      );

      final ApiResponse<RondaScheduleModel> data =
          ApiResponse<RondaScheduleModel>.fromJson(
            response.data,
            (json) => RondaScheduleModel.fromJson(json as Map<String, dynamic>),
          );

      return Result<ApiResponse<RondaScheduleModel>>.ok(data);
    } catch (e) {
      return Result<ApiResponse<RondaScheduleModel>>.error(
        Exception(parseDioError(e)),
      );
    }
  }

  // ✅ DELETE /ronda-schedule/{id}
  Future<Result<void>> deleteRondaSchedule(String id) async {
    try {
      await apiClient.delete('/ronda-schedule/$id');
      return Result.ok(null);
    } catch (e) {
      return Result.error(Exception(parseDioError(e)));
    }
  }
}

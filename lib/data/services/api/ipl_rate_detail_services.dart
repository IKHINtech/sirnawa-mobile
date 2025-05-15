import 'package:dio/dio.dart';
import 'package:sirnawa_mobile/data/services/api/api_client.dart';
import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/data/services/api/model/ipl_rate_detail/ipl_rate_detail_request_model.dart';
import 'package:sirnawa_mobile/domain/model/ipl_rate_detail/ipl_rate_detail_model.dart';
import 'package:sirnawa_mobile/utils/error_parser.dart';
import 'package:sirnawa_mobile/utils/result.dart';

class IplRateDetailService {
  final ApiClient apiClient;

  IplRateDetailService(this.apiClient);

  // ✅ GET /ipl-rate-detail
  Future<Result<ApiResponse<List<IplRateDetailModel>>>> getIplRateDetails(
    Map<String, dynamic>? queryParams,
  ) async {
    try {
      final Response<dynamic> response = await apiClient.get(
        '/ipl-rate-detail',
        queryParams: queryParams,
      );

      final ApiResponse<List<IplRateDetailModel>>
      data = ApiResponse<List<IplRateDetailModel>>.fromJson(
        response.data,
        (json) =>
            (json as List)
                .map<IplRateDetailModel>(
                  (e) => IplRateDetailModel.fromJson(e as Map<String, dynamic>),
                )
                .toList(),
      );

      return Result<ApiResponse<List<IplRateDetailModel>>>.ok(data);
    } catch (e) {
      return Result<ApiResponse<List<IplRateDetailModel>>>.error(
        Exception(parseDioError(e)),
      );
    }
  }

  // ✅ POST /ipl-rate-detail
  Future<Result<ApiResponse<IplRateDetailModel>>> createIplRateDetail(
    IplRateDetailRequestModel rt,
  ) async {
    try {
      final Response<dynamic> response = await apiClient.post(
        '/ipl-rate-detail',
        data: rt.toJson(),
      );

      final ApiResponse<IplRateDetailModel> data =
          ApiResponse<IplRateDetailModel>.fromJson(
            response.data,
            (json) => IplRateDetailModel.fromJson(json as Map<String, dynamic>),
          );

      return Result<ApiResponse<IplRateDetailModel>>.ok(data);
    } catch (e) {
      return Result<ApiResponse<IplRateDetailModel>>.error(
        Exception(parseDioError(e)),
      );
    }
  }

  // ✅ PUT /ipl-rate-detail/{id}
  Future<Result<ApiResponse<IplRateDetailModel>>> updateIplRateDetail(
    String id,
    IplRateDetailRequestModel rt,
  ) async {
    try {
      final Response<dynamic> response = await apiClient.put(
        '/ipl-rate-detail/$id',
        data: rt.toJson(),
      );

      final ApiResponse<IplRateDetailModel> data =
          ApiResponse<IplRateDetailModel>.fromJson(
            response.data,
            (json) => IplRateDetailModel.fromJson(json as Map<String, dynamic>),
          );

      return Result<ApiResponse<IplRateDetailModel>>.ok(data);
    } catch (e) {
      return Result<ApiResponse<IplRateDetailModel>>.error(
        Exception(parseDioError(e)),
      );
    }
  }

  // ✅ DELETE /ipl-rate-detail/{id}
  Future<Result<void>> deleteIplRateDetail(String id) async {
    try {
      await apiClient.delete('/ipl-rate-detail/$id');
      return Result.ok(null);
    } catch (e) {
      return Result.error(Exception(parseDioError(e)));
    }
  }
}

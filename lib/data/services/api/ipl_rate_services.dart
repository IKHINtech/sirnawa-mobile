import 'package:dio/dio.dart';
import 'package:sirnawa_mobile/data/services/api/api_client.dart';
import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/data/services/api/model/ipl_rate/ipl_rate_request_model.dart';
import 'package:sirnawa_mobile/domain/model/ipl_rate/ipl_rate_model.dart';
import 'package:sirnawa_mobile/utils/error_parser.dart';
import 'package:sirnawa_mobile/utils/result.dart';

class IplRateService {
  final ApiClient apiClient;

  IplRateService(this.apiClient);

  // ✅ GET /ipl-rate
  Future<Result<ApiResponse<List<IplRateModel>>>> getIplRates(
    Map<String, dynamic>? queryParams,
  ) async {
    try {
      final Response<dynamic> response = await apiClient.get(
        '/ipl-rate',
        queryParams: queryParams,
      );

      final ApiResponse<List<IplRateModel>> data =
          ApiResponse<List<IplRateModel>>.fromJson(
            response.data,
            (json) =>
                (json as List)
                    .map<IplRateModel>(
                      (e) => IplRateModel.fromJson(e as Map<String, dynamic>),
                    )
                    .toList(),
          );

      return Result<ApiResponse<List<IplRateModel>>>.ok(data);
    } catch (e) {
      return Result<ApiResponse<List<IplRateModel>>>.error(
        Exception(parseDioError(e)),
      );
    }
  }

  // ✅ POST /ipl-rate
  Future<Result<ApiResponse<IplRateModel>>> createIplRate(
    IplRateRequestModel rt,
  ) async {
    try {
      final Response<dynamic> response = await apiClient.post(
        '/ipl-rate',
        data: rt.toJson(),
      );

      final ApiResponse<IplRateModel> data = ApiResponse<IplRateModel>.fromJson(
        response.data,
        (json) => IplRateModel.fromJson(json as Map<String, dynamic>),
      );

      return Result<ApiResponse<IplRateModel>>.ok(data);
    } catch (e) {
      return Result<ApiResponse<IplRateModel>>.error(
        Exception(parseDioError(e)),
      );
    }
  }

  // ✅ PUT /ipl-rate/{id}
  Future<Result<ApiResponse<IplRateModel>>> updateIplRate(
    String id,
    IplRateRequestModel rt,
  ) async {
    try {
      final Response<dynamic> response = await apiClient.put(
        '/ipl-rate/$id',
        data: rt.toJson(),
      );

      final ApiResponse<IplRateModel> data = ApiResponse<IplRateModel>.fromJson(
        response.data,
        (json) => IplRateModel.fromJson(json as Map<String, dynamic>),
      );

      return Result<ApiResponse<IplRateModel>>.ok(data);
    } catch (e) {
      return Result<ApiResponse<IplRateModel>>.error(
        Exception(parseDioError(e)),
      );
    }
  }

  // ✅ DELETE /ipl-rate/{id}
  Future<Result<void>> deleteIplRate(String id) async {
    try {
      await apiClient.delete('/ipl-rate/$id');
      return Result.ok(null);
    } catch (e) {
      return Result.error(Exception(parseDioError(e)));
    }
  }
}

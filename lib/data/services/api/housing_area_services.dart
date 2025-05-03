import 'package:dio/dio.dart';
import 'package:sirnawa_mobile/data/services/api/api_client.dart';
import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/data/services/api/model/housing_area/housing_area_request_model.dart';
import 'package:sirnawa_mobile/domain/model/housing_area/housing_area_model.dart';
import 'package:sirnawa_mobile/utils/error_parser.dart';
import 'package:sirnawa_mobile/utils/result.dart';

class HousingAreaService {
  final ApiClient apiClient;

  HousingAreaService(this.apiClient);

  // ✅ GET /housing-area
  Future<Result<ApiResponse<List<HousingAreaModel>>>> getHousingAreas(
    Map<String, dynamic>? queryParams,
  ) async {
    try {
      final Response<dynamic> response = await apiClient.get(
        '/housing-area',
        queryParams: queryParams,
      );

      final ApiResponse<List<HousingAreaModel>> data =
          ApiResponse<List<HousingAreaModel>>.fromJson(
            response.data,
            (json) =>
                (json as List<dynamic>)
                    .map<HousingAreaModel>(
                      (e) =>
                          HousingAreaModel.fromJson(e as Map<String, dynamic>),
                    )
                    .toList(),
          );

      return Result<ApiResponse<List<HousingAreaModel>>>.ok(data);
    } catch (e) {
      return Result<ApiResponse<List<HousingAreaModel>>>.error(
        Exception(parseDioError(e)),
      );
    }
  }

  // ✅ POST /housing-area
  Future<Result<ApiResponse<HousingAreaModel>>> createHousingArea(
    HousingAreaRequestModel area,
  ) async {
    try {
      final Response<dynamic> response = await apiClient.post(
        '/housing-area',
        data: area.toJson(),
      );

      final ApiResponse<HousingAreaModel> data =
          ApiResponse<HousingAreaModel>.fromJson(
            response.data,
            (json) => HousingAreaModel.fromJson(json as Map<String, dynamic>),
          );

      return Result<ApiResponse<HousingAreaModel>>.ok(data);
    } catch (e) {
      return Result<ApiResponse<HousingAreaModel>>.error(
        Exception(parseDioError(e)),
      );
    }
  }

  // ✅ PUT /housing-area/{id}
  Future<Result<ApiResponse<HousingAreaModel>>> updateHousingArea(
    String id,
    HousingAreaRequestModel area,
  ) async {
    try {
      final Response<dynamic> response = await apiClient.put(
        '/housing-area/$id',
        data: area.toJson(),
      );

      final ApiResponse<HousingAreaModel> data =
          ApiResponse<HousingAreaModel>.fromJson(
            response.data,
            (json) => HousingAreaModel.fromJson(json as Map<String, dynamic>),
          );

      return Result<ApiResponse<HousingAreaModel>>.ok(data);
    } catch (e) {
      return Result<ApiResponse<HousingAreaModel>>.error(
        Exception(parseDioError(e)),
      );
    }
  }

  // ✅ DELETE /housing-area/{id}
  Future<Result<void>> deleteHousingArea(String id) async {
    try {
      await apiClient.delete('/housing-area/$id');
      return Result.ok(null);
    } catch (e) {
      return Result.error(Exception(parseDioError(e)));
    }
  }
}

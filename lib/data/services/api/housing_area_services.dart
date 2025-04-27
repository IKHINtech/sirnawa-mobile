import 'package:dio/dio.dart';
import 'package:sirnawa_mobile/data/services/api/api_client.dart';
import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
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
      final response = await apiClient.get(
        '/housing-area',
        queryParams: queryParams,
      );

      final data = ApiResponse<List<HousingAreaModel>>.fromJson(
        response.data,
        (json) =>
            (json as List)
                .map(
                  (e) => HousingAreaModel.fromJson(e as Map<String, dynamic>),
                )
                .toList(),
      );

      return Result.ok(data);
    } catch (e) {
      return Result.error(Exception(parseDioError(e)));
    }
  }

  // ✅ POST /housing-area
  Future<Result<ApiResponse<HousingAreaModel>>> createHousingArea(
    HousingAreaModel area,
  ) async {
    try {
      final response = await apiClient.post(
        '/housing-area',
        data: area.toJson(),
      );

      final data = ApiResponse<HousingAreaModel>.fromJson(
        response.data,
        (json) => HousingAreaModel.fromJson(json as Map<String, dynamic>),
      );

      return Result.ok(data);
    } catch (e) {
      return Result.error(Exception(parseDioError(e)));
    }
  }

  // ✅ PUT /housing-area/{id}
  Future<Result<ApiResponse<HousingAreaModel>>> updateHousingArea(
    String id,
    HousingAreaModel area,
  ) async {
    try {
      final response = await apiClient.put(
        '/housing-area/$id',
        data: area.toJson(),
      );

      final data = ApiResponse<HousingAreaModel>.fromJson(
        response.data,
        (json) => HousingAreaModel.fromJson(json as Map<String, dynamic>),
      );

      return Result.ok(data);
    } catch (e) {
      return Result.error(Exception(parseDioError(e)));
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

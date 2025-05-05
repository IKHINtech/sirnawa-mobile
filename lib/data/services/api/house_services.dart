import 'package:dio/dio.dart';
import 'package:sirnawa_mobile/data/services/api/api_client.dart';
import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/data/services/api/model/house/house_request_model.dart';
import 'package:sirnawa_mobile/domain/model/house/house_model.dart';
import 'package:sirnawa_mobile/utils/error_parser.dart';
import 'package:sirnawa_mobile/utils/result.dart';

class HouseService {
  final ApiClient apiClient;

  HouseService(this.apiClient);

  // ✅ GET /house
  Future<Result<ApiResponse<List<HouseModel>>>> getHouses(
    Map<String, dynamic>? queryParams,
  ) async {
    try {
      final Response<dynamic> response = await apiClient.get(
        '/house',
        queryParams: queryParams,
      );

      final ApiResponse<List<HouseModel>> data =
          ApiResponse<List<HouseModel>>.fromJson(
            response.data,
            (json) =>
                (json as List<dynamic>)
                    .map<HouseModel>(
                      (e) => HouseModel.fromJson(e as Map<String, dynamic>),
                    )
                    .toList(),
          );

      return Result<ApiResponse<List<HouseModel>>>.ok(data);
    } catch (e) {
      return Result<ApiResponse<List<HouseModel>>>.error(
        Exception(parseDioError(e)),
      );
    }
  }

  Future<Result<ApiResponse<HouseModel>>> getDetailHouse({
    required String houseID,
  }) async {
    try {
      final Response<dynamic> response = await apiClient.get('/house/$houseID');

      final ApiResponse<HouseModel> data = ApiResponse<HouseModel>.fromJson(
        response.data,
        (json) => HouseModel.fromJson(json as Map<String, dynamic>),
      );

      return Result<ApiResponse<HouseModel>>.ok(data);
    } catch (e) {
      return Result<ApiResponse<HouseModel>>.error(Exception(parseDioError(e)));
    }
  }

  // ✅ POST /house
  Future<Result<ApiResponse<HouseModel>>> createHouse(
    HouseRequestModel house,
  ) async {
    try {
      final Response<dynamic> response = await apiClient.post(
        '/house',
        data: house.toJson(),
      );

      final ApiResponse<HouseModel> data = ApiResponse<HouseModel>.fromJson(
        response.data,
        (json) => HouseModel.fromJson(json as Map<String, dynamic>),
      );

      return Result<ApiResponse<HouseModel>>.ok(data);
    } catch (e) {
      return Result<ApiResponse<HouseModel>>.error(Exception(parseDioError(e)));
    }
  }

  // ✅ PUT /house/{id}
  Future<Result<ApiResponse<HouseModel>>> updateHouse(
    String id,
    HouseRequestModel house,
  ) async {
    try {
      final Response<dynamic> response = await apiClient.put(
        '/house/$id',
        data: house.toJson(),
      );

      final ApiResponse<HouseModel> data = ApiResponse<HouseModel>.fromJson(
        response.data,
        (json) => HouseModel.fromJson(json as Map<String, dynamic>),
      );

      return Result<ApiResponse<HouseModel>>.ok(data);
    } catch (e) {
      return Result<ApiResponse<HouseModel>>.error(Exception(parseDioError(e)));
    }
  }

  // ✅ DELETE /house/{id}
  Future<Result<void>> deleteHouse(String id) async {
    try {
      await apiClient.delete('/house/$id');
      return Result.ok(null);
    } catch (e) {
      return Result.error(Exception(parseDioError(e)));
    }
  }
}

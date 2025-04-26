import 'package:dio/dio.dart';
import 'package:sirnawa_mobile/data/services/api/api_client.dart';
import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/domain/model/house/house_model.dart';
import 'package:sirnawa_mobile/utils/result.dart';

class HouseService {
  final ApiClient apiClient;

  HouseService(this.apiClient);

  // ✅ GET /house
  Future<Result<ApiResponse<List<HouseModel>>>> getHouses(
    Map<String, dynamic>? queryParams,
  ) async {
    try {
      final response = await apiClient.get('/house', queryParams: queryParams);

      final data = ApiResponse<List<HouseModel>>.fromJson(
        response.data,
        (json) =>
            (json as List)
                .map((e) => HouseModel.fromJson(e as Map<String, dynamic>))
                .toList(),
      );

      return Result.ok(data);
    } catch (e) {
      return Result.error(Exception(_parseDioError(e)));
    }
  }

  // ✅ POST /house
  Future<Result<ApiResponse<HouseModel>>> createHouse(HouseModel house) async {
    try {
      final response = await apiClient.post('/house', data: house.toJson());

      final data = ApiResponse<HouseModel>.fromJson(
        response.data,
        (json) => HouseModel.fromJson(json as Map<String, dynamic>),
      );

      return Result.ok(data);
    } catch (e) {
      return Result.error(Exception(_parseDioError(e)));
    }
  }

  // ✅ PUT /house/{id}
  Future<Result<ApiResponse<HouseModel>>> updateHouse(
    String id,
    HouseModel house,
  ) async {
    try {
      final response = await apiClient.put('/house/$id', data: house.toJson());

      final data = ApiResponse<HouseModel>.fromJson(
        response.data,
        (json) => HouseModel.fromJson(json as Map<String, dynamic>),
      );

      return Result.ok(data);
    } catch (e) {
      return Result.error(Exception(_parseDioError(e)));
    }
  }

  // ✅ DELETE /house/{id}
  Future<Result<void>> deleteHouse(String id) async {
    try {
      await apiClient.delete('/house/$id');
      return Result.ok(null);
    } catch (e) {
      return Result.error(Exception(_parseDioError(e)));
    }
  }

  // 🔧 Error parser
  String? _parseDioError(Object error) {
    if (error is DioException) {
      return error.message;
    }
    return error.toString();
  }
}

import 'package:dio/dio.dart';
import 'package:sirnawa_mobile/data/services/api/api_client.dart';
import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/data/services/api/model/resident_house_request/resident_house_request_model.dart';
import 'package:sirnawa_mobile/domain/model/resident_house/resident_house_model.dart';
import 'package:sirnawa_mobile/utils/error_parser.dart';
import 'package:sirnawa_mobile/utils/result.dart';

class ResidentHouseService {
  final ApiClient apiClient;

  ResidentHouseService(this.apiClient);

  // ✅ GET /resident-house/house/{id}
  Future<Result<ApiResponse<List<ResidentHouseModel>>>>
  getResidentHouseByHouseID({required String houseID}) async {
    try {
      final Response<dynamic> response = await apiClient.get(
        '/resident-house/house/$houseID',
      );

      final ApiResponse<List<ResidentHouseModel>>
      data = ApiResponse<List<ResidentHouseModel>>.fromJson(
        response.data,
        (json) =>
            (json as List<dynamic>)
                .map<ResidentHouseModel>(
                  (e) => ResidentHouseModel.fromJson(e as Map<String, dynamic>),
                )
                .toList(),
      );

      return Result<ApiResponse<List<ResidentHouseModel>>>.ok(data);
    } catch (e) {
      return Result<ApiResponse<List<ResidentHouseModel>>>.error(
        Exception(parseDioError(e)),
      );
    }
  }

  // ✅ POST /resident-house
  Future<Result<ApiResponse<ResidentHouseModel>>> createResidentHouse(
    ResidentHouseRequestModel residentHouse,
  ) async {
    try {
      final Response<dynamic> response = await apiClient.post(
        '/resident-house',
        data: residentHouse.toJson(),
      );

      final ApiResponse<ResidentHouseModel> data =
          ApiResponse<ResidentHouseModel>.fromJson(
            response.data,
            (json) => ResidentHouseModel.fromJson(json as Map<String, dynamic>),
          );

      return Result<ApiResponse<ResidentHouseModel>>.ok(data);
    } catch (e) {
      return Result<ApiResponse<ResidentHouseModel>>.error(
        Exception(parseDioError(e)),
      );
    }
  }

  // ✅ GET /resident-house/{id}
  Future<Result<void>> changeToPrimary(String id) async {
    try {
      await apiClient.get('/resident-house/$id');
      return Result.ok(null);
    } catch (e) {
      return Result.error(Exception(parseDioError(e)));
    }
  }

  // ✅ DELETE /resident-house/{id}
  Future<Result<void>> deleteResidentHouse(String id) async {
    try {
      await apiClient.delete('/resident-house/$id');
      return Result.ok(null);
    } catch (e) {
      return Result.error(Exception(parseDioError(e)));
    }
  }
}

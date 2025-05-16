import 'package:dio/dio.dart';
import 'package:sirnawa_mobile/data/services/api/api_client.dart';
import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/data/services/api/model/ipl_bill/ipl_bill_request_model.dart';
import 'package:sirnawa_mobile/data/services/api/model/ipl_bill_generate_request_model/ipl_bill_generate_request_model.dart';
import 'package:sirnawa_mobile/domain/model/ipl_bill/ipl_bill_model.dart';
import 'package:sirnawa_mobile/utils/error_parser.dart';
import 'package:sirnawa_mobile/utils/result.dart';

class IplBillService {
  final ApiClient apiClient;

  IplBillService(this.apiClient);

  // ✅ GET /ipl-bill
  Future<Result<ApiResponse<List<IplBillModel>>>> getIplBills(
    Map<String, dynamic>? queryParams,
  ) async {
    try {
      final Response<dynamic> response = await apiClient.get(
        '/ipl-bill',
        queryParams: queryParams,
      );

      final ApiResponse<List<IplBillModel>> data =
          ApiResponse<List<IplBillModel>>.fromJson(
            response.data,
            (json) =>
                (json as List)
                    .map<IplBillModel>(
                      (e) => IplBillModel.fromJson(e as Map<String, dynamic>),
                    )
                    .toList(),
          );

      return Result<ApiResponse<List<IplBillModel>>>.ok(data);
    } catch (e) {
      return Result<ApiResponse<List<IplBillModel>>>.error(
        Exception(parseDioError(e)),
      );
    }
  }

  // ✅ POST /ipl-bill
  Future<Result<ApiResponse<IplBillModel>>> createIplBill(
    IplBillRequestModel iplData,
  ) async {
    try {
      final Response<dynamic> response = await apiClient.post(
        '/ipl-bill',
        data: iplData.toJson(),
      );

      final ApiResponse<IplBillModel> data = ApiResponse<IplBillModel>.fromJson(
        response.data,
        (json) => IplBillModel.fromJson(json as Map<String, dynamic>),
      );

      return Result<ApiResponse<IplBillModel>>.ok(data);
    } catch (e) {
      return Result<ApiResponse<IplBillModel>>.error(
        Exception(parseDioError(e)),
      );
    }
  }

  // ✅ POST /ipl-bill/generate
  Future<Result<ApiResponse<void>>> generateIplBill(
    IplBillGenerateRequestModel iplData,
  ) async {
    try {
      final Response<dynamic> response = await apiClient.post(
        '/ipl-bill/generate',
        data: iplData.toJson(),
      );

      final ApiResponse<void> data = ApiResponse<void>.fromJson(
        response.data,
        (json) {},
      );
      return Result<ApiResponse<void>>.ok(data);
    } catch (e) {
      return Result<ApiResponse<void>>.error(Exception(parseDioError(e)));
    }
  }

  // ✅ PUT /ipl-bill/{id}
  Future<Result<ApiResponse<IplBillModel>>> updateIplBill(
    String id,
    IplBillRequestModel iplData,
  ) async {
    try {
      final Response<dynamic> response = await apiClient.put(
        '/ipl-bill/$id',
        data: iplData.toJson(),
      );

      final ApiResponse<IplBillModel> data = ApiResponse<IplBillModel>.fromJson(
        response.data,
        (json) => IplBillModel.fromJson(json as Map<String, dynamic>),
      );

      return Result<ApiResponse<IplBillModel>>.ok(data);
    } catch (e) {
      return Result<ApiResponse<IplBillModel>>.error(
        Exception(parseDioError(e)),
      );
    }
  }

  // ✅ DELETE /ipl-bill/{id}
  Future<Result<void>> deleteIplBill(String id) async {
    try {
      await apiClient.delete('/ipl-bill/$id');
      return Result.ok(null);
    } catch (e) {
      return Result.error(Exception(parseDioError(e)));
    }
  }
}

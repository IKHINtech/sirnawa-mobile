import 'package:dio/dio.dart';
import 'package:sirnawa_mobile/data/services/api/api_client.dart';
import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/data/services/api/model/block/block_request_model.dart';
import 'package:sirnawa_mobile/domain/model/block/block_model.dart';
import 'package:sirnawa_mobile/utils/error_parser.dart';
import 'package:sirnawa_mobile/utils/result.dart';

class BlockService {
  final ApiClient apiClient;

  BlockService(this.apiClient);

  // ✅ GET /block
  Future<Result<ApiResponse<List<BlockModel>>>> getBlocks(
    Map<String, dynamic>? queryParams,
  ) async {
    try {
      final Response<dynamic> response = await apiClient.get(
        '/block',
        queryParams: queryParams,
      );

      final ApiResponse<List<BlockModel>> data =
          ApiResponse<List<BlockModel>>.fromJson(
            response.data,
            (json) =>
                (json as List<dynamic>)
                    .map<BlockModel>(
                      (e) => BlockModel.fromJson(e as Map<String, dynamic>),
                    )
                    .toList(),
          );

      return Result<ApiResponse<List<BlockModel>>>.ok(data);
    } catch (e) {
      return Result<ApiResponse<List<BlockModel>>>.error(
        Exception(parseDioError(e)),
      );
    }
  }

  // ✅ POST /block
  Future<Result<ApiResponse<BlockModel>>> createBlock(
    BlockRequestModel block,
  ) async {
    try {
      final Response<dynamic> response = await apiClient.post(
        '/block',
        data: block.toJson(),
      );

      final ApiResponse<BlockModel> data = ApiResponse<BlockModel>.fromJson(
        response.data,
        (json) => BlockModel.fromJson(json as Map<String, dynamic>),
      );

      return Result<ApiResponse<BlockModel>>.ok(data);
    } catch (e) {
      return Result<ApiResponse<BlockModel>>.error(Exception(parseDioError(e)));
    }
  }

  // ✅ PUT /block/{id}
  Future<Result<ApiResponse<BlockModel>>> updateBlock(
    String id,
    BlockRequestModel block,
  ) async {
    try {
      final Response<dynamic> response = await apiClient.put(
        '/block/$id',
        data: block.toJson(),
      );

      final ApiResponse<BlockModel> data = ApiResponse<BlockModel>.fromJson(
        response.data,
        (json) => BlockModel.fromJson(json as Map<String, dynamic>),
      );

      return Result<ApiResponse<BlockModel>>.ok(data);
    } catch (e) {
      return Result<ApiResponse<BlockModel>>.error(Exception(parseDioError(e)));
    }
  }

  // ✅ DELETE /block/{id}
  Future<Result<void>> deleteBlock(String id) async {
    try {
      await apiClient.delete('/block/$id');
      return Result.ok(null);
    } catch (e) {
      return Result.error(Exception(parseDioError(e)));
    }
  }
}

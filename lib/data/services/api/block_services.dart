import 'package:dio/dio.dart';
import 'package:sirnawa_mobile/data/services/api/api_client.dart';
import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/domain/model/block/block_model.dart';
import 'package:sirnawa_mobile/utils/result.dart';

class BlockService {
  final ApiClient apiClient;

  BlockService(this.apiClient);

  // ✅ GET /block
  Future<Result<ApiResponse<List<BlockModel>>>> getBlocks(
    Map<String, dynamic>? queryParams,
  ) async {
    try {
      final response = await apiClient.get('/block', queryParams: queryParams);

      final data = ApiResponse<List<BlockModel>>.fromJson(
        response.data,
        (json) =>
            (json as List)
                .map((e) => BlockModel.fromJson(e as Map<String, dynamic>))
                .toList(),
      );

      return Result.ok(data);
    } catch (e) {
      return Result.error(Exception(_parseDioError(e)));
    }
  }

  // ✅ POST /block
  Future<Result<ApiResponse<BlockModel>>> createBlock(BlockModel block) async {
    try {
      final response = await apiClient.post('/block', data: block.toJson());

      final data = ApiResponse<BlockModel>.fromJson(
        response.data,
        (json) => BlockModel.fromJson(json as Map<String, dynamic>),
      );

      return Result.ok(data);
    } catch (e) {
      return Result.error(Exception(_parseDioError(e)));
    }
  }

  // ✅ PUT /block/{id}
  Future<Result<ApiResponse<BlockModel>>> updateBlock(
    String id,
    BlockModel block,
  ) async {
    try {
      final response = await apiClient.put('/block/$id', data: block.toJson());

      final data = ApiResponse<BlockModel>.fromJson(
        response.data,
        (json) => BlockModel.fromJson(json as Map<String, dynamic>),
      );

      return Result.ok(data);
    } catch (e) {
      return Result.error(Exception(_parseDioError(e)));
    }
  }

  // ✅ DELETE /block/{id}
  Future<Result<void>> deleteBlock(String id) async {
    try {
      await apiClient.delete('/block/$id');
      return Result.ok(null);
    } catch (e) {
      return Result.error(Exception(_parseDioError(e)));
    }
  }

  // 🔧 Error parsing helper
  String? _parseDioError(Object error) {
    if (error is DioException) {
      return error.message;
    }
    return error.toString();
  }
}

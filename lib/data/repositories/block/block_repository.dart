import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/data/services/api/model/block/block_request_model.dart';
import 'package:sirnawa_mobile/domain/model/block/block_model.dart';
import 'package:sirnawa_mobile/utils/result.dart';

abstract class BlockRepository {
  Future<Result<ApiResponse<List<BlockModel>>>> getListBlock(
    Map<String, dynamic>? queryParams,
  );
  Future<Result<void>> createBlock(BlockRequestModel block);
  Future<Result<void>> updateBlock(String id, BlockRequestModel block);
  Future<Result<void>> delete(String id);
}

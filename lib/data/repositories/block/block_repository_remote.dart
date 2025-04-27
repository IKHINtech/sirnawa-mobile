import 'package:sirnawa_mobile/data/repositories/block/block_repository.dart';
import 'package:sirnawa_mobile/data/services/api/block_services.dart';
import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/data/services/api/model/block/block_request_model.dart';
import 'package:sirnawa_mobile/domain/model/block/block_model.dart';
import 'package:sirnawa_mobile/utils/result.dart';

class BlockRepositoryRemote implements BlockRepository {
  BlockRepositoryRemote({required BlockService blockService})
    : _blockService = blockService;

  final BlockService _blockService;

  @override
  Future<Result<ApiResponse<List<BlockModel>>>> getListBlock(
    Map<String, dynamic>? queryParams,
  ) async {
    try {
      return await _blockService.getBlocks(queryParams);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> createBlock(BlockRequestModel block) async {
    try {
      return await _blockService.createBlock(block);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> updateBlock(String id, BlockRequestModel block) async {
    try {
      return await _blockService.updateBlock(id, block);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> delete(String id) async {
    try {
      return await _blockService.deleteBlock(id);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}

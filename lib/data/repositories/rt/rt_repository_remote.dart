import 'package:sirnawa_mobile/data/repositories/rt/rt_repository.dart';
import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/data/services/api/rt_services.dart';
import 'package:sirnawa_mobile/domain/model/rt/rt_model.dart';
import 'package:sirnawa_mobile/utils/result.dart';

class RtRepositoryRemote implements RtRepository {
  RtRepositoryRemote({required RtService rtService}) : _rtService = rtService;
  final RtService _rtService;

  @override
  Future<Result<ApiResponse<List<RtModel>>>> getListRt(
    Map<String, dynamic>? queryParams,
  ) async {
    try {
      return await _rtService.getRts(queryParams);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> createRt(RtModel rt) async {
    try {
      return await _rtService.createRt(rt);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> delete(String id) async {
    try {
      return await _rtService.deleteRt(id);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> updateRt(String id, RtModel rt) async {
    try {
      return await _rtService.updateRt(id, rt);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}

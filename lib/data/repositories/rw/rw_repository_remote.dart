import 'package:sirnawa_mobile/data/repositories/rw/rw_repository.dart';
import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/data/services/api/rw_services.dart';
import 'package:sirnawa_mobile/domain/model/rw/rw_model.dart';
import 'package:sirnawa_mobile/utils/result.dart';

class RwRepositoryRemote implements RwRepository {
  RwRepositoryRemote({required RwService rwService}) : _rwService = rwService;
  final RwService _rwService;

  @override
  Future<Result<ApiResponse<List<RwModel>>>> getListRw(
    Map<String, dynamic>? queryParams,
  ) async {
    try {
      return await _rwService.getRws(queryParams);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> createRw(RwModel rw) async {
    try {
      return await _rwService.createRw(rw);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> updateRw(String id, RwModel rw) async {
    try {
      return await _rwService.updateRw(id, rw);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> delete(String id) async {
    try {
      return await _rwService.deleteRw(id);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}

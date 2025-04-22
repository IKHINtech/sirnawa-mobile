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
  Future<Result<void>> createRt(RtModel rt) {
    // TODO: implement createRt
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> delete(String id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Result<ApiResponse<RtModel>>> getRtByID() {
    // TODO: implement getRtByID
    throw UnimplementedError();
  }
}

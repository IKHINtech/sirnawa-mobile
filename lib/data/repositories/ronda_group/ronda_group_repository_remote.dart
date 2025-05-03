import 'package:sirnawa_mobile/data/repositories/ronda_group/ronda_group_repository.dart';
import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/data/services/api/model/ronda_group/ronda_group_request_model.dart';
import 'package:sirnawa_mobile/data/services/api/ronda_group_services.dart';
import 'package:sirnawa_mobile/domain/model/ronda_group/ronda_group_model.dart';
import 'package:sirnawa_mobile/utils/result.dart';

class RondaGroupRepositoryRemote implements RondaGroupRepository {
  RondaGroupRepositoryRemote({required RondaGroupService rondaGroupService})
    : _rondaGroupService = rondaGroupService;
  final RondaGroupService _rondaGroupService;

  @override
  Future<Result<ApiResponse<List<RondaGroupModel>>>> getListRondaGroup(
    Map<String, dynamic>? queryParams,
  ) async {
    try {
      return await _rondaGroupService.getRondaGroups(queryParams);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> createRondaGroup(
    RondaGroupRequestModel rondaGroup,
  ) async {
    try {
      return await _rondaGroupService.createRondaGroup(rondaGroup);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> updateRondaGroup(
    String id,
    RondaGroupRequestModel rondaGroup,
  ) async {
    try {
      return await _rondaGroupService.updateRondaGroup(id, rondaGroup);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> delete(String id) async {
    try {
      return await _rondaGroupService.deleteRondaGroup(id);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}

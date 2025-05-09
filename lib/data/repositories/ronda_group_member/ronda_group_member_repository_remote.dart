import 'package:sirnawa_mobile/data/repositories/ronda_group_member/ronda_group_member_repository.dart';
import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/data/services/api/model/ronda_group_member/ronda_group_member_request_model.dart';
import 'package:sirnawa_mobile/data/services/api/ronda_group_member_service.dart';
import 'package:sirnawa_mobile/domain/model/ronda_group_member/ronda_group_member_model.dart';
import 'package:sirnawa_mobile/utils/result.dart';

class RondaGroupMemberRepositoryRemote implements RondaGroupMemberRepository {
  RondaGroupMemberRepositoryRemote({
    required RondaGroupMemberService rondaGroupMemberService,
  }) : _rondaGroupMemberService = rondaGroupMemberService;
  final RondaGroupMemberService _rondaGroupMemberService;

  @override
  Future<Result<ApiResponse<List<RondaGroupMemberModel>>>>
  getListRondaGroupMember(Map<String, dynamic>? queryParams) async {
    try {
      return await _rondaGroupMemberService.getRondaGroupMembers(queryParams);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> createRondaGroupMember(
    RondaGroupMemberRequestModel rondaGroupMember,
  ) async {
    try {
      return await _rondaGroupMemberService.createRondaGroupMember(
        rondaGroupMember,
      );
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> updateRondaGroupMember(
    String id,
    RondaGroupMemberRequestModel rondaGroupMember,
  ) async {
    try {
      return await _rondaGroupMemberService.updateRondaGroupMember(
        id,
        rondaGroupMember,
      );
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> delete(String id) async {
    try {
      return await _rondaGroupMemberService.deleteRondaGroupMember(id);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}

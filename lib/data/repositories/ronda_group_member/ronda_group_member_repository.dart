import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/data/services/api/model/ronda_group_member/ronda_group_member_request_model.dart';
import 'package:sirnawa_mobile/domain/model/ronda_group_member/ronda_group_member_model.dart';
import 'package:sirnawa_mobile/utils/result.dart';

abstract class RondaGroupMemberRepository {
  Future<Result<ApiResponse<List<RondaGroupMemberModel>>>>
  getListRondaGroupMember(Map<String, dynamic>? queryParams);
  Future<Result<void>> createRondaGroupMember(
    RondaGroupMemberRequestModel rondaMember,
  );
  Future<Result<void>> updateRondaGroupMember(
    String id,
    RondaGroupMemberRequestModel rondaMember,
  );
  Future<Result<void>> delete(String id);
}

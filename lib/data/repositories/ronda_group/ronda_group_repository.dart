import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/data/services/api/model/ronda_group/ronda_group_request_model.dart';
import 'package:sirnawa_mobile/domain/model/ronda_group/ronda_group_model.dart';
import 'package:sirnawa_mobile/utils/result.dart';

abstract class RondaGroupRepository {
  Future<Result<ApiResponse<List<RondaGroupModel>>>> getListRondaGroup(
    Map<String, dynamic>? queryParams,
  );
  Future<Result<void>> createRondaGroup(RondaGroupRequestModel rondaGroup);
  Future<Result<void>> updateRondaGroup(
    String id,
    RondaGroupRequestModel rondaGroup,
  );
  Future<Result<void>> delete(String id);
}

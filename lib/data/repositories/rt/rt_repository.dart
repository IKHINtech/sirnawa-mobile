import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/domain/model/rt/rt_model.dart';
import 'package:sirnawa_mobile/utils/result.dart';

abstract class RtRepository {
  Future<Result<ApiResponse<List<RtModel>>>> getListRt(
    Map<String, dynamic>? queryParams,
  );
  Future<Result<ApiResponse<RtModel>>> getRtByID();
  Future<Result<void>> createRt(RtModel rt);
  Future<Result<void>> delete(String id);
}

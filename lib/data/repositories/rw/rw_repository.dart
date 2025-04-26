import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/domain/model/rw/rw_model.dart';
import 'package:sirnawa_mobile/utils/result.dart';

abstract class RwRepository {
  Future<Result<ApiResponse<List<RwModel>>>> getListRw(
    Map<String, dynamic>? queryParams,
  );
  Future<Result<void>> createRw(RwModel rw);
  Future<Result<void>> updateRw(String id, RwModel rw);
  Future<Result<void>> delete(String id);
}

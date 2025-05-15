import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/data/services/api/model/ipl_rate_detail/ipl_rate_detail_request_model.dart';
import 'package:sirnawa_mobile/domain/model/ipl_rate_detail/ipl_rate_detail_model.dart';
import 'package:sirnawa_mobile/utils/result.dart';

abstract class IplRateDetailRepository {
  Future<Result<ApiResponse<List<IplRateDetailModel>>>> getList(
    Map<String, dynamic>? queryParams,
  );
  Future<Result<void>> createIplRateDetail(IplRateDetailRequestModel item);
  Future<Result<void>> updateIplRateDetail(
    String id,
    IplRateDetailRequestModel item,
  );
  Future<Result<void>> delete(String id);
}

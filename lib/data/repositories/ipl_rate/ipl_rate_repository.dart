import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/data/services/api/model/ipl_rate/ipl_rate_request_model.dart';
import 'package:sirnawa_mobile/domain/model/ipl_rate/ipl_rate_model.dart';
import 'package:sirnawa_mobile/utils/result.dart';

abstract class IplRateRepository {
  Future<Result<ApiResponse<List<IplRateModel>>>> getList(
    Map<String, dynamic>? queryParams,
  );
  Future<Result<void>> createIplRate(IplRateRequestModel item);
  Future<Result<void>> updateIplRate(String id, IplRateRequestModel item);
  Future<Result<void>> delete(String id);
}

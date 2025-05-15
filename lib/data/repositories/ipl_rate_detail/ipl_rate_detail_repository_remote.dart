import 'package:sirnawa_mobile/data/repositories/ipl_rate_detail/ipl_rate_detail_repository.dart';
import 'package:sirnawa_mobile/data/services/api/ipl_rate_detail_services.dart';
import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/data/services/api/model/ipl_rate_detail/ipl_rate_detail_request_model.dart';
import 'package:sirnawa_mobile/domain/model/ipl_rate_detail/ipl_rate_detail_model.dart';
import 'package:sirnawa_mobile/utils/result.dart';

class IplRateDetailRepositoryRemote implements IplRateDetailRepository {
  IplRateDetailRepositoryRemote({required IplRateDetailService iplRateService})
    : _iplRateService = iplRateService;

  final IplRateDetailService _iplRateService;

  @override
  Future<Result<ApiResponse<List<IplRateDetailModel>>>> getList(
    Map<String, dynamic>? queryParams,
  ) async {
    try {
      return await _iplRateService.getIplRateDetails(queryParams);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> createIplRateDetail(
    IplRateDetailRequestModel iplRate,
  ) async {
    try {
      return await _iplRateService.createIplRateDetail(iplRate);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> updateIplRateDetail(
    String id,
    IplRateDetailRequestModel iplRate,
  ) async {
    try {
      return await _iplRateService.updateIplRateDetail(id, iplRate);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> delete(String id) async {
    try {
      return await _iplRateService.deleteIplRateDetail(id);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}

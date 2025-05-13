import 'package:sirnawa_mobile/data/repositories/ipl_rate/ipl_rate_repository.dart';
import 'package:sirnawa_mobile/data/services/api/ipl_rate_services.dart';
import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/data/services/api/model/ipl_rate/ipl_rate_request_model.dart';
import 'package:sirnawa_mobile/domain/model/ipl_rate/ipl_rate_model.dart';
import 'package:sirnawa_mobile/utils/result.dart';

class IplRateRepositoryRemote implements IplRateRepository {
  IplRateRepositoryRemote({required IplRateService iplRateService})
    : _iplRateService = iplRateService;

  final IplRateService _iplRateService;

  @override
  Future<Result<ApiResponse<List<IplRateModel>>>> getList(
    Map<String, dynamic>? queryParams,
  ) async {
    try {
      return await _iplRateService.getIplRates(queryParams);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> createIplRate(IplRateRequestModel iplRate) async {
    try {
      return await _iplRateService.createIplRate(iplRate);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> updateIplRate(
    String id,
    IplRateRequestModel iplRate,
  ) async {
    try {
      return await _iplRateService.updateIplRate(id, iplRate);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> delete(String id) async {
    try {
      return await _iplRateService.deleteIplRate(id);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}

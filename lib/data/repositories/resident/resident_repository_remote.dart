import 'package:sirnawa_mobile/data/repositories/resident/resident_repository.dart';
import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/data/services/api/resident_services.dart';
import 'package:sirnawa_mobile/domain/model/resident/resident_model.dart';
import 'package:sirnawa_mobile/utils/result.dart';

class ResidentRepositoryRemote implements ResidentRepository {
  ResidentRepositoryRemote({required ResidentService rtService})
    : _rtService = rtService;
  final ResidentService _rtService;

  @override
  Future<Result<ApiResponse<List<ResidentModel>>>> getListResident(
    Map<String, dynamic>? queryParams,
  ) async {
    try {
      return await _rtService.getResidents(queryParams);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> createResident(ResidentModel rt) {
    // TODO: implement createResident
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> delete(String id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Result<ApiResponse<ResidentModel>>> getResidentByID() {
    // TODO: implement getResidentByID
    throw UnimplementedError();
  }
}

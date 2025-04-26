import 'package:sirnawa_mobile/data/repositories/resident/resident_repository.dart';
import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/data/services/api/resident_services.dart';
import 'package:sirnawa_mobile/domain/model/resident/resident_model.dart';
import 'package:sirnawa_mobile/utils/result.dart';

class ResidentRepositoryRemote implements ResidentRepository {
  ResidentRepositoryRemote({required ResidentService residentService})
    : _residentService = residentService;

  final ResidentService _residentService;

  @override
  Future<Result<ApiResponse<List<ResidentModel>>>> getResidents(
    Map<String, dynamic>? queryParams,
  ) async {
    try {
      return await _residentService.getResidents(queryParams);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> createResident(ResidentModel resident) async {
    try {
      return await _residentService.createResident(resident);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> updateResident(String id, ResidentModel resident) async {
    try {
      return await _residentService.updateResident(id, resident);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> deleteResident(String id) async {
    try {
      return await _residentService.deleteResident(id);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}

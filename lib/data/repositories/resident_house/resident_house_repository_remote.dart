import 'package:sirnawa_mobile/data/repositories/resident_house/resident_house_repository.dart';
import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/data/services/api/model/resident_house_request/resident_house_request_model.dart';
import 'package:sirnawa_mobile/data/services/api/resident_house_services.dart';
import 'package:sirnawa_mobile/domain/model/resident_house/resident_house_model.dart';
import 'package:sirnawa_mobile/utils/result.dart';

class ResidentHouseRepositoryRemote implements ResidentHouseRepository {
  ResidentHouseRepositoryRemote({
    required ResidentHouseService residentHouseService,
  }) : _residentHouseService = residentHouseService;

  final ResidentHouseService _residentHouseService;

  @override
  Future<Result<ApiResponse<List<ResidentHouseModel>>>>
  getListResidentHouseByHouseID({required String houseID}) async {
    try {
      return await _residentHouseService.getResidentHouseByHouseID(
        houseID: houseID,
      );
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> createResidentHouse(
    ResidentHouseRequestModel houseArea,
  ) async {
    try {
      return await _residentHouseService.createResidentHouse(houseArea);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> changeToPrimary(String id) async {
    try {
      return await _residentHouseService.changeToPrimary(id);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> delete(String id) async {
    try {
      return await _residentHouseService.deleteResidentHouse(id);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}

import 'package:sirnawa_mobile/data/repositories/housing_area/housing_area_repository.dart';
import 'package:sirnawa_mobile/data/services/api/housing_area_services.dart';
import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/data/services/api/model/housing_area/housing_area_request_model.dart';
import 'package:sirnawa_mobile/domain/model/housing_area/housing_area_model.dart';
import 'package:sirnawa_mobile/utils/result.dart';

class HousingAreaRepositoryRemote implements HousingAreaRepository {
  HousingAreaRepositoryRemote({required HousingAreaService housingAreaService})
    : _housingAreaService = housingAreaService;

  final HousingAreaService _housingAreaService;

  @override
  Future<Result<ApiResponse<List<HousingAreaModel>>>> getListHouseArea(
    Map<String, dynamic>? queryParams,
  ) async {
    try {
      return await _housingAreaService.getHousingAreas(queryParams);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> createHouseArea(
    HousingAreaRequestModel houseArea,
  ) async {
    try {
      return await _housingAreaService.createHousingArea(houseArea);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> updateHouseArea(
    String id,
    HousingAreaRequestModel houseArea,
  ) async {
    try {
      return await _housingAreaService.updateHousingArea(id, houseArea);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> delete(String id) async {
    try {
      return await _housingAreaService.deleteHousingArea(id);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}

import 'package:sirnawa_mobile/data/repositories/house/house_repository.dart';
import 'package:sirnawa_mobile/data/services/api/house_services.dart';
import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/data/services/api/model/house/house_request_model.dart';
import 'package:sirnawa_mobile/domain/model/house/house_model.dart';
import 'package:sirnawa_mobile/utils/result.dart';

class HouseRepositoryRemote implements HouseRepository {
  HouseRepositoryRemote({required HouseService houseService})
    : _houseService = houseService;

  final HouseService _houseService;

  @override
  Future<Result<ApiResponse<List<HouseModel>>>> getListHouse(
    Map<String, dynamic>? queryParams,
  ) async {
    try {
      return await _houseService.getHouses(queryParams);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> createHouse(HouseRequestModel house) async {
    try {
      return await _houseService.createHouse(house);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> updateHouse(String id, HouseRequestModel house) async {
    try {
      return await _houseService.updateHouse(id, house);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> delete(String id) async {
    try {
      return await _houseService.deleteHouse(id);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}

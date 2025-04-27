import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/data/services/api/model/house/house_request_model.dart';
import 'package:sirnawa_mobile/domain/model/house/house_model.dart';
import 'package:sirnawa_mobile/utils/result.dart';

abstract class HouseRepository {
  Future<Result<ApiResponse<List<HouseModel>>>> getListHouse(
    Map<String, dynamic>? queryParams,
  );
  Future<Result<void>> createHouse(HouseRequestModel house);
  Future<Result<void>> updateHouse(String id, HouseRequestModel house);
  Future<Result<void>> delete(String id);
}

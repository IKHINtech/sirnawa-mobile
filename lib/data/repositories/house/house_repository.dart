import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/domain/model/house/house_model.dart';
import 'package:sirnawa_mobile/utils/result.dart';

abstract class HouseRepository {
  Future<Result<ApiResponse<List<HouseModel>>>> getListHouse(
    Map<String, dynamic>? queryParams,
  );
  Future<Result<void>> createHouse(HouseModel house);
  Future<Result<void>> updateHouse(String id, HouseModel house);
  Future<Result<void>> delete(String id);
}

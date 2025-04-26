import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/domain/model/housing_area/housing_area_model.dart';
import 'package:sirnawa_mobile/utils/result.dart';

abstract class HouseAreaRepository {
  Future<Result<ApiResponse<List<HousingAreaModel>>>> getListHouseArea(
    Map<String, dynamic>? queryParams,
  );
  Future<Result<void>> createHouseArea(HousingAreaModel houseArea);
  Future<Result<void>> updateHouseArea(String id, HousingAreaModel houseArea);
  Future<Result<void>> delete(String id);
}

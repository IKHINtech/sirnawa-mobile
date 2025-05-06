import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/data/services/api/model/resident_house_request/resident_house_request_model.dart';
import 'package:sirnawa_mobile/domain/model/resident_house/resident_house_model.dart';
import 'package:sirnawa_mobile/utils/result.dart';

abstract class ResidentHouseRepository {
  Future<Result<ApiResponse<List<ResidentHouseModel>>>>
  getListResidentHouseByHouseID({required String houseID});
  Future<Result<void>> createResidentHouse(ResidentHouseRequestModel houseArea);
  Future<Result<void>> changeToPrimary(String id);
  Future<Result<void>> delete(String id);
}

import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/domain/model/resident/resident_model.dart';
import 'package:sirnawa_mobile/utils/result.dart';

abstract class ResidentRepository {
  Future<Result<ApiResponse<List<ResidentModel>>>> getListResident(
    Map<String, dynamic>? queryParams,
  );
  Future<Result<ApiResponse<ResidentModel>>> getResidentByID();
  Future<Result<void>> createResident(ResidentModel rt);
  Future<Result<void>> delete(String id);
}

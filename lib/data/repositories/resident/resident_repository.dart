import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/data/services/api/model/resident/resident_request_model.dart';
import 'package:sirnawa_mobile/domain/model/resident/resident_model.dart';
import 'package:sirnawa_mobile/utils/result.dart';

abstract class ResidentRepository {
  Future<Result<ApiResponse<List<ResidentModel>>>> getResidents(
    Map<String, dynamic>? queryParams,
  );
  Future<Result<void>> createResident(ResidentRequestModel resident);
  Future<Result<void>> updateResident(String id, ResidentRequestModel resident);
  Future<Result<void>> deleteResident(String id);
}

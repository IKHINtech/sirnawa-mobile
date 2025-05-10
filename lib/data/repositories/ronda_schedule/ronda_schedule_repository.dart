import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/data/services/api/model/ronda_schedule/ronda_schedule_request_model.dart';
import 'package:sirnawa_mobile/domain/model/ronda_schedule/ronda_schedule_model.dart';
import 'package:sirnawa_mobile/utils/result.dart';

abstract class RondaScheduleRepository {
  Future<Result<ApiResponse<List<RondaScheduleModel>>>> getListRondaSchedule(
    Map<String, dynamic>? queryParams,
  );
  Future<Result<void>> createRondaSchedule(
    RondaScheduleRequestModel rondaSchedule,
  );
  Future<Result<void>> updateRondaSchedule(
    String id,
    RondaScheduleRequestModel rondaSchedule,
  );
  Future<Result<void>> delete(String id);
  Future<RondaScheduleModel?> getDetailRondaSchedule(String id);
}

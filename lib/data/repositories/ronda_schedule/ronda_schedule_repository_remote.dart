import 'package:sirnawa_mobile/data/repositories/ronda_schedule/ronda_schedule_repository.dart';
import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/data/services/api/model/ronda_schedule/ronda_schedule_request_model.dart';
import 'package:sirnawa_mobile/data/services/api/ronda_schedule_services.dart';
import 'package:sirnawa_mobile/domain/model/ronda_schedule/ronda_schedule_model.dart';
import 'package:sirnawa_mobile/utils/result.dart';

class RondaScheduleRepositoryRemote implements RondaScheduleRepository {
  RondaScheduleRepositoryRemote({
    required RondaScheduleService rondaScheduleService,
  }) : _rondaScheduleService = rondaScheduleService;
  final RondaScheduleService _rondaScheduleService;

  @override
  Future<Result<ApiResponse<List<RondaScheduleModel>>>> getListRondaSchedule(
    Map<String, dynamic>? queryParams,
  ) async {
    try {
      return await _rondaScheduleService.getRondaSchedules(queryParams);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> createRondaSchedule(
    RondaScheduleRequestModel rondaSchedule,
  ) async {
    try {
      return await _rondaScheduleService.createRondaSchedule(rondaSchedule);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<void>> updateRondaSchedule(
    String id,
    RondaScheduleRequestModel rondaSchedule,
  ) async {
    try {
      return await _rondaScheduleService.updateRondaSchedule(id, rondaSchedule);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<RondaScheduleModel?> getDetailRondaSchedule(String id) async {
    try {
      final res = await _rondaScheduleService.getDetailRondaSchedule(id: id);
      switch (res) {
        case Ok():
          return res.value.data;
        case Error():
          throw Exception('Failed to load house detail: ${res.error}');
      }
    } on Exception catch (e) {
      throw Exception('Failed to load house detail: $e');
    }
  }

  @override
  Future<Result<void>> delete(String id) async {
    try {
      return await _rondaScheduleService.deleteRondaSchedule(id);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}

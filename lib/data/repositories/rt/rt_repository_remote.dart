import 'package:sirnawa_mobile/data/repositories/rt/rt_repository.dart';
import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/data/services/api/rt_services.dart';
import 'package:sirnawa_mobile/domain/model/rt/rt_model.dart';
import 'package:sirnawa_mobile/utils/result.dart';

class RtRepositoryRemote implements RtRepository {
  RtRepositoryRemote({required RtService rtService}) : _rtService = rtService;
  final RtService _rtService;

  // List<RtModel>? _cachedRts;

  @override
  Future<Result<ApiResponse<List<RtModel>>>> getBookingsList() async {
    try {
      return await _rtService.getRts();
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}

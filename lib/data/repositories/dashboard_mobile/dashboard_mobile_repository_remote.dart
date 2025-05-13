import 'package:sirnawa_mobile/data/repositories/dashboard_mobile/dashboard_mobile_repository.dart';
import 'package:sirnawa_mobile/data/services/api/dashboard_mobile_services.dart';
import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/domain/model/dashboard/dashboard_mobile_model.dart';
import 'package:sirnawa_mobile/utils/result.dart';

class DashboardMobileRepositoryRemote implements DashboardMobileRepository {
  DashboardMobileRepositoryRemote({
    required DashboardMobileService dashboardMobileService,
  }) : _dashboardMobileService = dashboardMobileService;
  final DashboardMobileService _dashboardMobileService;

  @override
  Future<ApiResponse<DashboardMobileModel>> getInfo(
    Map<String, dynamic>? queryParams,
  ) async {
    try {
      final response = await _dashboardMobileService.getDashboardMobiles(
        queryParams,
      );
      switch (response) {
        case Ok():
          return response.value;
        case Error():
          throw Exception(response.error);
      }
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}

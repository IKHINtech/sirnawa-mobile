import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/domain/model/dashboard/dashboard_mobile_model.dart';

abstract class DashboardMobileRepository {
  Future<ApiResponse<DashboardMobileModel>> getInfo(
    Map<String, dynamic>? queryParams,
  );
}

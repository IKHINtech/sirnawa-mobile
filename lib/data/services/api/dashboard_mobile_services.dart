import 'package:dio/dio.dart';
import 'package:sirnawa_mobile/data/services/api/api_client.dart';
import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/domain/model/dashboard/dashboard_mobile_model.dart';
import 'package:sirnawa_mobile/utils/error_parser.dart';
import 'package:sirnawa_mobile/utils/result.dart';

class DashboardMobileService {
  final ApiClient apiClient;

  DashboardMobileService(this.apiClient);

  // ✅ GET /dashboard/mobile
  Future<Result<ApiResponse<DashboardMobileModel>>> getDashboardMobiles(
    Map<String, dynamic>? queryParams,
  ) async {
    try {
      final Response<dynamic> response = await apiClient.get(
        '/dashboard/mobile',
        queryParams: queryParams,
      );

      final ApiResponse<DashboardMobileModel> data =
          ApiResponse<DashboardMobileModel>.fromJson(
            response.data,
            (json) =>
                DashboardMobileModel.fromJson(json as Map<String, dynamic>),
          );

      return Result<ApiResponse<DashboardMobileModel>>.ok(data);
    } catch (e) {
      return Result<ApiResponse<DashboardMobileModel>>.error(
        Exception(parseDioError(e)),
      );
    }
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sirnawa_mobile/config/app_providers.dart';
import 'package:sirnawa_mobile/data/repositories/dashboard_mobile/dashboard_mobile_repository.dart';
import 'package:sirnawa_mobile/data/repositories/dashboard_mobile/dashboard_mobile_repository_remote.dart';
import 'package:sirnawa_mobile/data/services/api/api_client.dart';
import 'package:sirnawa_mobile/data/services/api/dashboard_mobile_services.dart';
import 'package:sirnawa_mobile/domain/model/dashboard/dashboard_mobile_model.dart';

final Provider<DashboardMobileService> dashboardMobileServiceProvider =
    Provider<DashboardMobileService>((Ref<DashboardMobileService> ref) {
      return DashboardMobileService(ref.read<ApiClient>(apiClientProvider));
    });

final Provider<DashboardMobileRepository> dashboardMobileRepositoryProvider =
    Provider<DashboardMobileRepository>((Ref<DashboardMobileRepository> ref) {
      return DashboardMobileRepositoryRemote(
        dashboardMobileService: ref.read<DashboardMobileService>(
          dashboardMobileServiceProvider,
        ),
      );
    });
final FutureProvider<DashboardMobileModel?> dashboardMobileProvider =
    FutureProvider<DashboardMobileModel?>((Ref<Object?> ref) async {
      final DashboardMobileRepository repository = ref
          .watch<DashboardMobileRepository>(dashboardMobileRepositoryProvider);
      final rtID = ref.watch<String>(
        homeViewModelProvider.select((s) => s.userRtModel?.rtId ?? ""),
      );

      final houseID = ref.watch<String>(
        homeViewModelProvider.select((s) => s.residentHouse?.house?.id ?? ""),
      );

      try {
        final response = await repository.getInfo({
          "house_id": houseID,
          "rt_id": rtID,
        });
        return response.data;
      } catch (e, _) {
        ref
            .read<StateController<String?>>(
              dashboardMobileErrorProvider.notifier,
            )
            .state = e.toString();
        rethrow; // Tetap lempar error agar bisa ditangkap oleh AsyncValue
      }
    });

final AutoDisposeStateProvider<String?> dashboardMobileErrorProvider =
    StateProvider.autoDispose<String?>((Ref ref) => null);

// ========== Ronda Schedule ========== //
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sirnawa_mobile/config/app_providers.dart';
import 'package:sirnawa_mobile/data/repositories/ronda_schedule/ronda_schedule_repository.dart';
import 'package:sirnawa_mobile/data/repositories/ronda_schedule/ronda_schedule_repository_remote.dart';
import 'package:sirnawa_mobile/data/services/api/api_client.dart';
import 'package:sirnawa_mobile/data/services/api/ronda_schedule_services.dart';
import 'package:sirnawa_mobile/domain/model/ronda_schedule/ronda_schedule_model.dart';
import 'package:sirnawa_mobile/ui/admin/ronda_schedule/ronda_schedule_viewmodel/ronda_schedule_viewmodel.dart';

final AutoDisposeFutureProviderFamily<RondaScheduleModel?, String>
rondaScheduleDetailProvider = FutureProvider.autoDispose
    .family<RondaScheduleModel?, String>((
      Ref<Object?> ref,
      String groupID,
    ) async {
      final RondaScheduleRepository repository = ref
          .watch<RondaScheduleRepository>(rondaScheduleRepositoryProvider);
      try {
        final RondaScheduleModel? response = await repository
            .getDetailRondaSchedule(groupID);
        return response;
      } catch (e, _) {
        // Simpan error untuk ditampilkan di UI
        ref
            .read<StateController<String?>>(rondaScheduleErrorProvider.notifier)
            .state = e.toString();
        rethrow; // Tetap lempar error agar bisa ditangkap oleh AsyncValue
      }
    });

final AutoDisposeStateProvider<String?> rondaScheduleErrorProvider =
    StateProvider.autoDispose<String?>((Ref ref) => null);

final rondaSchedulePaginationProvider = StateNotifierProvider.autoDispose<
  RondaScheduleListNotifier,
  AsyncValue<List<RondaScheduleModel>>
>((ref) {
  final repository = ref.watch(rondaScheduleRepositoryProvider);
  final rtId = ref.watch(
    homeViewModelProvider.select((s) => s.userRtModel?.rtId ?? ""),
  );

  if (rtId.isEmpty) {
    return RondaScheduleListNotifier(repository, "")
      // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
      ..state = const AsyncValue.data([]);
  }

  return RondaScheduleListNotifier(repository, rtId);
});
final Provider<RondaScheduleService> rondaScheduleServiceProvider =
    Provider<RondaScheduleService>((Ref<RondaScheduleService> ref) {
      return RondaScheduleService(ref.read<ApiClient>(apiClientProvider));
    });

final Provider<RondaScheduleRepository> rondaScheduleRepositoryProvider =
    Provider<RondaScheduleRepository>((Ref<RondaScheduleRepository> ref) {
      return RondaScheduleRepositoryRemote(
        rondaScheduleService: ref.read<RondaScheduleService>(
          rondaScheduleServiceProvider,
        ),
      );
    });

final StateNotifierProvider<RondaScheduleViewModel, RondaScheduleState>
rondaScheduleViewModelProvider =
    StateNotifierProvider<RondaScheduleViewModel, RondaScheduleState>((ref) {
      final rtId = ref.watch(
        homeViewModelProvider.select(
          (s) => s.residentHouse?.house!.rt?.id ?? "",
        ),
      );
      return RondaScheduleViewModel(
        repository: ref.read<RondaScheduleRepository>(
          rondaScheduleRepositoryProvider,
        ),
        rtId: rtId,
      );
    });

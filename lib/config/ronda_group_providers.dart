// ========== Ronda Group ========== //

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sirnawa_mobile/config/app_providers.dart';
import 'package:sirnawa_mobile/data/repositories/ronda_group/ronda_group_repository.dart';
import 'package:sirnawa_mobile/data/repositories/ronda_group/ronda_group_repository_remote.dart';
import 'package:sirnawa_mobile/data/services/api/api_client.dart';
import 'package:sirnawa_mobile/data/services/api/ronda_group_services.dart';
import 'package:sirnawa_mobile/domain/model/ronda_group/ronda_group_model.dart';
import 'package:sirnawa_mobile/ui/admin/ronda_group/ronda_group_viewmodel/ronda_group_viewmodel.dart';

final AutoDisposeFutureProviderFamily<RondaGroupModel?, String>
rondaGroupDetailProvider = FutureProvider.autoDispose
    .family<RondaGroupModel?, String>((Ref<Object?> ref, String groupID) async {
      final RondaGroupRepository repository = ref.watch<RondaGroupRepository>(
        rondaGroupRepositoryProvider,
      );
      try {
        final RondaGroupModel? response = await repository.getDetailRondaGroup(
          groupID,
        );
        return response;
      } catch (e, _) {
        // Simpan error untuk ditampilkan di UI
        ref
            .read<StateController<String?>>(rondaGroupErrorProvider.notifier)
            .state = e.toString();
        rethrow; // Tetap lempar error agar bisa ditangkap oleh AsyncValue
      }
    });

final AutoDisposeStateProvider<String?> rondaGroupErrorProvider =
    StateProvider.autoDispose<String?>((Ref ref) => null);

final rondaGroupPaginationProvider = StateNotifierProvider.autoDispose<
  RondaGroupListNotifier,
  AsyncValue<List<RondaGroupModel>>
>((ref) {
  final repository = ref.watch(rondaGroupRepositoryProvider);
  final rtId = ref.watch(
    homeViewModelProvider.select((s) => s.userRtModel?.rtId ?? ""),
  );

  if (rtId.isEmpty) {
    return RondaGroupListNotifier(repository, "")
      // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
      ..state = const AsyncValue.data([]);
  }

  return RondaGroupListNotifier(repository, rtId);
});
final Provider<RondaGroupService> rondaGroupServiceProvider =
    Provider<RondaGroupService>((Ref<RondaGroupService> ref) {
      return RondaGroupService(ref.read<ApiClient>(apiClientProvider));
    });

final Provider<RondaGroupRepository> rondaGroupRepositoryProvider =
    Provider<RondaGroupRepository>((Ref<RondaGroupRepository> ref) {
      return RondaGroupRepositoryRemote(
        rondaGroupService: ref.read<RondaGroupService>(
          rondaGroupServiceProvider,
        ),
      );
    });

final StateNotifierProvider<RondaGroupViewModel, RondaGroupState>
rondaGroupViewModelProvider = StateNotifierProvider<
  RondaGroupViewModel,
  RondaGroupState
>((ref) {
  final rtId = ref.watch(
    homeViewModelProvider.select((s) => s.residentHouse?.house!.rt?.id ?? ""),
  );
  return RondaGroupViewModel(
    repository: ref.read<RondaGroupRepository>(rondaGroupRepositoryProvider),
    rtId: rtId,
  );
});

// ===== RESIDENT ========= //
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sirnawa_mobile/config/app_providers.dart';
import 'package:sirnawa_mobile/data/repositories/resident/resident_repository.dart';
import 'package:sirnawa_mobile/data/repositories/resident/resident_repository_remote.dart';
import 'package:sirnawa_mobile/data/services/api/api_client.dart';
import 'package:sirnawa_mobile/data/services/api/resident_services.dart';
import 'package:sirnawa_mobile/domain/model/resident/resident_model.dart';
import 'package:sirnawa_mobile/ui/admin/resident/resident_view_model/resident_viewmodel.dart';
import 'package:sirnawa_mobile/ui/home/view_models/home_viewmodel.dart';

final residentSearchProvider = StateProvider<String?>((ref) => null);
final FutureProvider<List<ResidentModel>> residentOptionsProvider =
    FutureProvider<List<ResidentModel>>((Ref ref) async {
      final searchTerm = ref.watch(residentSearchProvider);
      final String rtid =
          ref
              .watch<HomeState>(homeViewModelProvider)
              .residentHouse
              ?.house!
              .rt
              ?.id ??
          "";
      await ref
          .read<ResidentViewModel>(residentViewModelProvider.notifier)
          .fetchListResident(rtId: rtid, search: searchTerm);
      return ref.read<ResidentState>(residentViewModelProvider).list;
    });

final residentListProvider = StateNotifierProvider<
  ResidentListNotifier,
  AsyncValue<List<ResidentModel>>
>((ref) {
  final repository = ref.watch(residentRepositoryProvider);
  final rtId = ref.watch(
    homeViewModelProvider.select((s) => s.residentHouse?.house!.rt?.id ?? ""),
  );
  return ResidentListNotifier(repository, rtId);
});

final Provider<ResidentService> residentServiceProvider =
    Provider<ResidentService>((Ref<ResidentService> ref) {
      return ResidentService(ref.read<ApiClient>(apiClientProvider));
    });

final Provider<ResidentRepository> residentRepositoryProvider =
    Provider<ResidentRepository>((Ref<ResidentRepository> ref) {
      return ResidentRepositoryRemote(
        residentService: ref.read<ResidentService>(residentServiceProvider),
      );
    });

final StateNotifierProvider<ResidentViewModel, ResidentState>
residentViewModelProvider =
    StateNotifierProvider<ResidentViewModel, ResidentState>((ref) {
      return ResidentViewModel(
        repository: ref.read<ResidentRepository>(residentRepositoryProvider),
      );
    });

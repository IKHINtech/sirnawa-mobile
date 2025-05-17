// ========== House ========== //
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sirnawa_mobile/config/app_providers.dart';
import 'package:sirnawa_mobile/data/repositories/house/house_repository.dart';
import 'package:sirnawa_mobile/data/repositories/house/house_repository_remote.dart';
import 'package:sirnawa_mobile/data/services/api/api_client.dart';
import 'package:sirnawa_mobile/data/services/api/house_services.dart';
import 'package:sirnawa_mobile/domain/model/house/house_model.dart';
import 'package:sirnawa_mobile/ui/admin/house/house_viewmodel/house_viewmodel.dart';

final AutoDisposeFutureProviderFamily<HouseModel?, String> houseDetailProvider =
    FutureProvider.autoDispose.family<HouseModel?, String>((
      Ref<Object?> ref,
      String houseId,
    ) async {
      final HouseRepository repository = ref.watch<HouseRepository>(
        houseRepositoryProvider,
      );
      try {
        final HouseModel? response = await repository.getDetailHouse(houseId);
        return response;
      } catch (e, _) {
        // Simpan error untuk ditampilkan di UI
        ref.read<StateController<String?>>(houseErrorProvider.notifier).state =
            e.toString();
        rethrow; // Tetap lempar error agar bisa ditangkap oleh AsyncValue
      }
    });

final AutoDisposeStateProvider<String?> houseErrorProvider =
    StateProvider.autoDispose<String?>((Ref ref) => null);

final houseListProvider = StateNotifierProvider.autoDispose.family<
  HouseListNotifier,
  AsyncValue<List<HouseModel>>,
  String
>((ref, blockId) {
  final repository = ref.watch(houseRepositoryProvider);
  final rtId = ref.watch(
    homeViewModelProvider.select((s) => s.residentHouse?.house!.rt?.id ?? ""),
  );
  return HouseListNotifier(repository, rtId, blockId);
});

final Provider<HouseService> houseServiceProvider = Provider<HouseService>((
  Ref<HouseService> ref,
) {
  return HouseService(ref.read<ApiClient>(apiClientProvider));
});

final Provider<HouseRepository> houseRepositoryProvider =
    Provider<HouseRepository>((Ref<HouseRepository> ref) {
      return HouseRepositoryRemote(
        houseService: ref.read<HouseService>(houseServiceProvider),
      );
    });

final StateNotifierProvider<HouseViewModel, HouseState> houseViewModelProvider =
    StateNotifierProvider<HouseViewModel, HouseState>((ref) {
      final rtId = ref.watch(
        homeViewModelProvider.select((s) => s.userRtModel?.rtId ?? ""),
      );
      return HouseViewModel(
        repository: ref.read<HouseRepository>(houseRepositoryProvider),
        rtID: rtId,
      );
    });

final houseOptionsWithParams = StateNotifierProvider.autoDispose.family<
  HouseListWithParamsNotifier,
  AsyncValue<List<HouseModel>>,
  Map<String, dynamic>
>((ref, params) {
  final repository = ref.watch(houseRepositoryProvider);
  final rtId = ref.watch(
    homeViewModelProvider.select((s) => s.residentHouse?.house!.rt?.id ?? ""),
  );
  return HouseListWithParamsNotifier(repository, rtId, params);
});

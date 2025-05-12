// ========== RESIDENT HOUSE ========== //
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sirnawa_mobile/config/app_providers.dart';
import 'package:sirnawa_mobile/config/house_provders.dart';
import 'package:sirnawa_mobile/data/repositories/resident_house/resident_house_repository.dart';
import 'package:sirnawa_mobile/data/repositories/resident_house/resident_house_repository_remote.dart';
import 'package:sirnawa_mobile/data/services/api/api_client.dart';
import 'package:sirnawa_mobile/data/services/api/resident_house_services.dart';
import 'package:sirnawa_mobile/domain/model/house/house_model.dart';
import 'package:sirnawa_mobile/domain/model/resident_house/resident_house_model.dart';
import 'package:sirnawa_mobile/ui/admin/house/house_viewmodel/house_viewmodel.dart';
import 'package:sirnawa_mobile/ui/admin/resident_house/resident_house_viewmodel/resident_house_viewmodel.dart';

final Provider<ResidentHouseService> residentHouseServiceProvider =
    Provider<ResidentHouseService>((Ref<ResidentHouseService> ref) {
      return ResidentHouseService(ref.read<ApiClient>(apiClientProvider));
    });

final Provider<ResidentHouseRepository> residentHouseRepositoryProvider =
    Provider<ResidentHouseRepository>((Ref<ResidentHouseRepository> ref) {
      return ResidentHouseRepositoryRemote(
        residentHouseService: ref.read<ResidentHouseService>(
          residentHouseServiceProvider,
        ),
      );
    });

final StateNotifierProvider<ResidentHouseViewModel, ResidentHouseState>
residentHouseViewModelProvider =
    StateNotifierProvider<ResidentHouseViewModel, ResidentHouseState>((ref) {
      return ResidentHouseViewModel(
        repository: ref.read<ResidentHouseRepository>(
          residentHouseRepositoryProvider,
        ),
      );
    });

final listPenghuniProvider =
    FutureProvider.family<List<ResidentHouseModel>, String>((
      ref,
      houseID,
    ) async {
      final viewModel = ref.read(residentHouseViewModelProvider.notifier);
      await viewModel.fetchPenghuni(houseID: houseID);
      return ref.read(residentHouseViewModelProvider).listPenghuni;
    });

final listResidentHouseProvider = StateNotifierProvider.autoDispose.family<
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

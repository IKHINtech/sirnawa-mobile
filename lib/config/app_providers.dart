import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sirnawa_mobile/config/auth_providers.dart';
import 'package:sirnawa_mobile/data/repositories/announcement/announcement_repository.dart';
import 'package:sirnawa_mobile/data/repositories/announcement/announcement_repository_remote.dart';
import 'package:sirnawa_mobile/data/repositories/auth/auth_repository.dart';
import 'package:sirnawa_mobile/data/repositories/block/block_repository.dart';
import 'package:sirnawa_mobile/data/repositories/block/block_repository_remote.dart';
import 'package:sirnawa_mobile/data/repositories/house/house_repository.dart';
import 'package:sirnawa_mobile/data/repositories/house/house_repository_remote.dart';
import 'package:sirnawa_mobile/data/repositories/housing_area/housing_area_reposiory_remote.dart';
import 'package:sirnawa_mobile/data/repositories/housing_area/housing_area_repository.dart';
import 'package:sirnawa_mobile/data/repositories/resident/resident_repository.dart';
import 'package:sirnawa_mobile/data/repositories/resident/resident_repository_remote.dart';
import 'package:sirnawa_mobile/data/repositories/resident_house/resident_house_repository.dart';
import 'package:sirnawa_mobile/data/repositories/resident_house/resident_house_repository_remote.dart';
import 'package:sirnawa_mobile/data/repositories/ronda_group/ronda_group_repository.dart';
import 'package:sirnawa_mobile/data/repositories/ronda_group/ronda_group_repository_remote.dart';
import 'package:sirnawa_mobile/data/repositories/ronda_group_member/ronda_group_member_repository.dart';
import 'package:sirnawa_mobile/data/repositories/ronda_group_member/ronda_group_member_repository_remote.dart';
import 'package:sirnawa_mobile/data/repositories/ronda_schedule/ronda_schedule_repository.dart';
import 'package:sirnawa_mobile/data/repositories/ronda_schedule/ronda_schedule_repository_remote.dart';
import 'package:sirnawa_mobile/data/repositories/rt/rt_repository.dart';
import 'package:sirnawa_mobile/data/repositories/rt/rt_repository_remote.dart';
import 'package:sirnawa_mobile/data/repositories/rw/rw_repository.dart';
import 'package:sirnawa_mobile/data/repositories/rw/rw_repository_remote.dart';
import 'package:sirnawa_mobile/data/repositories/user/user_repository.dart';
import 'package:sirnawa_mobile/data/repositories/user/user_repository_remote.dart';
import 'package:sirnawa_mobile/data/services/api/announcement_services.dart';
import 'package:sirnawa_mobile/data/services/api/api_client.dart';
import 'package:sirnawa_mobile/data/services/api/auth_api_client.dart';
import 'package:sirnawa_mobile/data/services/api/block_services.dart';
import 'package:sirnawa_mobile/data/services/api/house_services.dart';
import 'package:sirnawa_mobile/data/services/api/housing_area_services.dart';
import 'package:sirnawa_mobile/data/services/api/resident_house_services.dart';
import 'package:sirnawa_mobile/data/services/api/resident_services.dart';
import 'package:sirnawa_mobile/data/services/api/ronda_group_member_service.dart';
import 'package:sirnawa_mobile/data/services/api/ronda_group_services.dart';
import 'package:sirnawa_mobile/data/services/api/ronda_schedule_services.dart';
import 'package:sirnawa_mobile/data/services/api/rt_services.dart';
import 'package:sirnawa_mobile/data/services/api/rw_services.dart';
import 'package:sirnawa_mobile/data/services/api/user_services.dart';
import 'package:sirnawa_mobile/data/services/share_preference_service.dart';
import 'package:sirnawa_mobile/domain/model/announcement/announcement_model.dart';
import 'package:sirnawa_mobile/domain/model/block/block_model.dart';
import 'package:sirnawa_mobile/domain/model/house/house_model.dart';
import 'package:sirnawa_mobile/domain/model/resident/resident_model.dart';
import 'package:sirnawa_mobile/domain/model/resident_house/resident_house_model.dart';
import 'package:sirnawa_mobile/domain/model/ronda_group/ronda_group_model.dart';
import 'package:sirnawa_mobile/domain/model/ronda_schedule/ronda_schedule_model.dart';
import 'package:sirnawa_mobile/ui/admin/announcement/announcement_viewmodel/announcement_viewmodel.dart';
import 'package:sirnawa_mobile/ui/admin/block/block_view_model/block_viewmodel.dart';
import 'package:sirnawa_mobile/ui/admin/house/house_viewmodel/house_viewmodel.dart';
import 'package:sirnawa_mobile/ui/admin/housing_area/housing_area_viewmodel/housing_area_viewmodel.dart';
import 'package:sirnawa_mobile/ui/admin/resident/resident_view_model/resident_viewmodel.dart';
import 'package:sirnawa_mobile/ui/admin/resident_house/resident_house_viewmodel/resident_house_viewmodel.dart';
import 'package:sirnawa_mobile/ui/admin/ronda_group/ronda_group_viewmodel/ronda_group_viewmodel.dart';
import 'package:sirnawa_mobile/ui/admin/ronda_group_member/view_models/ronda_group_member_viewmodel.dart';
import 'package:sirnawa_mobile/ui/admin/ronda_schedule/ronda_schedule_viewmodel/ronda_schedule_viewmodel.dart';
import 'package:sirnawa_mobile/ui/admin/rt/rt_viewmodel/rt_viewmodel.dart';
import 'package:sirnawa_mobile/ui/admin/rw/rw_viewmodel/rw_viewmodel.dart';
import 'package:sirnawa_mobile/ui/auth/login/view_models/login_viewmodel.dart';
import 'package:sirnawa_mobile/ui/home/view_models/home_viewmodel.dart';

// ========== Services Providers ========== //
final Provider<AuthApiClient> authApiClientProvider = Provider<AuthApiClient>(
  (Ref<AuthApiClient> ref) => AuthApiClient(),
);

final Provider<ApiClient> apiClientProvider = Provider<ApiClient>((
  Ref<ApiClient> ref,
) {
  return ApiClient();
});

final Provider<SharedPreferencesService> sharedPreferencesServiceProvider =
    Provider<SharedPreferencesService>((Ref<SharedPreferencesService> ref) {
      return SharedPreferencesService();
    });

// ========== Housing Area ========== //
final Provider<HousingAreaService> housingAreaServiceProvider =
    Provider<HousingAreaService>((Ref<HousingAreaService> ref) {
      return HousingAreaService(ref.read<ApiClient>(apiClientProvider));
    });

final Provider<HousingAreaRepository> housingAreaRepositoryProvider =
    Provider<HousingAreaRepository>((Ref<HousingAreaRepository> ref) {
      return HousingAreaRepositoryRemote(
        housingAreaService: ref.read<HousingAreaService>(
          housingAreaServiceProvider,
        ),
      );
    });

final StateNotifierProvider<HousingAreaViewModel, HousingAreaState>
housingAreaViewModelProvider =
    StateNotifierProvider<HousingAreaViewModel, HousingAreaState>((ref) {
      return HousingAreaViewModel(
        repository: ref.read<HousingAreaRepository>(
          housingAreaRepositoryProvider,
        ),
      );
    });

// ========== RT ========== //
final Provider<RtService> rtServiceProvider = Provider<RtService>((
  Ref<RtService> ref,
) {
  return RtService(ref.read<ApiClient>(apiClientProvider));
});

final Provider<RtRepository> rtRepositoryProvider = Provider<RtRepository>((
  Ref<RtRepository> ref,
) {
  return RtRepositoryRemote(rtService: ref.read<RtService>(rtServiceProvider));
});

final StateNotifierProvider<RtViewModel, RtState> rtViewModelProvider =
    StateNotifierProvider<RtViewModel, RtState>((ref) {
      return RtViewModel(
        repository: ref.read<RtRepository>(rtRepositoryProvider),
      );
    });
// ========== Ronda Group Member ========== //

final Provider<RondaGroupMemberService> rondaGroupMemberServiceProvider =
    Provider<RondaGroupMemberService>((Ref<RondaGroupMemberService> ref) {
      return RondaGroupMemberService(ref.read<ApiClient>(apiClientProvider));
    });

final Provider<RondaGroupMemberRepository> rondaGroupMemberRepositoryProvider =
    Provider<RondaGroupMemberRepository>((Ref<RondaGroupMemberRepository> ref) {
      return RondaGroupMemberRepositoryRemote(
        rondaGroupMemberService: ref.read<RondaGroupMemberService>(
          rondaGroupMemberServiceProvider,
        ),
      );
    });

final StateNotifierProvider<RondaGroupMemberViewModel, RondaGroupMemberState>
rondaGroupMemberViewModelProvider = StateNotifierProvider<
  RondaGroupMemberViewModel,
  RondaGroupMemberState
>((ref) {
  final rtId = ref.watch(
    homeViewModelProvider.select((s) => s.residentHouse?.house!.rt?.id ?? ""),
  );
  return RondaGroupMemberViewModel(
    repository: ref.read<RondaGroupMemberRepository>(
      rondaGroupMemberRepositoryProvider,
    ),
    gropuID: rtId,
  );
});

// ========== Ronda Schedule ========== //
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

// ========== Ronda Group ========== //

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

// ========== Announcement ========== //

final announcementPaginationProvider = StateNotifierProvider.autoDispose<
  AnnouncementListNotifier,
  AsyncValue<List<AnnouncementModel>>
>((ref) {
  final repository = ref.watch(announcementRepositoryProvider);
  final rtId = ref.watch(
    homeViewModelProvider.select((s) => s.residentHouse?.house!.rt?.id ?? ""),
  );

  if (rtId.isEmpty) {
    return AnnouncementListNotifier(repository, "")
      // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
      ..state = const AsyncValue.data([]);
  }

  return AnnouncementListNotifier(repository, rtId);
});

final Provider<AnnouncementService> announcementServiceProvider =
    Provider<AnnouncementService>((Ref<AnnouncementService> ref) {
      return AnnouncementService(ref.read<ApiClient>(apiClientProvider));
    });

final Provider<AnnouncementRepository> announcementRepositoryProvider =
    Provider<AnnouncementRepository>((Ref<AnnouncementRepository> ref) {
      return AnnouncementRepositoryRemote(
        announcementService: ref.read<AnnouncementService>(
          announcementServiceProvider,
        ),
      );
    });

final StateNotifierProvider<AnnouncementViewModel, AnnouncementState>
announcementViewModelProvider =
    StateNotifierProvider<AnnouncementViewModel, AnnouncementState>((ref) {
      return AnnouncementViewModel(
        repository: ref.read<AnnouncementRepository>(
          announcementRepositoryProvider,
        ),
      );
    });

// ========== RW ========== //
final Provider<RwService> rwServiceProvider = Provider<RwService>((
  Ref<RwService> ref,
) {
  return RwService(ref.read<ApiClient>(apiClientProvider));
});

final Provider<RwRepository> rwRepositoryProvider = Provider<RwRepository>((
  Ref<RwRepository> ref,
) {
  return RwRepositoryRemote(rwService: ref.read<RwService>(rwServiceProvider));
});

final StateNotifierProvider<RwViewModel, RwState> rwViewModelProvider =
    StateNotifierProvider<RwViewModel, RwState>((ref) {
      return RwViewModel(
        repository: ref.read<RwRepository>(rwRepositoryProvider),
      );
    });

// ========== House ========== //
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

final houseNotInGroupNotifier = StateNotifierProvider.autoDispose((ref) {
  final repository = ref.watch(houseRepositoryProvider);
  final rtId = ref.watch(
    homeViewModelProvider.select((s) => s.residentHouse?.house!.rt?.id ?? ""),
  );
  return HouseListNotInGroupNotifier(repository, rtId);
});

// ===== RESIDENT ========= //
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

final residentListProvider = StateNotifierProvider.autoDispose.family<
  ResidentListNotifier,
  AsyncValue<List<ResidentModel>>,
  String
>((ref, rtId) {
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
// ========== RESIDENT HOUSE ========== //
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

// ========== BLOCK ========== //
final Provider<BlockService> blockServiceProvider = Provider<BlockService>((
  Ref<BlockService> ref,
) {
  return BlockService(ref.read<ApiClient>(apiClientProvider));
});

final Provider<BlockRepository> blockRepositoryProvider =
    Provider<BlockRepository>((Ref<BlockRepository> ref) {
      return BlockRepositoryRemote(
        blockService: ref.read<BlockService>(blockServiceProvider),
      );
    });

final StateNotifierProvider<BlockViewModel, BlockState> blockViewModelProvider =
    StateNotifierProvider<BlockViewModel, BlockState>((ref) {
      return BlockViewModel(
        repository: ref.read<BlockRepository>(blockRepositoryProvider),
      );
    });

final FutureProvider<List<BlockModel>> blocksProvider =
    FutureProvider<List<BlockModel>>((Ref ref) async {
      final String rtid =
          ref
              .watch<HomeState>(homeViewModelProvider)
              .residentHouse
              ?.house!
              .rt
              ?.id ??
          "";
      await ref
          .read<BlockViewModel>(blockViewModelProvider.notifier)
          .fetchBlockOptions(rtId: rtid);
      return ref.read<BlockState>(blockViewModelProvider).blockOptions;
    });

// ========== USER ========== //
final Provider<UserService> userServiceProvider = Provider<UserService>((
  Ref<UserService> ref,
) {
  return UserService(ref.read<ApiClient>(apiClientProvider));
});
final Provider<UserRepository> userRepositoryProvider =
    Provider<UserRepository>((Ref<UserRepository> ref) {
      return UserRepositoryRemote(
        userService: ref.read<UserService>(userServiceProvider),
      );
    });

// ========== HOME  ========== //
final StateNotifierProvider<HomeViewModel, HomeState> homeViewModelProvider =
    StateNotifierProvider<HomeViewModel, HomeState>((ref) {
      return HomeViewModel(
        userRepo: ref.read<UserRepository>(userRepositoryProvider),
        authRepository: ref.read<AuthRepository>(authRepositoryProvider),
      );
    });

final selectedBlockProvider = StateProvider<String>((ref) {
  // Nilai default: block ID dari rumah resident
  final homeState = ref.watch(homeViewModelProvider);
  return homeState.residentHouse?.house!.block?.id ?? "";
});
// ========= Login View Model =========  //
final StateNotifierProvider<LoginViewModel, LoginState> loginViewModelProvider =
    StateNotifierProvider<LoginViewModel, LoginState>((ref) {
      return LoginViewModel(
        authRepository: ref.watch<AuthRepository>(authRepositoryProvider),
      );
    });

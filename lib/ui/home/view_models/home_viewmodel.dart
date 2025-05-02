import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sirnawa_mobile/data/repositories/auth/auth_repository.dart';
import 'package:sirnawa_mobile/data/repositories/user/user_repository.dart';
import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/domain/model/resident_house/resident_house_model.dart';
import 'package:sirnawa_mobile/domain/model/user/user_model.dart';
import 'package:sirnawa_mobile/domain/model/user_rt/user_rt_model.dart';
import 'package:sirnawa_mobile/utils/result.dart';

class HomeState {
  final bool isLoading;
  final String? error;
  final UserModel? user;
  final ResidentHouseModel? residentHouse;
  final UserRtModel? userRtModel;
  final List<ResidentHouseModel> listHouse;
  final AsyncValue<void> loadStatus;

  const HomeState({
    required this.isLoading,
    required this.error,
    required this.user,
    required this.loadStatus,
    required this.residentHouse,
    required this.listHouse,
    required this.userRtModel,
  });

  HomeState copyWith({
    bool? isLoading,
    String? error,
    UserModel? user,
    AsyncValue<void>? loadStatus,
    ResidentHouseModel? residentHouse,
    UserRtModel? userRtModel,
    List<ResidentHouseModel>? listHouse,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      user: user ?? this.user,
      loadStatus: loadStatus ?? this.loadStatus,
      residentHouse: residentHouse ?? this.residentHouse,
      listHouse: listHouse ?? this.listHouse,
      userRtModel: userRtModel ?? this.userRtModel, 
    );
  }

  factory HomeState.initial() {
    return const HomeState(
      isLoading: false,
      error: null,
      user: null,
      residentHouse: null,
      loadStatus: AsyncValue.data(null),
      listHouse: [],
      userRtModel: null
    );
  }
}

class HomeViewModel extends StateNotifier<HomeState> {
  final UserRepository _userRepo;
  final AuthRepository _authRepository;

  HomeViewModel({required UserRepository userRepo, required AuthRepository authRepository})
    : _userRepo = userRepo,
    _authRepository = authRepository,
      super(HomeState.initial()) {
    _fetchCurrentUser();
  }

  Future<void> _fetchCurrentUser() async {
    state = state.copyWith(
      isLoading: true,
      error: null,
      loadStatus: const AsyncValue.loading(),
    );

    final result = await _userRepo.getCurrentUser();

    switch (result) {
      case Ok<ApiResponse<UserModel>>():
        final primaryHouse = result.value.data?.resident?.residentHouses
            ?.firstWhere((house) => house.isPrimary == true);
            // final userRt = result.value.data?.userRTs?.firstWhere((userRt) => userRt.rtId == primaryHouse?.house.rtId);   
        state = state.copyWith(
          isLoading: false,
          residentHouse: primaryHouse,
          listHouse: result.value.data?.resident?.residentHouses ?? [],
          user: result.value.data,
          userRtModel: null,
          loadStatus: const AsyncValue.data(null),
        );
      case Error():
        state = state.copyWith(
          isLoading: false,
          error: result.error.toString(),
          loadStatus: AsyncValue.error(result.error, StackTrace.empty),
        );
    }
  }

  // Command pattern bisa diimplementasikan sebagai method biasa
  Future<void> reloadUser() async {
    return _fetchCurrentUser();
  }

  Future<void> logout() async {
    await _authRepository.logout();
  }

  void changeHouse(ResidentHouseModel house) {
    final userRt = state.user?.userRTs?.firstWhere((userRt) => userRt.rtId == house.house.rtId);
    state = state.copyWith(residentHouse: house,
    userRtModel: userRt,
    );
  }
}

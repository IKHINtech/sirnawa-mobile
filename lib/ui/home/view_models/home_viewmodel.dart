import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sirnawa_mobile/data/repositories/user/user_repository.dart';
import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/domain/model/user/user_model.dart';
import 'package:sirnawa_mobile/utils/result.dart';

class HomeState {
  final bool isLoading;
  final String? error;
  final UserModel? user;
  final AsyncValue<void> loadStatus;

  const HomeState({
    required this.isLoading,
    required this.error,
    required this.user,
    required this.loadStatus,
  });

  HomeState copyWith({
    bool? isLoading,
    String? error,
    UserModel? user,
    AsyncValue<void>? loadStatus,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      user: user ?? this.user,
      loadStatus: loadStatus ?? this.loadStatus,
    );
  }

  factory HomeState.initial() {
    return const HomeState(
      isLoading: false,
      error: null,
      user: null,
      loadStatus: AsyncValue.data(null),
    );
  }
}

class HomeViewModel extends StateNotifier<HomeState> {
  final UserRepository _userRepo;

  HomeViewModel({required UserRepository userRepo})
    : _userRepo = userRepo,
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
        state = state.copyWith(
          isLoading: false,
          user: result.value.data,
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
}

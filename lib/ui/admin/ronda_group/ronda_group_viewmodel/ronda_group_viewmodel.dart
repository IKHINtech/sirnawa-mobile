import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sirnawa_mobile/data/repositories/ronda_group/ronda_group_repository.dart';
import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/data/services/api/model/ronda_group/ronda_group_request_model.dart';
import 'package:sirnawa_mobile/domain/model/ronda_group/ronda_group_model.dart';
import 'package:sirnawa_mobile/utils/result.dart';

class RondaGroupState {
  final bool isLoading;
  final String? error;
  final List<RondaGroupModel> list;
  final bool hasNextPage;

  const RondaGroupState({
    required this.isLoading,
    required this.error,
    required this.list,
    required this.hasNextPage,
  });

  RondaGroupState copyWith({
    bool? isLoading,
    String? error,
    List<RondaGroupModel>? list,
    bool? hasNextPage,
  }) {
    return RondaGroupState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      list: list ?? this.list,
      hasNextPage: hasNextPage ?? this.hasNextPage,
    );
  }
}

class RondaGroupViewModel extends StateNotifier<RondaGroupState> {
  final RondaGroupRepository _repository;
  int _currentPage = 1;
  final int _limit = 10;
  int _totalPages = 1;

  RondaGroupViewModel({required RondaGroupRepository repository})
    : _repository = repository,
      super(
        const RondaGroupState(
          isLoading: false,
          error: null,
          list: [],
          hasNextPage: true,
        ),
      );

  Future<void> fetchListRondaGroup({bool reset = false}) async {
    try {
      state =
          reset
              ? const RondaGroupState(
                isLoading: true,
                error: null,
                list: [],
                hasNextPage: true,
              )
              : state.copyWith(isLoading: true);

      if (reset) {
        _currentPage = 1;
        _totalPages = 1;
      }

      final result = await _repository.getListRondaGroup({
        "page": _currentPage,
        "page_size": _limit,
      });

      switch (result) {
        case Ok<ApiResponse<List<RondaGroupModel>>>():
          _currentPage++;
          _totalPages = result.value.meta?.totalPages ?? 1;
          state = RondaGroupState(
            isLoading: false,
            error: null,
            list:
                reset
                    ? result.value.data ?? []
                    : [...state.list, ...?result.value.data],
            hasNextPage: _currentPage < _totalPages,
          );
          break;
        case Error<ApiResponse<List<RondaGroupModel>>>():
          state = state.copyWith(
            isLoading: false,
            error: result.error.toString(),
          );
          break;
      }
    } catch (e) {
      state = state.copyWith(isLoading: false, error: "Exception: $e");
    }
  }

  Future<void> loadMore() async {
    if (!(_currentPage < _totalPages) || state.isLoading) return;
    await fetchListRondaGroup();
  }

  Future<bool> createRondaGroup(RondaGroupRequestModel rondaGroup) async {
    state = state.copyWith(isLoading: true);
    try {
      final result = await _repository.createRondaGroup(rondaGroup);
      switch (result) {
        case Ok():
          // Opsional: setelah create, refresh list
          await fetchListRondaGroup(reset: true);
          return true;
        case Error():
          state = state.copyWith(
            isLoading: false,
            error: result.error.toString(),
          );
          return false;
      }
    } catch (e) {
      state = state.copyWith(isLoading: false, error: "Exception: $e");
      return false;
    }
  }

  Future<bool> updateRondaGroup(
    String id,
    RondaGroupRequestModel rondaGroup,
  ) async {
    state = state.copyWith(isLoading: true);
    try {
      final result = await _repository.updateRondaGroup(id, rondaGroup);
      switch (result) {
        case Ok():
          await fetchListRondaGroup(reset: true);
          return true;
        case Error():
          state = state.copyWith(
            isLoading: false,
            error: result.error.toString(),
          );
          return false;
      }
    } catch (e) {
      state = state.copyWith(isLoading: false, error: "Exception: $e");
      return false;
    }
  }

  Future<void> deleteRondaGroup(String id) async {
    state = state.copyWith(isLoading: true);
    try {
      final result = await _repository.delete(id);
      switch (result) {
        case Ok():
          await fetchListRondaGroup(reset: true);
          break;
        case Error():
          state = state.copyWith(
            isLoading: false,
            error: result.error.toString(),
          );
          break;
      }
    } catch (e) {
      state = state.copyWith(isLoading: false, error: "Exception: $e");
    }
  }
}



class RondaGroupListNotifier extends StateNotifier<AsyncValue<List<RondaGroupModel>>> {
  final RondaGroupRepository repository;
  final String rtId;

  int page = 1;
  bool hasMore = true;
  bool isLoading = false;

  RondaGroupListNotifier(this.repository, this.rtId, )
    : super(const AsyncValue.loading()) {
    loadInitialData();
  }

  Future<void> loadInitialData() async {
    state = const AsyncValue.loading();
    try {
      final houses = await repository.getListRondaGroup({
        "page": 1,
        "page_size": 10,
        "rt_id": rtId,
      });

      switch (houses) {
        case Ok<ApiResponse<List<RondaGroupModel>>>():
          if (houses.value.data == null) {
            state = AsyncValue.data([]);
            return;
          }
          hasMore = houses.value.data?.length == 10;
          state = AsyncValue.data(houses.value.data!);
          break;
        case Error<ApiResponse<List<RondaGroupModel>>>():
          state = AsyncValue.error(houses.error.toString(), StackTrace.empty);
          return;
      }
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> loadMore() async {
    if (!hasMore || isLoading) return;

    isLoading = true;
    try {
      final newRondaGroups = await repository.getListRondaGroup({
        "page": page + 1,
        "page_size": 10,
        "rt_id": rtId,
      });
      switch (newRondaGroups) {
        case Ok<ApiResponse<List<RondaGroupModel>>>():
          if (newRondaGroups.value.data == null) {
            hasMore = false;
            state = state.whenData((houses) => [...houses]);
            return;
          }
          hasMore = newRondaGroups.value.meta!.totalPages > page;
          if (hasMore) {
            page++;
          }

          state = state.whenData(
            (houses) => [...houses, ...newRondaGroups.value.data!],
          );
          break;
        case Error<ApiResponse<List<RondaGroupModel>>>():
          state = AsyncValue.error(
            newRondaGroups.error.toString(),
            StackTrace.empty,
          );
          return;
      }
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    } finally {
      isLoading = false;
    }
  }

  Future<void> refresh() async {
    page = 1;
    hasMore = true;
    await loadInitialData();
  }
}

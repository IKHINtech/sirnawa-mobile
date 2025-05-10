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

  const RondaGroupState({
    required this.isLoading,
    required this.error,
    required this.list,
  });

  RondaGroupState copyWith({
    bool? isLoading,
    String? error,
    List<RondaGroupModel>? list,
  }) {
    return RondaGroupState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      list: list ?? this.list,
    );
  }
}

class RondaGroupViewModel extends StateNotifier<RondaGroupState> {
  final RondaGroupRepository _repository;
  final String _rtId;
  RondaGroupViewModel({
    required RondaGroupRepository repository,
    required String rtId,
  }) : _repository = repository,
       _rtId = rtId,
       super(const RondaGroupState(isLoading: false, error: null, list: [])) {
    fetchListGroupOptions(rtId);
  }

  Future<void> fetchListGroupOptions(String rtId) async {
    try {
      state = state.copyWith(isLoading: true);

      final result = await _repository.getListRondaGroup({"paginated": false});

      switch (result) {
        case Ok<ApiResponse<List<RondaGroupModel>>>():
          state = RondaGroupState(
            isLoading: false,
            error: null,
            list: result.value.data ?? [],
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

  Future<bool> createRondaGroup(RondaGroupRequestModel rondaGroup) async {
    state = state.copyWith(isLoading: true);
    try {
      final result = await _repository.createRondaGroup(rondaGroup);
      switch (result) {
        case Ok():
          await fetchListGroupOptions(_rtId);
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
          await fetchListGroupOptions(_rtId);
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
          await fetchListGroupOptions(_rtId);
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

class RondaGroupListNotifier
    extends StateNotifier<AsyncValue<List<RondaGroupModel>>> {
  final RondaGroupRepository repository;
  final String rtId;

  int page = 1;
  bool hasMore = true;
  bool isLoading = false;

  RondaGroupListNotifier(this.repository, this.rtId)
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

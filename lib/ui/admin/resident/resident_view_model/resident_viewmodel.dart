import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sirnawa_mobile/data/repositories/resident/resident_repository.dart';
import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/data/services/api/model/resident/resident_request_model.dart';
import 'package:sirnawa_mobile/domain/model/resident/resident_model.dart';
import 'package:sirnawa_mobile/utils/result.dart';

class ResidentState {
  final bool isLoading;
  final String? error;
  final List<ResidentModel> list;

  const ResidentState({
    required this.isLoading,
    required this.error,
    required this.list,
  });

  ResidentState copyWith({
    bool? isLoading,
    String? error,
    List<ResidentModel>? list,
    bool? hasNextPage,
  }) {
    return ResidentState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      list: list ?? this.list,
    );
  }
}

class ResidentViewModel extends StateNotifier<ResidentState> {
  final ResidentRepository _repository;

  ResidentViewModel({required ResidentRepository repository})
    : _repository = repository,
      super(const ResidentState(isLoading: false, error: null, list: []));

  Future<void> fetchListResident({required String rtId, String? search}) async {
    try {
      state.copyWith(isLoading: true);

      final result = await _repository.getResidents({
        "paginated": false,
        "rt_id": rtId,
        "search": search,
      });

      switch (result) {
        case Ok<ApiResponse<List<ResidentModel>>>():
          state = ResidentState(
            isLoading: false,
            error: null,
            list: result.value.data ?? [],
          );
          break;
        case Error<ApiResponse<List<ResidentModel>>>():
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

  Future<bool> createResident(ResidentRequestModel resident) async {
    state = state.copyWith(isLoading: true);
    try {
      final result = await _repository.createResident(resident);
      switch (result) {
        case Ok():
          // Opsional: setelah create, refresh list
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

  Future<bool> updateResident(String id, ResidentRequestModel resident) async {
    state = state.copyWith(isLoading: true);
    try {
      final result = await _repository.updateResident(id, resident);
      switch (result) {
        case Ok():
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

  Future<void> deleteResident(String id) async {
    state = state.copyWith(isLoading: true);
    try {
      final result = await _repository.deleteResident(id);
      switch (result) {
        case Ok():
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

class ResidentListNotifier
    extends StateNotifier<AsyncValue<List<ResidentModel>>> {
  final ResidentRepository repository;
  final String rtId;

  int page = 1;
  bool hasMore = true;
  bool isLoading = false;

  ResidentListNotifier(this.repository, this.rtId)
    : super(const AsyncValue.loading()) {
    loadInitialData();
  }

  Future<void> loadInitialData() async {
    state = const AsyncValue.loading();
    try {
      final houses = await repository.getResidents({
        "page": 1,
        "page_size": 10,
        "rt_id": rtId,
      });

      switch (houses) {
        case Ok<ApiResponse<List<ResidentModel>>>():
          if (houses.value.data == null) {
            state = AsyncValue.data([]);
            return;
          }
          hasMore = houses.value.data?.length == 10;
          state = AsyncValue.data(houses.value.data!);
          break;
        case Error<ApiResponse<List<ResidentModel>>>():
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
      final newResidents = await repository.getResidents({
        "page": page + 1,
        "page_size": 10,
        "rt_id": rtId,
      });
      switch (newResidents) {
        case Ok<ApiResponse<List<ResidentModel>>>():
          if (newResidents.value.data == null) {
            hasMore = false;
            state = state.whenData((houses) => [...houses]);
            return;
          }
          hasMore = newResidents.value.meta!.totalPages > page;
          if (hasMore) {
            page++;
          }

          state = state.whenData(
            (houses) => [...houses, ...newResidents.value.data!],
          );
          break;
        case Error<ApiResponse<List<ResidentModel>>>():
          state = AsyncValue.error(
            newResidents.error.toString(),
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

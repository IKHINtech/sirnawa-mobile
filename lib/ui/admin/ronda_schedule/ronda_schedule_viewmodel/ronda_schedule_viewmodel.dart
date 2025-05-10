import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sirnawa_mobile/data/repositories/ronda_schedule/ronda_schedule_repository.dart';
import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/data/services/api/model/ronda_schedule/ronda_schedule_request_model.dart';
import 'package:sirnawa_mobile/domain/model/ronda_schedule/ronda_schedule_model.dart';
import 'package:sirnawa_mobile/utils/result.dart';

class RondaScheduleState {
  final bool isLoading;
  final String? error;
  final List<RondaScheduleModel> list;

  const RondaScheduleState({
    required this.isLoading,
    required this.error,
    required this.list,
  });

  RondaScheduleState copyWith({
    bool? isLoading,
    String? error,
    List<RondaScheduleModel>? list,
  }) {
    return RondaScheduleState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      list: list ?? this.list,
    );
  }
}

class RondaScheduleViewModel extends StateNotifier<RondaScheduleState> {
  final RondaScheduleRepository _repository;
  final String _rtId;
  RondaScheduleViewModel({
    required RondaScheduleRepository repository,
    required String rtId,
  }) : _repository = repository,
       _rtId = rtId,
       super(
         const RondaScheduleState(isLoading: false, error: null, list: []),
       ) {
    fetchListScheduleOptions(rtId);
  }

  Future<void> fetchListScheduleOptions(String rtId) async {
    try {
      state = state.copyWith(isLoading: true);

      final result = await _repository.getListRondaSchedule({
        "paginated": false,
      });

      switch (result) {
        case Ok<ApiResponse<List<RondaScheduleModel>>>():
          state = RondaScheduleState(
            isLoading: false,
            error: null,
            list: result.value.data ?? [],
          );
          break;
        case Error<ApiResponse<List<RondaScheduleModel>>>():
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

  Future<bool> createRondaSchedule(
    RondaScheduleRequestModel rondaSchedule,
  ) async {
    state = state.copyWith(isLoading: true);
    try {
      final result = await _repository.createRondaSchedule(rondaSchedule);
      switch (result) {
        case Ok():
          await fetchListScheduleOptions(_rtId);
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

  Future<bool> updateRondaSchedule(
    String id,
    RondaScheduleRequestModel rondaSchedule,
  ) async {
    state = state.copyWith(isLoading: true);
    try {
      final result = await _repository.updateRondaSchedule(id, rondaSchedule);
      switch (result) {
        case Ok():
          await fetchListScheduleOptions(_rtId);
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

  Future<void> deleteRondaSchedule(String id) async {
    state = state.copyWith(isLoading: true);
    try {
      final result = await _repository.delete(id);
      switch (result) {
        case Ok():
          await fetchListScheduleOptions(_rtId);
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

class RondaScheduleListNotifier
    extends StateNotifier<AsyncValue<List<RondaScheduleModel>>> {
  final RondaScheduleRepository repository;
  final String rtId;

  int page = 1;
  bool hasMore = true;
  bool isLoading = false;

  RondaScheduleListNotifier(this.repository, this.rtId)
    : super(const AsyncValue.loading()) {
    loadInitialData();
  }

  Future<void> loadInitialData() async {
    state = const AsyncValue.loading();
    try {
      final houses = await repository.getListRondaSchedule({
        "page": 1,
        "page_size": 10,
        "rt_id": rtId,
      });

      switch (houses) {
        case Ok<ApiResponse<List<RondaScheduleModel>>>():
          if (houses.value.data == null) {
            state = AsyncValue.data([]);
            return;
          }
          hasMore = houses.value.data?.length == 10;
          state = AsyncValue.data(houses.value.data!);
          break;
        case Error<ApiResponse<List<RondaScheduleModel>>>():
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
      final newRondaSchedules = await repository.getListRondaSchedule({
        "page": page + 1,
        "page_size": 10,
        "rt_id": rtId,
      });
      switch (newRondaSchedules) {
        case Ok<ApiResponse<List<RondaScheduleModel>>>():
          if (newRondaSchedules.value.data == null) {
            hasMore = false;
            state = state.whenData((houses) => [...houses]);
            return;
          }
          hasMore = newRondaSchedules.value.meta!.totalPages > page;
          if (hasMore) {
            page++;
          }

          state = state.whenData(
            (houses) => [...houses, ...newRondaSchedules.value.data!],
          );
          break;
        case Error<ApiResponse<List<RondaScheduleModel>>>():
          state = AsyncValue.error(
            newRondaSchedules.error.toString(),
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

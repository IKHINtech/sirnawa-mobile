import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sirnawa_mobile/data/repositories/house/house_repository.dart';
import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/data/services/api/model/house/house_request_model.dart';
import 'package:sirnawa_mobile/domain/model/house/house_model.dart';
import 'package:sirnawa_mobile/utils/result.dart';

class HouseState {
  final bool isLoading;
  final String? error;
  final List<HouseModel> list;

  const HouseState({
    required this.isLoading,
    required this.error,
    required this.list,
  });

  HouseState copyWith({
    bool? isLoading,
    String? error,
    List<HouseModel>? list,
    HouseModel? detail,
  }) {
    return HouseState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      list: list ?? this.list,
    );
  }
}

class HouseViewModel extends StateNotifier<HouseState> {
  final HouseRepository _repository;

  HouseViewModel({required HouseRepository repository, required String rtID})
    : _repository = repository,
      super(const HouseState(isLoading: false, error: null, list: [])) {
    getHouseListHouse(rtId: rtID);
  }

  Future<bool> createHouse({
    required String rtId,
    required String blockId,
    required HouseRequestModel resident,
  }) async {
    state = state.copyWith(isLoading: true);
    try {
      final result = await _repository.createHouse(resident);
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
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<bool> updateHouse({
    required String id,
    required String rtID,
    required String blockId,
    required HouseRequestModel resident,
  }) async {
    state = state.copyWith(isLoading: true);
    try {
      final result = await _repository.updateHouse(id, resident);
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
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> deleteHouse({
    required String id,
    required String blockId,
    required String rtId,
  }) async {
    state = state.copyWith(isLoading: true);
    try {
      final result = await _repository.delete(id);
      switch (result) {
        case Ok():
          state = state.copyWith(isLoading: false);
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

  Future<void> getHouseListHouse({required String rtId}) async {
    state = state.copyWith(isLoading: true);
    try {
      final result = await _repository.getListHouse({
        "paginated": false,
        'rt_id': rtId,
      });
      switch (result) {
        case Ok():
          state = state.copyWith(list: result.value.data ?? []);
          break;
        case Error():
          state = state.copyWith(error: result.error.toString());
          break;
      }
    } catch (e) {
      state = state.copyWith(error: "Exception: $e");
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  void clearDetail() {
    state = state.copyWith(detail: null);
  }
}

class HouseListNotifier extends StateNotifier<AsyncValue<List<HouseModel>>> {
  final HouseRepository repository;
  final String rtId;
  final String blockId;

  int page = 1;
  bool hasMore = true;
  bool isLoading = false;

  HouseListNotifier(this.repository, this.rtId, this.blockId)
    : super(const AsyncValue.loading()) {
    loadInitialData();
  }

  Future<void> loadInitialData() async {
    state = const AsyncValue.loading();
    try {
      final houses = await repository.getListHouse({
        "page": 1,
        "page_size": 10,
        "rt_id": rtId,
        "block_id": blockId,
      });

      switch (houses) {
        case Ok<ApiResponse<List<HouseModel>>>():
          if (houses.value.data == null) {
            state = AsyncValue.data([]);
            return;
          }
          hasMore = houses.value.data?.length == 10;
          state = AsyncValue.data(houses.value.data!);
          break;
        case Error<ApiResponse<List<HouseModel>>>():
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
      final newHouses = await repository.getListHouse({
        "page": page + 1,
        "page_size": 10,
        "rt_id": rtId,
        "block_id": blockId,
      });
      switch (newHouses) {
        case Ok<ApiResponse<List<HouseModel>>>():
          if (newHouses.value.data == null) {
            hasMore = false;
            state = state.whenData((houses) => [...houses]);
            return;
          }
          hasMore = newHouses.value.meta!.totalPages > page;
          if (hasMore) {
            page++;
          }

          state = state.whenData(
            (houses) => [...houses, ...newHouses.value.data!],
          );
          break;
        case Error<ApiResponse<List<HouseModel>>>():
          state = AsyncValue.error(
            newHouses.error.toString(),
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

class HouseListWithParamsNotifier
    extends StateNotifier<AsyncValue<List<HouseModel>>> {
  final HouseRepository repository;
  final String rtId;
  final Map<String, dynamic> params;
  HouseListWithParamsNotifier(this.repository, this.rtId, this.params)
    : super(const AsyncValue.loading()) {
    loadInitialData();
  }

  Future<void> loadInitialData() async {
    state = const AsyncValue.loading();
    try {
      final houses = await repository.getListHouse({
        "paginated": false,
        "rt_id": rtId,
        ...params,
      });

      switch (houses) {
        case Ok<ApiResponse<List<HouseModel>>>():
          if (houses.value.data == null) {
            state = AsyncValue.data([]);
            return;
          }
          state = AsyncValue.data(houses.value.data!);
          break;
        case Error<ApiResponse<List<HouseModel>>>():
          state = AsyncValue.error(houses.error.toString(), StackTrace.empty);
          return;
      }
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

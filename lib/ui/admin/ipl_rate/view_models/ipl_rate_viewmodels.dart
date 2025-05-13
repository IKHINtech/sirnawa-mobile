import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sirnawa_mobile/data/repositories/ipl_rate/ipl_rate_repository.dart';
import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/data/services/api/model/ipl_rate/ipl_rate_request_model.dart';
import 'package:sirnawa_mobile/domain/model/ipl_rate/ipl_rate_model.dart';
import 'package:sirnawa_mobile/utils/result.dart';

class IplRateState {
  final bool isLoading;
  final String? error;
  final List<IplRateModel> list;

  const IplRateState({
    required this.isLoading,
    required this.error,
    required this.list,
  });

  IplRateState copyWith({
    bool? isLoading,
    String? error,
    List<IplRateModel>? list,
  }) {
    return IplRateState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      list: list ?? this.list,
    );
  }
}

class IplRateViewModel extends StateNotifier<IplRateState> {
  final IplRateRepository _repository;

  IplRateViewModel({
    required IplRateRepository repository,
    required String rtID,
  }) : _repository = repository,
       super(const IplRateState(isLoading: false, error: null, list: [])) {
    getIplRateListIplRate(rtId: rtID);
  }

  Future<bool> createIplRate({required IplRateRequestModel payload}) async {
    state = state.copyWith(isLoading: true);
    try {
      final result = await _repository.createIplRate(payload);
      switch (result) {
        case Ok():
          state = state.copyWith(isLoading: false);
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

  Future<bool> updateIplRate({
    required String id,
    required IplRateRequestModel payload,
  }) async {
    state = state.copyWith(isLoading: true);
    try {
      final result = await _repository.updateIplRate(id, payload);
      switch (result) {
        case Ok():
          state = state.copyWith(isLoading: false);
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

  Future<void> deleteIplRate({required String id}) async {
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
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> getIplRateListIplRate({required String rtId}) async {
    state = state.copyWith(isLoading: true);
    try {
      final result = await _repository.getList({
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
}

class IplRateListNotifier
    extends StateNotifier<AsyncValue<List<IplRateModel>>> {
  final IplRateRepository repository;
  final String rtId;

  int page = 1;
  bool hasMore = true;
  bool isLoading = false;

  IplRateListNotifier(this.repository, this.rtId)
    : super(const AsyncValue.loading()) {
    loadInitialData();
  }

  Future<void> loadInitialData() async {
    state = const AsyncValue.loading();
    try {
      final items = await repository.getList({
        "page": 1,
        "page_size": 10,
        "rt_id": rtId,
      });

      switch (items) {
        case Ok<ApiResponse<List<IplRateModel>>>():
          if (items.value.data == null) {
            state = AsyncValue.data([]);
            return;
          }
          hasMore = items.value.data?.length == 10;
          state = AsyncValue.data(items.value.data!);
          break;
        case Error<ApiResponse<List<IplRateModel>>>():
          state = AsyncValue.error(items.error.toString(), StackTrace.empty);
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
      final newIplRates = await repository.getList({
        "page": page + 1,
        "page_size": 10,
        "rt_id": rtId,
      });
      switch (newIplRates) {
        case Ok<ApiResponse<List<IplRateModel>>>():
          if (newIplRates.value.data == null) {
            hasMore = false;
            state = state.whenData((items) => [...items]);
            return;
          }
          hasMore = newIplRates.value.meta!.totalPages > page;
          if (hasMore) {
            page++;
          }

          state = state.whenData(
            (items) => [...items, ...newIplRates.value.data!],
          );
          break;
        case Error<ApiResponse<List<IplRateModel>>>():
          state = AsyncValue.error(
            newIplRates.error.toString(),
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

class IplRateListNotInGroupNotifier
    extends StateNotifier<AsyncValue<List<IplRateModel>>> {
  final IplRateRepository repository;
  final String rtId;
  IplRateListNotInGroupNotifier(this.repository, this.rtId)
    : super(const AsyncValue.loading()) {
    loadInitialData();
  }

  Future<void> loadInitialData() async {
    state = const AsyncValue.loading();
    try {
      final items = await repository.getList({
        "paginated": false,
        "rt_id": rtId,
      });

      switch (items) {
        case Ok<ApiResponse<List<IplRateModel>>>():
          if (items.value.data == null) {
            state = AsyncValue.data([]);
            return;
          }
          state = AsyncValue.data(items.value.data!);
          break;
        case Error<ApiResponse<List<IplRateModel>>>():
          state = AsyncValue.error(items.error.toString(), StackTrace.empty);
          return;
      }
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

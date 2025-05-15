import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sirnawa_mobile/data/repositories/ipl_rate_detail/ipl_rate_detail_repository.dart';
import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/data/services/api/model/ipl_rate_detail/ipl_rate_detail_request_model.dart';
import 'package:sirnawa_mobile/domain/model/ipl_rate_detail/ipl_rate_detail_model.dart';
import 'package:sirnawa_mobile/utils/result.dart';

class IplRateDetailState {
  final bool isLoading;
  final String? error;
  final AsyncValue<List<IplRateDetailModel>> list;

  const IplRateDetailState({
    required this.isLoading,
    required this.error,
    required this.list,
  });

  IplRateDetailState copyWith({
    bool? isLoading,
    String? error,
    AsyncValue<List<IplRateDetailModel>>? list,
  }) {
    return IplRateDetailState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      list: list ?? this.list,
    );
  }
}

class IplRateDetailViewModel extends StateNotifier<IplRateDetailState> {
  final IplRateDetailRepository _repository;

  IplRateDetailViewModel({required IplRateDetailRepository repository})
    : _repository = repository,
      super(
        const IplRateDetailState(
          isLoading: false,
          error: null,
          list: AsyncValue.data([]),
        ),
      );

  Future<bool> createIplRateDetail({
    required IplRateDetailRequestModel payload,
  }) async {
    state = state.copyWith(isLoading: true);
    try {
      final result = await _repository.createIplRateDetail(payload);
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

  Future<bool> updateIplRateDetail({
    required String id,
    required IplRateDetailRequestModel payload,
  }) async {
    state = state.copyWith(isLoading: true);
    try {
      final result = await _repository.updateIplRateDetail(id, payload);
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

  Future<void> deleteIplRateDetail({required String id}) async {
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

  Future<void> getIplRateDetailListIplRateDetail({
    required String iplRateId,
  }) async {
    state = state.copyWith(list: AsyncValue.loading());
    try {
      final result = await _repository.getList({
        "paginated": false,
        'ipl_rate_id': iplRateId,
      });
      switch (result) {
        case Ok():
          state = state.copyWith(
            list: AsyncValue.data(result.value.data ?? []),
            error: null,
          );
          break;
        case Error():
          state = state.copyWith(
            error: result.error.toString(),
            list: AsyncValue.error(result.error.toString(), StackTrace.empty),
          );
          break;
      }
    } catch (e) {
      state = state.copyWith(
        error: "Exception: $e",
        list: AsyncValue.error(e.toString(), StackTrace.empty),
      );
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }
}

class IplRateDetailListNotifier
    extends StateNotifier<AsyncValue<List<IplRateDetailModel>>> {
  final IplRateDetailRepository repository;
  final String iplRateId;

  int page = 1;
  bool hasMore = true;
  bool isLoading = false;

  IplRateDetailListNotifier(this.repository, this.iplRateId)
    : super(const AsyncValue.loading()) {
    loadInitialData();
  }

  Future<void> loadInitialData() async {
    state = const AsyncValue.loading();
    try {
      final items = await repository.getList({
        "page": 1,
        "page_size": 10,
        "ipl_rate_id": iplRateId,
      });

      switch (items) {
        case Ok<ApiResponse<List<IplRateDetailModel>>>():
          if (items.value.data == null) {
            state = AsyncValue.data([]);
            return;
          }
          hasMore = items.value.data?.length == 10;
          state = AsyncValue.data(items.value.data!);
          break;
        case Error<ApiResponse<List<IplRateDetailModel>>>():
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
      final newIplRateDetails = await repository.getList({
        "page": page + 1,
        "page_size": 10,
        "rt_id": iplRateId,
      });
      switch (newIplRateDetails) {
        case Ok<ApiResponse<List<IplRateDetailModel>>>():
          if (newIplRateDetails.value.data == null) {
            hasMore = false;
            state = state.whenData((items) => [...items]);
            return;
          }
          hasMore = newIplRateDetails.value.meta!.totalPages > page;
          if (hasMore) {
            page++;
          }

          state = state.whenData(
            (items) => [...items, ...newIplRateDetails.value.data!],
          );
          break;
        case Error<ApiResponse<List<IplRateDetailModel>>>():
          state = AsyncValue.error(
            newIplRateDetails.error.toString(),
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

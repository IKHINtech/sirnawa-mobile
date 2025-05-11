import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sirnawa_mobile/data/repositories/block/block_repository.dart';
import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/data/services/api/model/block/block_request_model.dart';
import 'package:sirnawa_mobile/domain/model/block/block_model.dart';
import 'package:sirnawa_mobile/utils/result.dart';

class BlockState {
  final bool isLoading;
  final String? error;
  final List<BlockModel> list;
  final List<BlockModel> blockOptions;
  final bool hasNextPage;

  const BlockState({
    required this.isLoading,
    required this.error,
    required this.list,
    required this.blockOptions,
    required this.hasNextPage,
  });

  BlockState copyWith({
    bool? isLoading,
    String? error,
    List<BlockModel>? list,
    List<BlockModel>? blockOptions,
    bool? hasNextPage,
  }) {
    return BlockState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      list: list ?? this.list,
      blockOptions: blockOptions ?? this.blockOptions,
      hasNextPage: hasNextPage ?? this.hasNextPage,
    );
  }
}

class BlockViewModel extends StateNotifier<BlockState> {
  final BlockRepository _repository;
  int _currentPage = 1;
  final int _limit = 10;
  int _totalPages = 1;

  BlockViewModel({required BlockRepository repository})
    : _repository = repository,
      super(
        const BlockState(
          isLoading: false,
          error: null,
          blockOptions: [],
          list: [],
          hasNextPage: true,
        ),
      );

  Future<void> fetchBlockOptions({required String rtId}) async {
    try {
      final result = await _repository.getListBlock({
        "paginated": false,
        "rt_id": rtId,
      });

      switch (result) {
        case Ok<ApiResponse<List<BlockModel>>>():
          state = BlockState(
            isLoading: false,
            error: null,
            blockOptions: result.value.data ?? [],
            list: state.list,
            hasNextPage: state.hasNextPage,
          );
          break;
        case Error<ApiResponse<List<BlockModel>>>():
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

  Future<void> fetchListBlock({
    bool reset = false,
    required String rtId,
  }) async {
    try {
      state =
          reset
              ? const BlockState(
                isLoading: true,
                error: null,
                list: [],
                blockOptions: [],
                hasNextPage: true,
              )
              : state.copyWith(isLoading: true);

      if (reset) {
        _currentPage = 1;
        _totalPages = 1;
      }

      final result = await _repository.getListBlock({
        "page": _currentPage,
        "page_size": _limit,
        "rt_id": rtId,
      });

      switch (result) {
        case Ok<ApiResponse<List<BlockModel>>>():
          _currentPage++;
          _totalPages = result.value.meta?.totalPages ?? 1;
          state = BlockState(
            isLoading: false,
            error: null,
            blockOptions: [],
            list:
                reset
                    ? result.value.data ?? []
                    : [...state.list, ...?result.value.data],
            hasNextPage: _currentPage < _totalPages,
          );
          break;
        case Error<ApiResponse<List<BlockModel>>>():
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

  Future<void> loadMore({required String rtId}) async {
    if (!(_currentPage < _totalPages) || state.isLoading) return;
    await fetchListBlock(rtId: rtId);
  }

  Future<bool> createBlock({
    required BlockRequestModel resident,
    required String rtId,
  }) async {
    state = state.copyWith(isLoading: true);
    try {
      final result = await _repository.createBlock(resident);
      switch (result) {
        case Ok():
          // Opsional: setelah create, refresh list
          await fetchListBlock(reset: true, rtId: rtId);
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

  Future<bool> updateBlock({
    required String rtId,
    required String id,
    required BlockRequestModel resident,
  }) async {
    state = state.copyWith(isLoading: true);
    try {
      final result = await _repository.updateBlock(id, resident);
      switch (result) {
        case Ok():
          await fetchListBlock(reset: true, rtId: rtId);
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

  Future<void> deleteBlock(String id, {required String rtId}) async {
    state = state.copyWith(isLoading: true);
    try {
      final result = await _repository.delete(id);
      switch (result) {
        case Ok():
          await fetchListBlock(reset: true, rtId: rtId);
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

class BlockListNotifier extends StateNotifier<AsyncValue<List<BlockModel>>> {
  final BlockRepository repository;
  final String rtId;

  int page = 1;
  bool hasMore = true;
  bool isLoading = false;

  BlockListNotifier(this.repository, this.rtId)
    : super(const AsyncValue.loading()) {
    loadInitialData();
  }

  Future<void> loadInitialData() async {
    state = const AsyncValue.loading();
    try {
      final houses = await repository.getListBlock({
        "page": 1,
        "page_size": 10,
        "rt_id": rtId,
      });

      switch (houses) {
        case Ok<ApiResponse<List<BlockModel>>>():
          if (houses.value.data == null) {
            state = AsyncValue.data([]);
            return;
          }
          hasMore = houses.value.data?.length == 10;
          state = AsyncValue.data(houses.value.data!);
          break;
        case Error<ApiResponse<List<BlockModel>>>():
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
      final newBlocks = await repository.getListBlock({
        "page": page + 1,
        "page_size": 10,
        "rt_id": rtId,
      });
      switch (newBlocks) {
        case Ok<ApiResponse<List<BlockModel>>>():
          if (newBlocks.value.data == null) {
            hasMore = false;
            state = state.whenData((houses) => [...houses]);
            return;
          }
          hasMore = newBlocks.value.meta!.totalPages > page;
          if (hasMore) {
            page++;
          }

          state = state.whenData(
            (houses) => [...houses, ...newBlocks.value.data!],
          );
          break;
        case Error<ApiResponse<List<BlockModel>>>():
          state = AsyncValue.error(
            newBlocks.error.toString(),
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

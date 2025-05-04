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
  final bool hasNextPage;

  const BlockState({
    required this.isLoading,
    required this.error,
    required this.list,
    required this.hasNextPage,
  });

  BlockState copyWith({
    bool? isLoading,
    String? error,
    List<BlockModel>? list,
    bool? hasNextPage,
  }) {
    return BlockState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      list: list ?? this.list,
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
          list: [],
          hasNextPage: true,
        ),
      );

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

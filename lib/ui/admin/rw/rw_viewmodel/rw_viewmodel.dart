import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sirnawa_mobile/data/repositories/rw/rw_repository.dart';
import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/data/services/api/model/rw/rw_request_model.dart';
import 'package:sirnawa_mobile/domain/model/rw/rw_model.dart';
import 'package:sirnawa_mobile/utils/result.dart';

class RwState {
  final bool isLoading;
  final String? error;
  final List<RwModel> list;
  final bool hasNextPage;

  const RwState({
    required this.isLoading,
    required this.error,
    required this.list,
    required this.hasNextPage,
  });

  RwState copyWith({
    bool? isLoading,
    String? error,
    List<RwModel>? list,
    bool? hasNextPage,
  }) {
    return RwState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      list: list ?? this.list,
      hasNextPage: hasNextPage ?? this.hasNextPage,
    );
  }
}

class RwViewModel extends StateNotifier<RwState> {
  final RwRepository _repository;
  int _currentPage = 1;
  final int _limit = 10;
  int _totalPages = 1;

  RwViewModel({required RwRepository repository})
    : _repository = repository,
      super(
        const RwState(
          isLoading: false,
          error: null,
          list: [],
          hasNextPage: true,
        ),
      );

  Future<void> fetchListRw({bool reset = false}) async {
    try {
      state =
          reset
              ? const RwState(
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

      final result = await _repository.getListRw({
        "page": _currentPage,
        "page_size": _limit,
      });

      switch (result) {
        case Ok<ApiResponse<List<RwModel>>>():
          _currentPage++;
          _totalPages = result.value.meta?.totalPages ?? 1;
          state = RwState(
            isLoading: false,
            error: null,
            list:
                reset
                    ? result.value.data ?? []
                    : [...state.list, ...?result.value.data],
            hasNextPage: _currentPage < _totalPages,
          );
          break;
        case Error<ApiResponse<List<RwModel>>>():
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
    await fetchListRw();
  }

  Future<bool> createRw(RwRequestModel resident) async {
    state = state.copyWith(isLoading: true);
    try {
      final result = await _repository.createRw(resident);
      switch (result) {
        case Ok():
          // Opsional: setelah create, refresh list
          await fetchListRw(reset: true);
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

  Future<bool> updateRw(String id, RwRequestModel resident) async {
    state = state.copyWith(isLoading: true);
    try {
      final result = await _repository.updateRw(id, resident);
      switch (result) {
        case Ok():
          await fetchListRw(reset: true);
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

  Future<void> deleteRw(String id) async {
    state = state.copyWith(isLoading: true);
    try {
      final result = await _repository.delete(id);
      switch (result) {
        case Ok():
          await fetchListRw(reset: true);
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

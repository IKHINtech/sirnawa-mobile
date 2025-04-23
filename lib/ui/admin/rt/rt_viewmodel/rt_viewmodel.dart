import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sirnawa_mobile/data/repositories/rt/rt_repository.dart';
import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/domain/model/rt/rt_model.dart';
import 'package:sirnawa_mobile/utils/result.dart';

class RtState {
  final bool isLoading;
  final String? error;
  final List<RtModel> list;
  final bool hasNextPage;

  const RtState({
    required this.isLoading,
    required this.error,
    required this.list,
    required this.hasNextPage,
  });

  RtState copyWith({
    bool? isLoading,
    String? error,
    List<RtModel>? list,
    bool? hasNextPage,
  }) {
    return RtState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      list: list ?? this.list,
      hasNextPage: hasNextPage ?? this.hasNextPage,
    );
  }
}

class RtViewModel extends StateNotifier<RtState> {
  final RtRepository _repository;
  int _currentPage = 1;
  final int _limit = 10;
  int _totalPages = 1;

  RtViewModel({required RtRepository repository})
    : _repository = repository,
      super(
        const RtState(
          isLoading: false,
          error: null,
          list: [],
          hasNextPage: true,
        ),
      );

  Future<void> fetchListRt({bool reset = false}) async {
    if (state.isLoading) return;

    try {
      state =
          reset
              ? const RtState(
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

      final result = await _repository.getListRt({
        "page": _currentPage,
        "page_size": _limit,
      });

      switch (result) {
        case Ok<ApiResponse<List<RtModel>>>():
          _currentPage++;
          _totalPages = result.value.meta?.totalPages ?? 1;
          state = RtState(
            isLoading: false,
            error: null,
            list:
                reset
                    ? result.value.data ?? []
                    : [...state.list, ...?result.value.data],
            hasNextPage: _currentPage < _totalPages,
          );
          break;
        case Error<ApiResponse<List<RtModel>>>():
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
    await fetchListRt();
  }
}

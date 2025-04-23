import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sirnawa_mobile/data/repositories/resident/resident_repository.dart';
import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/domain/model/resident/resident_model.dart';
import 'package:sirnawa_mobile/utils/result.dart';

class ResidentState {
  final bool isLoading;
  final String? error;
  final List<ResidentModel> list;
  final bool hasNextPage;

  const ResidentState({
    required this.isLoading,
    required this.error,
    required this.list,
    required this.hasNextPage,
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
      hasNextPage: hasNextPage ?? this.hasNextPage,
    );
  }
}

class ResidentViewModel extends StateNotifier<ResidentState> {
  final ResidentRepository _repository;
  int _currentPage = 1;
  final int _limit = 10;
  int _totalPages = 1;

  ResidentViewModel({required ResidentRepository repository})
    : _repository = repository,
      super(
        const ResidentState(
          isLoading: false,
          error: null,
          list: [],
          hasNextPage: true,
        ),
      );

  Future<void> fetchListResident({bool reset = false}) async {
    if (state.isLoading) return;

    try {
      state =
          reset
              ? const ResidentState(
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

      final result = await _repository.getListResident({
        "page": _currentPage,
        "page_size": _limit,
      });

      switch (result) {
        case Ok<ApiResponse<List<ResidentModel>>>():
          _currentPage++;
          _totalPages = result.value.meta?.totalPages ?? 1;
          state = ResidentState(
            isLoading: false,
            error: null,
            list:
                reset
                    ? result.value.data ?? []
                    : [...state.list, ...?result.value.data],
            hasNextPage: _currentPage < _totalPages,
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

  Future<void> loadMore() async {
    if (!(_currentPage < _totalPages) || state.isLoading) return;
    await fetchListResident();
  }
}

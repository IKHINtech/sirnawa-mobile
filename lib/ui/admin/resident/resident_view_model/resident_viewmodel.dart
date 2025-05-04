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

      final result = await _repository.getResidents({
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

  Future<bool> createResident(ResidentRequestModel resident) async {
    state = state.copyWith(isLoading: true);
    try {
      final result = await _repository.createResident(resident);
      switch (result) {
        case Ok():
          // Opsional: setelah create, refresh list
          await fetchListResident(reset: true);
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
          await fetchListResident(reset: true);
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
          await fetchListResident(reset: true);
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

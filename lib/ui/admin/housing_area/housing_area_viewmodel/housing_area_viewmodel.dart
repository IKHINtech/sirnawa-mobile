import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sirnawa_mobile/data/repositories/housing_area/housing_area_repository.dart';
import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/data/services/api/model/housing_area/housing_area_request_model.dart';
import 'package:sirnawa_mobile/domain/model/housing_area/housing_area_model.dart';
import 'package:sirnawa_mobile/ui/admin/block/block_view_model/block_viewmodel.dart';
import 'package:sirnawa_mobile/utils/result.dart';

class HousingAreaState {
  final bool isLoading;
  final String? error;
  final List<HousingAreaModel> list;
  final bool hasNextPage;

  const HousingAreaState({
    required this.isLoading,
    required this.error,
    required this.list,
    required this.hasNextPage,
  });

  HousingAreaState copyWith({
    bool? isLoading,
    String? error,
    List<HousingAreaModel>? list,
    bool? hasNextPage,
  }) {
    return HousingAreaState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      list: list ?? this.list,
      hasNextPage: hasNextPage ?? this.hasNextPage,
    );
  }
}

class HousingAreaViewModel extends StateNotifier<HousingAreaState> {
  final HousingAreaRepository _repository;
  int _currentPage = 1;
  final int _limit = 10;
  int _totalPages = 1;

  HousingAreaViewModel({required HousingAreaRepository repository})
    : _repository = repository,
      super(
        const HousingAreaState(
          isLoading: false,
          error: null,
          list: [],
          hasNextPage: true,
        ),
      );

  Future<void> fetchListHousingArea({bool reset = false}) async {
    try {
      state =
          reset
              ? const HousingAreaState(
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

      final result = await _repository.getListHouseArea({
        "page": _currentPage,
        "page_size": _limit,
      });

      switch (result) {
        case Ok<ApiResponse<List<HousingAreaModel>>>():
          _currentPage++;
          _totalPages = result.value.meta?.totalPages ?? 1;
          state = HousingAreaState(
            isLoading: false,
            error: null,
            list:
                reset
                    ? result.value.data ?? []
                    : [...state.list, ...?result.value.data],
            hasNextPage: _currentPage < _totalPages,
          );
          break;
        case Error<ApiResponse<List<HousingAreaModel>>>():
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
    await fetchListHousingArea();
  }

  Future<bool> createHousingArea(HousingAreaRequestModel resident) async {
    state = state.copyWith(isLoading: true);
    try {
      final result = await _repository.createHouseArea(resident);
      switch (result) {
        case Ok():
          // Opsional: setelah create, refresh list
          await fetchListHousingArea(reset: true);
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

  Future<bool> updateHousingArea(
    String id,
    HousingAreaRequestModel resident,
  ) async {
    state = state.copyWith(isLoading: true);
    try {
      final result = await _repository.updateHouseArea(id, resident);
      switch (result) {
        case Ok():
          await fetchListHousingArea(reset: true);
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

  Future<void> deleteHousingArea(String id) async {
    state = state.copyWith(isLoading: true);
    try {
      final result = await _repository.delete(id);
      switch (result) {
        case Ok():
          await fetchListHousingArea(reset: true);
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

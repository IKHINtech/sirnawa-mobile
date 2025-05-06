import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sirnawa_mobile/data/repositories/resident_house/resident_house_repository.dart';
import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/data/services/api/model/resident_house_request/resident_house_request_model.dart';
import 'package:sirnawa_mobile/domain/model/resident_house/resident_house_model.dart';
import 'package:sirnawa_mobile/utils/result.dart';

class ResidentHouseState {
  final bool isLoading;
  final String? error;
  final List<ResidentHouseModel> list;
  final List<ResidentHouseModel> listPenghuni;
  final bool hasNextPage;

  const ResidentHouseState({
    required this.isLoading,
    required this.error,
    required this.list,
    required this.listPenghuni,
    required this.hasNextPage,
  });

  ResidentHouseState copyWith({
    bool? isLoading,
    String? error,
    List<ResidentHouseModel>? list,
    List<ResidentHouseModel>? listPenghuni,
    bool? hasNextPage,
  }) {
    return ResidentHouseState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      list: list ?? this.list,
      listPenghuni: listPenghuni ?? this.listPenghuni,
      hasNextPage: hasNextPage ?? this.hasNextPage,
    );
  }
}

class ResidentHouseViewModel extends StateNotifier<ResidentHouseState> {
  final ResidentHouseRepository _repository;

  ResidentHouseViewModel({required ResidentHouseRepository repository})
    : _repository = repository,
      super(
        const ResidentHouseState(
          isLoading: false,
          error: null,
          listPenghuni: [],
          list: [],
          hasNextPage: true,
        ),
      );

  Future<void> fetchPenghuni({required String houseID}) async {
    try {
      final result = await _repository.getListResidentHouseByHouseID(
        houseID: houseID,
      );

      switch (result) {
        case Ok<ApiResponse<List<ResidentHouseModel>>>():
          state = ResidentHouseState(
            isLoading: false,
            error: null,
            listPenghuni: result.value.data ?? [],
            list: state.list,
            hasNextPage: state.hasNextPage,
          );
          break;
        case Error<ApiResponse<List<ResidentHouseModel>>>():
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

  Future<bool> createResidentHouse({
    required ResidentHouseRequestModel resident,
    required String rtId,
  }) async {
    state = state.copyWith(isLoading: true);
    try {
      final result = await _repository.createResidentHouse(resident);
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
    }
  }

  Future<bool> changeToPrimary({required String id}) async {
    state = state.copyWith(isLoading: true);
    try {
      final result = await _repository.changeToPrimary(id);
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
    }
  }

  Future<void> deleteResidentHouse(String id, {required String rtId}) async {
    state = state.copyWith(isLoading: true);
    try {
      final result = await _repository.delete(id);
      switch (result) {
        case Ok():
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

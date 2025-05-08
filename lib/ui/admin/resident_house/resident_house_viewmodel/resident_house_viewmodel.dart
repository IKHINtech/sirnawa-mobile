import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sirnawa_mobile/data/repositories/resident_house/resident_house_repository.dart';
import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/data/services/api/model/resident_house_request/resident_house_request_model.dart';
import 'package:sirnawa_mobile/domain/model/resident_house/resident_house_model.dart';
import 'package:sirnawa_mobile/utils/result.dart';

class ResidentHouseState {
  final bool isLoading;
  final bool? isSuccess;
  final String? error;
  final List<ResidentHouseModel> list;
  final List<ResidentHouseModel> listPenghuni;

  const ResidentHouseState({
    required this.isLoading,
    this.isSuccess,
    required this.error,
    required this.list,
    required this.listPenghuni,
  });

  ResidentHouseState copyWith({
    bool? isLoading,
    bool? isSuccess,
    String? error,
    List<ResidentHouseModel>? list,
    List<ResidentHouseModel>? listPenghuni,
  }) {
    return ResidentHouseState(
      isSuccess: isLoading ?? this.isSuccess,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      list: list ?? this.list,
      listPenghuni: listPenghuni ?? this.listPenghuni,
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
          isSuccess: null,
          listPenghuni: [],
          list: [],
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

  void resetError() {
    state = state.copyWith(error: null);
  }

  void resetSuccess() {
    state = state.copyWith(isSuccess: null);
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
          state = state.copyWith(isLoading: false, isSuccess: true);
          return true;
        case Error():
          state = state.copyWith(
            isLoading: false,
            isSuccess: false,
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
          state = state.copyWith(isLoading: false, isSuccess: true);
          return true;
        case Error():
          state = state.copyWith(
            isLoading: false,
            isSuccess: false,
            error: result.error.toString(),
          );
          return false;
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        isSuccess: null,
        error: "Exception: $e",
      );
      return false;
    }
  }

  Future<bool> deleteResidentHouse(String id) async {
    state = state.copyWith(isLoading: true, isSuccess: false);
    try {
      final result = await _repository.delete(id);
      switch (result) {
        case Ok():
          state = state.copyWith(isLoading: false, isSuccess: true);
          return true;
        case Error():
          state = state.copyWith(
            isLoading: false,
            isSuccess: false,
            error: result.error.toString(),
          );
          return false;
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        isSuccess: null,
        error: "Exception: $e",
      );
      return false;
    }
  }
}

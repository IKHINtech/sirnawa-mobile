import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sirnawa_mobile/data/repositories/ronda_group_member/ronda_group_member_repository.dart';
import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/data/services/api/model/ronda_group_member/ronda_group_member_request_model.dart';
import 'package:sirnawa_mobile/domain/model/ronda_group_member/ronda_group_member_model.dart';
import 'package:sirnawa_mobile/utils/result.dart';

class RondaGroupMemberState {
  final bool isLoading;
  final String? error;
  final List<RondaGroupMemberModel> list;

  const RondaGroupMemberState({
    required this.isLoading,
    required this.error,
    required this.list,
  });

  RondaGroupMemberState copyWith({
    bool? isLoading,
    String? error,
    List<RondaGroupMemberModel>? list,
  }) {
    return RondaGroupMemberState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      list: list ?? this.list,
    );
  }
}

class RondaGroupMemberViewModel extends StateNotifier<RondaGroupMemberState> {
  final RondaGroupMemberRepository _repository;
  final String _groupID;
  RondaGroupMemberViewModel({
    required RondaGroupMemberRepository repository,
    required String gropuID,
  }) : _repository = repository,
       _groupID = gropuID,
       super(
         const RondaGroupMemberState(isLoading: false, error: null, list: []),
       );

  //      {
  //   fetchListGroupMemberOptions(gropuID);
  // }

  Future<void> fetchListGroupMemberOptions(String groupID) async {
    try {
      state = state.copyWith(isLoading: true);

      final result = await _repository.getListRondaGroupMember({
        "paginated": false,
      });

      switch (result) {
        case Ok<ApiResponse<List<RondaGroupMemberModel>>>():
          state = RondaGroupMemberState(
            isLoading: false,
            error: null,
            list: result.value.data ?? [],
          );
          break;
        case Error<ApiResponse<List<RondaGroupMemberModel>>>():
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

  Future<bool> createRondaGroupMember(
    RondaGroupMemberRequestModel rondaGroupMember,
  ) async {
    state = state.copyWith(isLoading: true);
    try {
      final result = await _repository.createRondaGroupMember(rondaGroupMember);
      switch (result) {
        case Ok():
          // await fetchListGroupMemberOptions(_groupID);
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

  Future<bool> updateRondaGroupMember(
    String id,
    RondaGroupMemberRequestModel rondaGroupMember,
  ) async {
    state = state.copyWith(isLoading: true);
    try {
      final result = await _repository.updateRondaGroupMember(
        id,
        rondaGroupMember,
      );
      switch (result) {
        case Ok():
          // await fetchListGroupMemberOptions(_groupID);
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

  Future<void> deleteRondaGroupMember(String id) async {
    state = state.copyWith(isLoading: true);
    try {
      final result = await _repository.delete(id);
      switch (result) {
        case Ok():
          // await fetchListGroupMemberOptions(_groupID);
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

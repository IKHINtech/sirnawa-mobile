import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sirnawa_mobile/data/repositories/ipl_bill/ipl_bill_repository.dart';
import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/data/services/api/model/ipl_bill/ipl_bill_request_model.dart';
import 'package:sirnawa_mobile/data/services/api/model/ipl_bill_generate_request_model/ipl_bill_generate_request_model.dart';
import 'package:sirnawa_mobile/domain/model/ipl_bill/ipl_bill_model.dart';
import 'package:sirnawa_mobile/utils/result.dart';

class IplBillState {
  final bool isLoading;
  final String? error;
  final List<IplBillModel> list;

  const IplBillState({
    required this.isLoading,
    required this.error,
    required this.list,
  });

  IplBillState copyWith({
    bool? isLoading,
    String? error,
    List<IplBillModel>? list,
  }) {
    return IplBillState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      list: list ?? this.list,
    );
  }
}

class IplBillViewModel extends StateNotifier<IplBillState> {
  final IplBillRepository _repository;

  IplBillViewModel({
    required IplBillRepository repository,
    required String rtID,
  }) : _repository = repository,
       super(const IplBillState(isLoading: false, error: null, list: [])) {
    getIplBillListIplBill(rtId: rtID);
  }

  Future<bool> generateIplBill({
    required IplBillGenerateRequestModel payload,
  }) async {
    state = state.copyWith(isLoading: true);
    try {
      final result = await _repository.generate(payload);
      switch (result) {
        case Ok():
          state = state.copyWith(isLoading: false);
          // Opsional: setelah create, refresh list
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
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<bool> createIplBill({required IplBillRequestModel payload}) async {
    state = state.copyWith(isLoading: true);
    try {
      final result = await _repository.createIplBill(payload);
      switch (result) {
        case Ok():
          state = state.copyWith(isLoading: false);
          // Opsional: setelah create, refresh list
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
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<bool> updateIplBill({
    required String id,
    required IplBillRequestModel payload,
  }) async {
    state = state.copyWith(isLoading: true);
    try {
      final result = await _repository.updateIplBill(id, payload);
      switch (result) {
        case Ok():
          state = state.copyWith(isLoading: false);
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
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> deleteIplBill({required String id}) async {
    state = state.copyWith(isLoading: true);
    try {
      final result = await _repository.delete(id);
      switch (result) {
        case Ok():
          state = state.copyWith(isLoading: false);
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
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> getIplBillListIplBill({required String rtId}) async {
    state = state.copyWith(isLoading: true);
    try {
      final result = await _repository.getList({
        "paginated": false,
        'rt_id': rtId,
      });
      switch (result) {
        case Ok():
          state = state.copyWith(list: result.value.data ?? []);
          break;
        case Error():
          state = state.copyWith(error: result.error.toString());
          break;
      }
    } catch (e) {
      state = state.copyWith(error: "Exception: $e");
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }
}

class IplBillListNotifier
    extends StateNotifier<AsyncValue<List<IplBillModel>>> {
  final IplBillRepository repository;
  final String rtId;

  int page = 1;
  bool hasMore = true;
  bool isLoading = false;

  IplBillListNotifier(this.repository, this.rtId)
    : super(const AsyncValue.loading()) {
    loadInitialData();
  }

  Future<void> loadInitialData() async {
    state = const AsyncValue.loading();
    try {
      final items = await repository.getList({
        "page": 1,
        "page_size": 10,
        "rt_id": rtId,
      });

      switch (items) {
        case Ok<ApiResponse<List<IplBillModel>>>():
          if (items.value.data == null) {
            state = AsyncValue.data([]);
            return;
          }
          hasMore = items.value.data?.length == 10;
          state = AsyncValue.data(items.value.data!);
          break;
        case Error<ApiResponse<List<IplBillModel>>>():
          state = AsyncValue.error(items.error.toString(), StackTrace.empty);
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
      final newIplBills = await repository.getList({
        "page": page + 1,
        "page_size": 10,
        "rt_id": rtId,
      });
      switch (newIplBills) {
        case Ok<ApiResponse<List<IplBillModel>>>():
          if (newIplBills.value.data == null) {
            hasMore = false;
            state = state.whenData((items) => [...items]);
            return;
          }
          hasMore = newIplBills.value.meta!.totalPages > page;
          if (hasMore) {
            page++;
          }

          state = state.whenData(
            (items) => [...items, ...newIplBills.value.data!],
          );
          break;
        case Error<ApiResponse<List<IplBillModel>>>():
          state = AsyncValue.error(
            newIplBills.error.toString(),
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

class IplBillListNotInGroupNotifier
    extends StateNotifier<AsyncValue<List<IplBillModel>>> {
  final IplBillRepository repository;
  final String rtId;
  IplBillListNotInGroupNotifier(this.repository, this.rtId)
    : super(const AsyncValue.loading()) {
    loadInitialData();
  }

  Future<void> loadInitialData() async {
    state = const AsyncValue.loading();
    try {
      final items = await repository.getList({
        "paginated": false,
        "rt_id": rtId,
      });

      switch (items) {
        case Ok<ApiResponse<List<IplBillModel>>>():
          if (items.value.data == null) {
            state = AsyncValue.data([]);
            return;
          }
          state = AsyncValue.data(items.value.data!);
          break;
        case Error<ApiResponse<List<IplBillModel>>>():
          state = AsyncValue.error(items.error.toString(), StackTrace.empty);
          return;
      }
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

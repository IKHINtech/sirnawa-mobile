import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sirnawa_mobile/data/repositories/item/item_repository.dart';
import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/data/services/api/model/item/item_request_model.dart';
import 'package:sirnawa_mobile/domain/model/item/item_model.dart';
import 'package:sirnawa_mobile/utils/result.dart';

class ItemState {
  final bool isLoading;
  final String? error;
  final List<ItemModel> list;

  const ItemState({
    required this.isLoading,
    required this.error,
    required this.list,
  });

  ItemState copyWith({bool? isLoading, String? error, List<ItemModel>? list}) {
    return ItemState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      list: list ?? this.list,
    );
  }
}

class ItemViewModel extends StateNotifier<ItemState> {
  final ItemRepository _repository;

  ItemViewModel({required ItemRepository repository, required String rtID})
    : _repository = repository,
      super(const ItemState(isLoading: false, error: null, list: [])) {
    getItemListItem(rtId: rtID);
  }

  Future<bool> createItem({required ItemRequestModel resident}) async {
    state = state.copyWith(isLoading: true);
    try {
      final result = await _repository.createItem(resident);
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

  Future<bool> updateItem({
    required String id,
    required ItemRequestModel resident,
  }) async {
    state = state.copyWith(isLoading: true);
    try {
      final result = await _repository.updateItem(id, resident);
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

  Future<void> deleteItem({required String id, required String rtId}) async {
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
    }
  }

  Future<void> getItemListItem({required String rtId}) async {
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

class ItemListNotifier extends StateNotifier<AsyncValue<List<ItemModel>>> {
  final ItemRepository repository;
  final String rtId;

  int page = 1;
  bool hasMore = true;
  bool isLoading = false;

  ItemListNotifier(this.repository, this.rtId)
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
        case Ok<ApiResponse<List<ItemModel>>>():
          if (items.value.data == null) {
            state = AsyncValue.data([]);
            return;
          }
          hasMore = items.value.data?.length == 10;
          state = AsyncValue.data(items.value.data!);
          break;
        case Error<ApiResponse<List<ItemModel>>>():
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
      final newItems = await repository.getList({
        "page": page + 1,
        "page_size": 10,
        "rt_id": rtId,
      });
      switch (newItems) {
        case Ok<ApiResponse<List<ItemModel>>>():
          if (newItems.value.data == null) {
            hasMore = false;
            state = state.whenData((items) => [...items]);
            return;
          }
          hasMore = newItems.value.meta!.totalPages > page;
          if (hasMore) {
            page++;
          }

          state = state.whenData(
            (items) => [...items, ...newItems.value.data!],
          );
          break;
        case Error<ApiResponse<List<ItemModel>>>():
          state = AsyncValue.error(newItems.error.toString(), StackTrace.empty);
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

class ItemListNotInGroupNotifier
    extends StateNotifier<AsyncValue<List<ItemModel>>> {
  final ItemRepository repository;
  final String rtId;
  ItemListNotInGroupNotifier(this.repository, this.rtId)
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
        case Ok<ApiResponse<List<ItemModel>>>():
          if (items.value.data == null) {
            state = AsyncValue.data([]);
            return;
          }
          state = AsyncValue.data(items.value.data!);
          break;
        case Error<ApiResponse<List<ItemModel>>>():
          state = AsyncValue.error(items.error.toString(), StackTrace.empty);
          return;
      }
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

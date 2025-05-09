import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sirnawa_mobile/data/repositories/announcement/announcement_repository.dart';
import 'package:sirnawa_mobile/data/services/api/model/announcement/announcement_request_model.dart';
import 'package:sirnawa_mobile/data/services/api/model/api_response/api_response.dart';
import 'package:sirnawa_mobile/domain/model/announcement/announcement_model.dart';
import 'package:sirnawa_mobile/utils/result.dart';

class AnnouncementState {
  final bool isLoading;
  final String? error;
  final List<AnnouncementModel> list;

  const AnnouncementState({
    required this.isLoading,
    required this.error,
    required this.list,
  });

  AnnouncementState copyWith({
    bool? isLoading,
    String? error,
    List<AnnouncementModel>? list,
  }) {
    return AnnouncementState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      list: list ?? this.list,
    );
  }
}

class AnnouncementViewModel extends StateNotifier<AnnouncementState> {
  final AnnouncementRepository _repository;

  AnnouncementViewModel({required AnnouncementRepository repository})
    : _repository = repository,
      super(const AnnouncementState(isLoading: false, error: null, list: []));

  Future<void> fetchListAnnouncement() async {
    try {
      state.copyWith(isLoading: true);

      final result = await _repository.getListAnnouncement({
        "paginated": false,
      });

      switch (result) {
        case Ok<ApiResponse<List<AnnouncementModel>>>():
          state = AnnouncementState(
            isLoading: false,
            error: null,
            list: result.value.data ?? [],
          );
          break;
        case Error<ApiResponse<List<AnnouncementModel>>>():
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

  Future<bool> createAnnouncement(
    AnnouncementRequestModel resident,
    List<File> attachments,
  ) async {
    state = state.copyWith(isLoading: true);
    try {
      final result = await _repository.createAnnouncement(
        resident,
        attachments,
      );
      switch (result) {
        case Ok():
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
    }
  }

  Future<bool> updateAnnouncement(
    String id,
    AnnouncementRequestModel resident,
  ) async {
    state = state.copyWith(isLoading: true);
    try {
      final result = await _repository.updateAnnouncement(id, resident);
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

  Future<bool> deleteAnnouncement(String id) async {
    state = state.copyWith(isLoading: true);
    try {
      final result = await _repository.delete(id);
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
}

class AnnouncementListNotifier
    extends StateNotifier<AsyncValue<List<AnnouncementModel>>> {
  final AnnouncementRepository repository;
  final String rtId;

  int page = 1;
  bool hasMore = true;
  bool isLoading = false;

  AnnouncementListNotifier(this.repository, this.rtId)
    : super(const AsyncValue.loading()) {
    loadInitialData();
  }

  Future<void> loadInitialData() async {
    state = const AsyncValue.loading();
    try {
      final announcement = await repository.getListAnnouncement({
        "page": 1,
        "page_size": 10,
        "rt_id": rtId,
      });

      if(!mounted)return;

      switch (announcement) {
        case Ok<ApiResponse<List<AnnouncementModel>>>():
          if (announcement.value.data == null) {
            state = AsyncValue.data([]);
            return;
          }
          hasMore = announcement.value.data?.length == 10;
          state = AsyncValue.data(announcement.value.data!);
          break;
        case Error<ApiResponse<List<AnnouncementModel>>>():
          state = AsyncValue.error(announcement.error.toString(), StackTrace.empty);
          return;
      }
    } catch (e, st) {
      if(!mounted)return;
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> loadMore() async {
    if (!hasMore || isLoading) return;

    isLoading = true;
    try {
      final newAnnouncements = await repository.getListAnnouncement({
        "page": page + 1,
        "page_size": 10,
        "rt_id": rtId,
      });
      switch (newAnnouncements) {
        case Ok<ApiResponse<List<AnnouncementModel>>>():
          if (newAnnouncements.value.data == null) {
            hasMore = false;
            state = state.whenData((houses) => [...houses]);
            return;
          }
          hasMore = newAnnouncements.value.meta!.totalPages > page;
          if (hasMore) {
            page++;
          }

          state = state.whenData(
            (houses) => [...houses, ...newAnnouncements.value.data!],
          );
          break;
        case Error<ApiResponse<List<AnnouncementModel>>>():
          state = AsyncValue.error(
            newAnnouncements.error.toString(),
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

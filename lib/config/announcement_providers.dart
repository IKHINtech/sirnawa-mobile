// ========== Announcement ========== //

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sirnawa_mobile/config/app_providers.dart';
import 'package:sirnawa_mobile/data/repositories/announcement/announcement_repository.dart';
import 'package:sirnawa_mobile/data/repositories/announcement/announcement_repository_remote.dart';
import 'package:sirnawa_mobile/data/services/api/announcement_services.dart';
import 'package:sirnawa_mobile/data/services/api/api_client.dart';
import 'package:sirnawa_mobile/domain/model/announcement/announcement_model.dart';
import 'package:sirnawa_mobile/ui/admin/announcement/announcement_viewmodel/announcement_viewmodel.dart';

final announcementPaginationProvider = StateNotifierProvider.autoDispose<
  AnnouncementListNotifier,
  AsyncValue<List<AnnouncementModel>>
>((ref) {
  final repository = ref.watch(announcementRepositoryProvider);
  final rtId = ref.watch(
    homeViewModelProvider.select((s) => s.residentHouse?.house!.rt?.id ?? ""),
  );

  if (rtId.isEmpty) {
    return AnnouncementListNotifier(repository, "")
      // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
      ..state = const AsyncValue.data([]);
  }

  return AnnouncementListNotifier(repository, rtId);
});

final Provider<AnnouncementService> announcementServiceProvider =
    Provider<AnnouncementService>((Ref<AnnouncementService> ref) {
      return AnnouncementService(ref.read<ApiClient>(apiClientProvider));
    });

final Provider<AnnouncementRepository> announcementRepositoryProvider =
    Provider<AnnouncementRepository>((Ref<AnnouncementRepository> ref) {
      return AnnouncementRepositoryRemote(
        announcementService: ref.read<AnnouncementService>(
          announcementServiceProvider,
        ),
      );
    });

final StateNotifierProvider<AnnouncementViewModel, AnnouncementState>
announcementViewModelProvider =
    StateNotifierProvider<AnnouncementViewModel, AnnouncementState>((ref) {
      return AnnouncementViewModel(
        repository: ref.read<AnnouncementRepository>(
          announcementRepositoryProvider,
        ),
      );
    });

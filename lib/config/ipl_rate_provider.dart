import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sirnawa_mobile/config/app_providers.dart';
import 'package:sirnawa_mobile/data/repositories/ipl_rate/ipl_rate_repository.dart';
import 'package:sirnawa_mobile/data/repositories/ipl_rate/ipl_rate_repository_remote.dart';
import 'package:sirnawa_mobile/data/services/api/api_client.dart';
import 'package:sirnawa_mobile/data/services/api/ipl_rate_services.dart';
import 'package:sirnawa_mobile/domain/model/ipl_rate/ipl_rate_model.dart';
import 'package:sirnawa_mobile/ui/admin/ipl_rate/view_models/ipl_rate_viewmodels.dart';

final iplRateListProvider = StateNotifierProvider<
  IplRateListNotifier,
  AsyncValue<List<IplRateModel>>
>((ref) {
  final repository = ref.watch(iplRateRepositoryProvider);
  final rtId = ref.watch(
    homeViewModelProvider.select((s) => s.residentHouse?.house!.rt?.id ?? ""),
  );
  return IplRateListNotifier(repository, rtId);
});

final Provider<IplRateService> iplRateServiceProvider =
    Provider<IplRateService>((Ref<IplRateService> ref) {
      return IplRateService(ref.read<ApiClient>(apiClientProvider));
    });

final Provider<IplRateRepository> iplRateRepositoryProvider =
    Provider<IplRateRepository>((Ref<IplRateRepository> ref) {
      return IplRateRepositoryRemote(
        iplRateService: ref.read<IplRateService>(iplRateServiceProvider),
      );
    });

final StateNotifierProvider<IplRateViewModel, IplRateState>
iplRateViewModelProvider =
    StateNotifierProvider<IplRateViewModel, IplRateState>((ref) {
      final rtId = ref.watch(
        homeViewModelProvider.select((s) => s.userRtModel?.rtId ?? ""),
      );
      return IplRateViewModel(
        repository: ref.read<IplRateRepository>(iplRateRepositoryProvider),
        rtID: rtId,
      );
    });

final iplRateNotInGroupNotifier = StateNotifierProvider.autoDispose((ref) {
  final repository = ref.watch(iplRateRepositoryProvider);
  final rtId = ref.watch(
    homeViewModelProvider.select((s) => s.residentHouse?.house!.rt?.id ?? ""),
  );
  return IplRateListNotInGroupNotifier(repository, rtId);
});

// ========== RT ========== //
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sirnawa_mobile/config/app_providers.dart';
import 'package:sirnawa_mobile/data/repositories/rt/rt_repository.dart';
import 'package:sirnawa_mobile/data/repositories/rt/rt_repository_remote.dart';
import 'package:sirnawa_mobile/data/services/api/api_client.dart';
import 'package:sirnawa_mobile/data/services/api/rt_services.dart';
import 'package:sirnawa_mobile/ui/admin/rt/rt_viewmodel/rt_viewmodel.dart';

// ========== RT ========== //
final Provider<RtService> rtServiceProvider = Provider<RtService>((
  Ref<RtService> ref,
) {
  return RtService(ref.read<ApiClient>(apiClientProvider));
});

final Provider<RtRepository> rtRepositoryProvider = Provider<RtRepository>((
  Ref<RtRepository> ref,
) {
  return RtRepositoryRemote(rtService: ref.read<RtService>(rtServiceProvider));
});

final StateNotifierProvider<RtViewModel, RtState> rtViewModelProvider =
    StateNotifierProvider<RtViewModel, RtState>((ref) {
      return RtViewModel(
        repository: ref.read<RtRepository>(rtRepositoryProvider),
      );
    });

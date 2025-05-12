// ========== RW ========== //
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sirnawa_mobile/config/app_providers.dart';
import 'package:sirnawa_mobile/data/repositories/rw/rw_repository.dart';
import 'package:sirnawa_mobile/data/repositories/rw/rw_repository_remote.dart';
import 'package:sirnawa_mobile/data/services/api/api_client.dart';
import 'package:sirnawa_mobile/data/services/api/rw_services.dart';
import 'package:sirnawa_mobile/ui/admin/rw/rw_viewmodel/rw_viewmodel.dart';

final Provider<RwService> rwServiceProvider = Provider<RwService>((
  Ref<RwService> ref,
) {
  return RwService(ref.read<ApiClient>(apiClientProvider));
});

final Provider<RwRepository> rwRepositoryProvider = Provider<RwRepository>((
  Ref<RwRepository> ref,
) {
  return RwRepositoryRemote(rwService: ref.read<RwService>(rwServiceProvider));
});

final StateNotifierProvider<RwViewModel, RwState> rwViewModelProvider =
    StateNotifierProvider<RwViewModel, RwState>((ref) {
      return RwViewModel(
        repository: ref.read<RwRepository>(rwRepositoryProvider),
      );
    });

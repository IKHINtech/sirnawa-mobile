import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sirnawa_mobile/config/app_providers.dart';
import 'package:sirnawa_mobile/data/repositories/ipl_rate_detail/ipl_rate_detail_repository.dart';
import 'package:sirnawa_mobile/data/repositories/ipl_rate_detail/ipl_rate_detail_repository_remote.dart';
import 'package:sirnawa_mobile/data/services/api/api_client.dart';
import 'package:sirnawa_mobile/data/services/api/ipl_rate_detail_services.dart';
import 'package:sirnawa_mobile/domain/model/ipl_rate_detail/ipl_rate_detail_model.dart';
import 'package:sirnawa_mobile/ui/admin/ipl_rate/view_models/ipl_rate_detail_viewmodel.dart';

final iplRateDetailListProvider = StateNotifierProvider.family<
  IplRateDetailListNotifier,
  AsyncValue<List<IplRateDetailModel>>,
  String
>((ref, iplRefId) {
  final repository = ref.watch(iplRateDetailRepositoryProvider);
  return IplRateDetailListNotifier(repository, iplRefId);
});

final Provider<IplRateDetailService> iplRateDetailServiceProvider =
    Provider<IplRateDetailService>((Ref<IplRateDetailService> ref) {
      return IplRateDetailService(ref.read<ApiClient>(apiClientProvider));
    });

final Provider<IplRateDetailRepository> iplRateDetailRepositoryProvider =
    Provider<IplRateDetailRepository>((Ref<IplRateDetailRepository> ref) {
      return IplRateDetailRepositoryRemote(
        iplRateService: ref.read<IplRateDetailService>(
          iplRateDetailServiceProvider,
        ),
      );
    });

final iplRateDetailViewModelProvider =
    StateNotifierProvider<IplRateDetailViewModel, IplRateDetailState>((ref) {
      return IplRateDetailViewModel(
        repository: ref.read<IplRateDetailRepository>(
          iplRateDetailRepositoryProvider,
        ),
      );
    });

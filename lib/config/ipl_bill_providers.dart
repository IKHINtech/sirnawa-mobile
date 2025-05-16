import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sirnawa_mobile/config/app_providers.dart';
import 'package:sirnawa_mobile/data/repositories/ipl_bill/ipl_bill_repository.dart';
import 'package:sirnawa_mobile/data/repositories/ipl_bill/ipl_bill_repository_remote.dart';
import 'package:sirnawa_mobile/data/services/api/api_client.dart';
import 'package:sirnawa_mobile/data/services/api/ipl_bill_services.dart';
import 'package:sirnawa_mobile/domain/model/ipl_bill/ipl_bill_model.dart';
import 'package:sirnawa_mobile/ui/admin/ipl_bill/view_model/ipl_bill_viewmodels.dart';

final iplBillListProvider = StateNotifierProvider<
  IplBillListNotifier,
  AsyncValue<List<IplBillModel>>
>((ref) {
  final repository = ref.watch(iplBillRepositoryProvider);
  final rtId = ref.watch(
    homeViewModelProvider.select((s) => s.residentHouse?.house!.rt?.id ?? ""),
  );
  return IplBillListNotifier(repository, rtId);
});

final Provider<IplBillService> iplBillServiceProvider =
    Provider<IplBillService>((Ref<IplBillService> ref) {
      return IplBillService(ref.read<ApiClient>(apiClientProvider));
    });

final Provider<IplBillRepository> iplBillRepositoryProvider =
    Provider<IplBillRepository>((Ref<IplBillRepository> ref) {
      return IplBillRepositoryRemote(
        iplBillService: ref.read<IplBillService>(iplBillServiceProvider),
      );
    });

final StateNotifierProvider<IplBillViewModel, IplBillState>
iplBillViewModelProvider =
    StateNotifierProvider<IplBillViewModel, IplBillState>((ref) {
      final rtId = ref.watch(
        homeViewModelProvider.select((s) => s.userRtModel?.rtId ?? ""),
      );
      return IplBillViewModel(
        repository: ref.read<IplBillRepository>(iplBillRepositoryProvider),
        rtID: rtId,
      );
    });

final iplBillNotInGroupNotifier = StateNotifierProvider.autoDispose((ref) {
  final repository = ref.watch(iplBillRepositoryProvider);
  final rtId = ref.watch(
    homeViewModelProvider.select((s) => s.residentHouse?.house!.rt?.id ?? ""),
  );
  return IplBillListNotInGroupNotifier(repository, rtId);
});

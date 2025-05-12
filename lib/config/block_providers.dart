// ========== BLOCK ========== //

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sirnawa_mobile/config/app_providers.dart';
import 'package:sirnawa_mobile/data/repositories/block/block_repository.dart';
import 'package:sirnawa_mobile/data/repositories/block/block_repository_remote.dart';
import 'package:sirnawa_mobile/data/services/api/api_client.dart';
import 'package:sirnawa_mobile/data/services/api/block_services.dart';
import 'package:sirnawa_mobile/domain/model/block/block_model.dart';
import 'package:sirnawa_mobile/ui/admin/block/block_view_model/block_viewmodel.dart';
import 'package:sirnawa_mobile/ui/home/view_models/home_viewmodel.dart';

final blockListProvider = StateNotifierProvider<
  BlockListNotifier,
  AsyncValue<List<BlockModel>>
>((ref) {
  final repository = ref.watch(blockRepositoryProvider);
  final rtId = ref.watch(
    homeViewModelProvider.select((s) => s.residentHouse?.house!.rt?.id ?? ""),
  );
  return BlockListNotifier(repository, rtId);
});

final Provider<BlockService> blockServiceProvider = Provider<BlockService>((
  Ref<BlockService> ref,
) {
  return BlockService(ref.read<ApiClient>(apiClientProvider));
});

final Provider<BlockRepository> blockRepositoryProvider =
    Provider<BlockRepository>((Ref<BlockRepository> ref) {
      return BlockRepositoryRemote(
        blockService: ref.read<BlockService>(blockServiceProvider),
      );
    });

final StateNotifierProvider<BlockViewModel, BlockState> blockViewModelProvider =
    StateNotifierProvider<BlockViewModel, BlockState>((ref) {
      return BlockViewModel(
        repository: ref.read<BlockRepository>(blockRepositoryProvider),
      );
    });

final FutureProvider<List<BlockModel>> blocksProvider =
    FutureProvider<List<BlockModel>>((Ref ref) async {
      final String rtid =
          ref
              .watch<HomeState>(homeViewModelProvider)
              .residentHouse
              ?.house!
              .rt
              ?.id ??
          "";
      await ref
          .read<BlockViewModel>(blockViewModelProvider.notifier)
          .fetchBlockOptions(rtId: rtid);
      return ref.read<BlockState>(blockViewModelProvider).blockOptions;
    });

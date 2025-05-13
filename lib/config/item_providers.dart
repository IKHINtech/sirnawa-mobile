import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sirnawa_mobile/config/app_providers.dart';
import 'package:sirnawa_mobile/data/repositories/item/item_repository.dart';
import 'package:sirnawa_mobile/data/repositories/item/item_repository_remote.dart';
import 'package:sirnawa_mobile/data/services/api/api_client.dart';
import 'package:sirnawa_mobile/data/services/api/item_services.dart';
import 'package:sirnawa_mobile/domain/model/item/item_model.dart';
import 'package:sirnawa_mobile/ui/admin/item/view_models/item_viewmodels.dart';

final itemListProvider =
    StateNotifierProvider<ItemListNotifier, AsyncValue<List<ItemModel>>>((ref) {
      final repository = ref.watch(itemRepositoryProvider);
      final rtId = ref.watch(
        homeViewModelProvider.select(
          (s) => s.residentHouse?.house!.rt?.id ?? "",
        ),
      );
      return ItemListNotifier(repository, rtId);
    });

final Provider<ItemService> itemServiceProvider = Provider<ItemService>((
  Ref<ItemService> ref,
) {
  return ItemService(ref.read<ApiClient>(apiClientProvider));
});

final Provider<ItemRepository> itemRepositoryProvider =
    Provider<ItemRepository>((Ref<ItemRepository> ref) {
      return ItemRepositoryRemote(
        itemService: ref.read<ItemService>(itemServiceProvider),
      );
    });

final StateNotifierProvider<ItemViewModel, ItemState> itemViewModelProvider =
    StateNotifierProvider<ItemViewModel, ItemState>((ref) {
      final rtId = ref.watch(
        homeViewModelProvider.select((s) => s.userRtModel?.rtId ?? ""),
      );
      return ItemViewModel(
        repository: ref.read<ItemRepository>(itemRepositoryProvider),
        rtID: rtId,
      );
    });

final itemNotInGroupNotifier = StateNotifierProvider.autoDispose((ref) {
  final repository = ref.watch(itemRepositoryProvider);
  final rtId = ref.watch(
    homeViewModelProvider.select((s) => s.residentHouse?.house!.rt?.id ?? ""),
  );
  return ItemListNotInGroupNotifier(repository, rtId);
});

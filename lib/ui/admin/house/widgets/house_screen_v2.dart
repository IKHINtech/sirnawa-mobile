import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sirnawa_mobile/config/app_providers.dart';
import 'package:sirnawa_mobile/config/block_providers.dart';
import 'package:sirnawa_mobile/config/house_provders.dart';
import 'package:sirnawa_mobile/domain/model/block/block_model.dart';
import 'package:sirnawa_mobile/routing/routes.dart';
import 'package:sirnawa_mobile/ui/admin/house/widgets/house_item.dart';
import 'package:sirnawa_mobile/ui/core/ui/custom_appbar.dart';
import 'package:sirnawa_mobile/ui/core/ui/lottie_loading.dart';

class HouseScreenV2 extends ConsumerWidget {
  const HouseScreenV2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeViewModelProvider);
    final initialBlockId = homeState.residentHouse?.house!.block?.id ?? "";
    final blocksAsync = ref.watch(blocksProvider);
    final selectedBlockId = ref.watch(selectedBlockProvider);
    final currentBlockId =
        selectedBlockId.isNotEmpty ? selectedBlockId : initialBlockId;
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Data Rumah ${homeState.residentHouse?.house!.rt?.name}',
      ),
      body: Column(
        children: [
          _buildBlockFilter(ref, blocksAsync, currentBlockId),
          Expanded(child: _buildHouseList(ref, currentBlockId, context)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push(Routes.houseCreate),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildBlockFilter(
    WidgetRef ref,
    AsyncValue<List<BlockModel>> blocks,
    String currentBlockId,
  ) {
    return blocks.when(
      data:
          (blocks) => SizedBox(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: blocks.length,
              itemBuilder: (context, index) {
                final block = blocks[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FilterChip(
                    label: Text(block.name),
                    selected: block.id == currentBlockId,
                    onSelected: (_) {
                      ref.read(selectedBlockProvider.notifier).state = block.id;
                    },
                  ),
                );
              },
            ),
          ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => Center(child: Text('Error: $error')),
    );
  }

  Widget _buildHouseList(WidgetRef ref, String blockId, BuildContext context) {
    final houseListState = ref.watch(houseListProvider(blockId));

    return RefreshIndicator(
      onRefresh: () => ref.read(houseListProvider(blockId).notifier).refresh(),
      child: houseListState.when(
        loading: () => MyRtLoading(),
        error: (error, stack) => Center(child: Text('Error: $error')),
        data: (houses) {
          if (houses.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.house_outlined,
                    size: 48,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Tidak ada data rumah',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Silakan tambahkan rumah atau coba filter lain',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            );
          }
          return ListView.builder(
            itemCount: houses.length + 1, // +1 for loading indicator
            itemBuilder: (context, index) {
              if (index < houses.length) {
                final house = houses[index];
                return HouseItem(house);
              } else {
                // Show loading indicator at the bottom if there's more to load
                final notifier = ref.read(houseListProvider(blockId).notifier);
                if (notifier.hasMore && !notifier.isLoading) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    notifier.loadMore();
                  });
                }
                return notifier.hasMore
                    ? const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Center(child: CircularProgressIndicator()),
                    )
                    : const SizedBox();
              }
            },
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:sirnawa_mobile/config/app_providers.dart';
import 'package:sirnawa_mobile/config/item_providers.dart';
import 'package:sirnawa_mobile/domain/model/item/item_model.dart';
import 'package:sirnawa_mobile/routing/routes.dart';
import 'package:sirnawa_mobile/ui/core/ui/custom_appbar.dart';

class ItemListScreen extends ConsumerStatefulWidget {
  const ItemListScreen({super.key});

  @override
  ConsumerState<ItemListScreen> createState() => _ItemListScreenState();
}

class _ItemListScreenState extends ConsumerState<ItemListScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      ref.read(itemListProvider.notifier).loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    final itemListAsync = ref.watch(itemListProvider);

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Items',
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.read(itemListProvider.notifier).refresh(),
          ),
          //IconButton(
          //  icon: const Icon(Icons.add),
          //  onPressed: () {
          //    context.push(Routes.itemCreate);
          //  },
          //),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push(Routes.itemCreate);
        },
        child: const Icon(Icons.add),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await ref.read(itemListProvider.notifier).refresh();
        },
        child: itemListAsync.when(
          loading:
              () => Center(
                child: SizedBox(
                  height: 140,
                  width: 140,
                  child: Lottie.asset('assets/loading_my_rt.json'),
                ),
              ),
          error: (error, stack) => Center(child: Text('Error: $error')),
          data: (items) {
            if (items.isEmpty) {
              return const Center(child: Text('No items found'));
            }
            return ListView.builder(
              controller: _scrollController,
              itemCount: items.length + 1,
              itemBuilder: (context, index) {
                if (index == items.length) {
                  return ref.watch(itemListProvider.notifier).hasMore
                      ? const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Center(child: CircularProgressIndicator()),
                      )
                      : const SizedBox();
                }
                final item = items[index];
                return ItemCard(item: item);
              },
            );
          },
        ),
      ),
    );
  }
}

class ItemCard extends ConsumerWidget {
  final ItemModel item;

  const ItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final role = ref.watch(homeViewModelProvider).userRtModel;

    return role?.role == 'warga'
        ? Card.outlined(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: ListTile(
            title: Text(item.name),
            subtitle: Text(item.description),
          ),
        )
        : Slidable(
          key: ValueKey(item.id),
          endActionPane: ActionPane(
            motion: const DrawerMotion(),
            children: [
              SlidableAction(
                onPressed: (context) {
                  context.push(Routes.itemUpdate, extra: item);
                },
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                icon: Icons.edit,
                label: 'Edit',
              ),
              // Uncomment if you want to add delete functionality
              /*
                SlidableAction(
                  onPressed: (context) => _showDeleteDialog(context, ref, item.id),
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Delete',
                ),
                */
            ],
          ),
          child: Card.outlined(
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: ListTile(
              title: Text(item.name),
              subtitle: Text(item.description),
            ),
          ),
        );
  }

  //  void _showDeleteDialog(
  //    BuildContext context,
  //    WidgetRef ref,
  //    String itemId,
  //  ) async {
  //    final confirmed = await showDialog<bool>(
  //      context: context,
  //      builder:
  //          (context) => AlertDialog(
  //            title: const Text('Delete Item'),
  //            content: const Text('Are you sure you want to delete this item?'),
  //            actions: [
  //              TextButton(
  //                onPressed: () => Navigator.pop(context, false),
  //                child: const Text('Cancel'),
  //              ),
  //              TextButton(
  //                onPressed: () => Navigator.pop(context, true),
  //                child: const Text('Delete'),
  //              ),
  //            ],
  //          ),
  //    );
  //
  //    if (confirmed == true) {
  //      await ref
  //          .read(itemViewModelProvider.notifier)
  //          .deleteItem(id: itemId, rtId: item.rtId.toString());
  //      ref.read(itemListProvider.notifier).refresh();
  //    }
  //  }
}

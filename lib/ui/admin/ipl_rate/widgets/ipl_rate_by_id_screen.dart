import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:sirnawa_mobile/data/services/api/model/ipl_rate_detail/ipl_rate_detail_request_model.dart';
import 'package:sirnawa_mobile/domain/model/ipl_rate/ipl_rate_model.dart';
import 'package:sirnawa_mobile/routing/routes.dart';

class IplRateDetailScreen extends ConsumerStatefulWidget {
  final IplRateModel rate;

  const IplRateDetailScreen({super.key, required this.rate});

  @override
  ConsumerState<IplRateDetailScreen> createState() =>
      _IplRateDetailScreenState();
}

class _IplRateDetailScreenState extends ConsumerState<IplRateDetailScreen> {
  final DateFormat _dateFormat = DateFormat('dd MMM yyyy');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IPL Rate Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              context.push(Routes.iplRateUpdate, extra: widget.rate);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          _buildRateInfo(),
          const Divider(height: 1),
          Expanded(child: _buildItemList()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddItemDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildRateInfo() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Rate Details', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Amount:'),
              Text(
                '${widget.rate.ammount}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('House Type:'),
              Text(
                widget.rate.houseType ?? "",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Block ID:'),
              Text(
                widget.rate.blockId ?? "",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Effective Date:'),

              Text(
                DateFormat(
                  'EEEE, d MMMM y',
                  'id_ID',
                ).format(widget.rate.startDate.toLocal()),

                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildItemList() {
    // TODO: Replace with your actual item list provider
    final itemsAsync = ref.watch(iplRateItemsProvider(widget.rate.id));

    return itemsAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('Error: $error')),
      data: (items) {
        if (items.isEmpty) {
          return const Center(
            child: Text('No items associated with this rate'),
          );
        }
        return ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return _buildItemCard(item);
          },
        );
      },
    );
  }

  Widget _buildItemCard(IplRateDetailRequestModel item) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ListTile(
        title: Text('Item: ${item.itemId}'),
        subtitle: Text('Amount: ${item.amount}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () => _showEditItemDialog(context, item),
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => _showDeleteItemDialog(context, item.id!),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showAddItemDialog(BuildContext context) async {
    final result = await showDialog<IplRateDetailRequestModel>(
      context: context,
      builder: (context) => IplRateItemFormDialog(rateId: widget.rate.id),
    );

    if (result != null) {
      // TODO: Implement create item logic
      // await ref.read(iplRateViewModelProvider.notifier)
      //   .createIplRateItem(result);
      ref.refresh(iplRateItemsProvider(widget.rate.id));
    }
  }

  Future<void> _showEditItemDialog(
    BuildContext context,
    IplRateDetailRequestModel item,
  ) async {
    final result = await showDialog<IplRateDetailRequestModel>(
      context: context,
      builder:
          (context) =>
              IplRateItemFormDialog(rateId: widget.rate.id, item: item),
    );

    if (result != null) {
      // TODO: Implement update item logic
      // await ref.read(iplRateViewModelProvider.notifier)
      //   .updateIplRateItem(item.id!, result);
      ref.refresh(iplRateItemsProvider(widget.rate.id));
    }
  }

  Future<void> _showDeleteItemDialog(
    BuildContext context,
    String itemId,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Delete Item'),
            content: const Text('Are you sure you want to delete this item?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text('Delete'),
              ),
            ],
          ),
    );

    if (confirmed == true) {
      // TODO: Implement delete item logic
      // await ref.read(iplRateViewModelProvider.notifier)
      //   .deleteIplRateItem(itemId);
      ref.refresh(iplRateItemsProvider(widget.rate.id));
    }
  }
}

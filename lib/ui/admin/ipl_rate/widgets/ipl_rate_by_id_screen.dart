import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:sirnawa_mobile/config/app_providers.dart';
import 'package:sirnawa_mobile/config/ipl_rate_detail_provider.dart';
import 'package:sirnawa_mobile/data/services/api/model/ipl_rate_detail/ipl_rate_detail_request_model.dart';
import 'package:sirnawa_mobile/domain/model/ipl_rate/ipl_rate_model.dart';
import 'package:sirnawa_mobile/domain/model/ipl_rate_detail/ipl_rate_detail_model.dart';
import 'package:sirnawa_mobile/routing/routes.dart';
import 'package:sirnawa_mobile/ui/admin/ipl_rate/widgets/ipl_rate_items_dialog.dart';
import 'package:sirnawa_mobile/ui/core/ui/custom_appbar.dart';
import 'package:sirnawa_mobile/ui/core/ui/lottie_loading.dart';

class IplRateDetailScreen extends ConsumerStatefulWidget {
  final IplRateModel rate;

  const IplRateDetailScreen({super.key, required this.rate});

  @override
  ConsumerState<IplRateDetailScreen> createState() =>
      _IplRateDetailScreenState();
}

class _IplRateDetailScreenState extends ConsumerState<IplRateDetailScreen> {
  //final DateFormat _dateFormat = DateFormat('dd MMM yyyy');

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref
          .read(iplRateDetailViewModelProvider.notifier)
          .getIplRateDetailListIplRateDetail(iplRateId: widget.rate.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'IPL Rate Details',
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
              const Text('Biaya:'),
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
              const Text('Tanggal Efektif:'),

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
    final itemsAsync = ref.watch(
      iplRateDetailViewModelProvider.select((e) => e.list),
    );

    return itemsAsync.when(
      loading: () => MyRtLoading(),

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
            return _buildItemCard(item, ref, context);
          },
        );
      },
    );
  }

  Widget _buildItemCard(
    IplRateDetailModel item,
    WidgetRef ref,
    BuildContext context,
  ) {
    final role = ref.watch(homeViewModelProvider).userRtModel;

    return role?.role == 'warga'
        ? Card.outlined(
          child: ListTile(
            title: Text(item.item?.name ?? ''),
            subtitle: Text('Biaya: ${item.amount}'),
          ),
        )
        : Slidable(
          key: ValueKey(item.id),
          endActionPane: ActionPane(
            motion: const DrawerMotion(),
            children: [
              SlidableAction(
                onPressed: (context) => _showEditItemDialog(context, item),
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                icon: Icons.edit,
                label: 'Edit',
              ),
              SlidableAction(
                onPressed:
                    (context) => _showDeleteItemDialog(context, item.id!),
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Hapus',
              ),
            ],
          ),
          child: Card.outlined(
            child: ListTile(
              title: Text(item.item?.name ?? ''),
              subtitle: Text('Biaya: ${item.amount}'),
            ),
          ),
        );
  }

  Future<void> _showAddItemDialog(BuildContext context) async {
    await showDialog<IplRateDetailRequestModel>(
      context: context,
      builder: (context) => IplRateItemFormDialog(rateId: widget.rate.id),
    );
  }

  Future<void> _showEditItemDialog(
    BuildContext context,
    IplRateDetailModel item,
  ) async {
    await showDialog<IplRateDetailRequestModel>(
      context: context,
      builder:
          (context) =>
              IplRateItemFormDialog(rateId: widget.rate.id, item: item),
    );
  }

  Future<void> _showDeleteItemDialog(
    BuildContext context,
    String itemId,
  ) async {
    await showDialog<bool>(
      context: context,
      builder:
          (context) => Consumer(
            builder: (context, ref, _) {
              final loading = ref.watch(
                iplRateDetailViewModelProvider.select((e) => e.isLoading),
              );
              return AlertDialog(
                title: const Text('Delete Item'),
                content: const Text(
                  'Are you sure you want to delete this item?',
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed:
                        loading
                            ? null
                            : () async {
                              await ref
                                  .read(iplRateDetailViewModelProvider.notifier)
                                  .deleteIplRateDetail(id: itemId);
                              ref
                                  .watch(
                                    iplRateDetailViewModelProvider.notifier,
                                  )
                                  .getIplRateDetailListIplRateDetail(
                                    iplRateId: widget.rate.id,
                                  );

                              Navigator.pop(context);
                            },
                    child:
                        loading
                            ? SizedBox(
                              width: 20,
                              height: 20,
                              child: const CircularProgressIndicator(
                                strokeWidth: 2,
                              ),
                            )
                            : const Text('Delete'),
                  ),
                ],
              );
            },
          ),
    );
  }
}

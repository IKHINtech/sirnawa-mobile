import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:sirnawa_mobile/config/app_providers.dart';
import 'package:sirnawa_mobile/config/ipl_bill_providers.dart';
import 'package:sirnawa_mobile/domain/model/ipl_bill/ipl_bill_model.dart';
import 'package:sirnawa_mobile/ui/admin/ipl_bill/widgets/ipl_bill_form_screen.dart';
import 'package:sirnawa_mobile/ui/core/ui/custom_appbar.dart';
import 'package:sirnawa_mobile/ui/core/ui/lottie_loading.dart';

class IplBillScreen extends ConsumerWidget {
  const IplBillScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final iplBills = ref.watch(iplBillListProvider);
    //final viewModel = ref.watch(iplBillViewModelProvider);

    return Scaffold(
      appBar: CustomAppBar(
        title: 'IPL Bills',
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.read(iplBillListProvider.notifier).refresh(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showGenerateBillDialog(context, ref),
        child: const Icon(Icons.add),
      ),
      body: iplBills.when(
        loading: () => MyRtLoading(),
        error: (error, stack) => Center(child: Text('Error: $error')),
        data: (bills) {
          if (bills.isEmpty) {
            return const Center(child: Text('No IPL bills found'));
          }
          return RefreshIndicator(
            onRefresh: () => ref.read(iplBillListProvider.notifier).refresh(),
            child: ListView.builder(
              itemCount: bills.length,
              itemBuilder: (context, index) {
                final bill = bills[index];
                return buildIplBillCard(
                  context,
                  bill,
                  ref,
                  onDelete: () => _confirmDeleteBill(context, ref, bill.id),
                );
              },
            ),
          );
        },
      ),
    );
  }

  void _showGenerateBillDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => const GenerateIplBillDialog(),
    );
  }

  Future<void> _confirmDeleteBill(
    BuildContext context,
    WidgetRef ref,
    String billId,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Delete IPL Bill'),
            content: const Text('Are you sure you want to delete this bill?'),
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
      await ref
          .read(iplBillViewModelProvider.notifier)
          .deleteIplBill(id: billId);
      ref.read(iplBillListProvider.notifier).refresh();
    }
  }
}

class IplBillListItem extends ConsumerWidget {
  final IplBillModel bill;
  final VoidCallback onDelete;

  const IplBillListItem({
    super.key,
    required this.bill,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final role = ref.watch(homeViewModelProvider).userRtModel;

    return role?.role == 'warga'
        ? Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListTile(
            title: Text('${bill.house?.block?.name} No. ${bill.house?.number}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Amount: ${bill.totalAmount}'),
                Text('Bill #${bill.id}'),
              ],
            ),
          ),
        )
        : Slidable(
          key: ValueKey(bill.id),
          endActionPane: ActionPane(
            motion: const DrawerMotion(),
            children: [
              SlidableAction(
                onPressed: (context) => onDelete(),
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              ),
            ],
          ),
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              title: Text(
                '${bill.house?.block?.name} No. ${bill.house?.number}',
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Amount: ${bill.totalAmount}'),
                  Text('Bill #${bill.id}'),
                ],
              ),
            ),
          ),
        );
  }
}

Widget buildIplBillCard(
  BuildContext context,
  IplBillModel bill,
  WidgetRef ref, {
  required VoidCallback onDelete,
}) {
  final role = ref.watch(homeViewModelProvider).userRtModel;
  final statusColor = _getStatusColor(bill.status);
  final formattedDueDate = DateFormat(
    'dd MMM yyyy',
  ).format(DateTime.parse(bill.dueDate));

  return role?.role == 'warga'
      ? Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: ListTile(
          title: Text(
            '${bill.house?.block?.name ?? 'Unknown'} No. ${bill.house?.number ?? ''}',
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total: Rp ${NumberFormat('#,###').format(bill.totalAmount)}',
              ),
              Text('Due: $formattedDueDate'),
              Chip(
                label: Text(
                  bill.status.toUpperCase(),
                  style: const TextStyle(fontSize: 12, color: Colors.white),
                ),
                backgroundColor: statusColor,
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              ),
            ],
          ),
        ),
      )
      : Slidable(
        key: ValueKey(bill.id),
        endActionPane: ActionPane(
          motion: const DrawerMotion(),
          children: [
            if (bill.status == 'unpaid')
              SlidableAction(
                onPressed:
                    (context) => _showMarkAsPaidDialog(context, ref, bill.id),
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                icon: Icons.check_circle,
                label: 'Mark Paid',
              ),
            SlidableAction(
              onPressed: (context) => onDelete(),
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListTile(
            title: Text(
              '${bill.house?.block?.name ?? 'Unknown'} No. ${bill.house?.number ?? ''}',
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total: Rp ${NumberFormat('#,###').format(bill.totalAmount)}',
                ),
                Text('Due: $formattedDueDate'),
                Row(
                  children: [
                    Chip(
                      label: Text(
                        bill.status.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                      backgroundColor: statusColor,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                    ),
                    if (bill.penalty != null && bill.penalty!.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Chip(
                          label: Text(
                            'Penalty: ${bill.penalty}',
                            style: const TextStyle(fontSize: 12),
                          ),
                          backgroundColor: Colors.orange[100],
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
}

Color _getStatusColor(String status) {
  switch (status.toLowerCase()) {
    case 'paid':
      return Colors.green;
    case 'unpaid':
      return Colors.red;
    case 'partial':
      return Colors.orange;
    case 'overdue':
      return Colors.deepOrange;
    default:
      return Colors.grey;
  }
}

Future<void> _showMarkAsPaidDialog(
  BuildContext context,
  WidgetRef ref,
  String billId,
) async {
  final confirmed = await showDialog<bool>(
    context: context,
    builder:
        (context) => AlertDialog(
          title: const Text('Mark as Paid'),
          content: const Text(
            'Are you sure you want to mark this bill as paid?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('Confirm'),
            ),
          ],
        ),
  );

  if (confirmed == true) {
    //TODO: nanti lanjut
    // await ref
    //     .read(iplBillViewModelProvider.notifier)
    //     .updateBillStatus(billId: billId, status: 'paid');
    ref.read(iplBillListProvider.notifier).refresh();
  }
}

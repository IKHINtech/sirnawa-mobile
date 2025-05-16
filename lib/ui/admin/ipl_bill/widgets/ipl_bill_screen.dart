import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sirnawa_mobile/config/ipl_bill_providers.dart';
import 'package:sirnawa_mobile/domain/model/ipl_bill/ipl_bill_model.dart';
import 'package:sirnawa_mobile/ui/admin/ipl_bill/widgets/ipl_bill_form_screen.dart';

class IplBillScreen extends ConsumerWidget {
  const IplBillScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final iplBills = ref.watch(iplBillListProvider);
    //final viewModel = ref.watch(iplBillViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('IPL Bills'),
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
        loading: () => const Center(child: CircularProgressIndicator()),
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
                return IplBillListItem(
                  bill: bill,
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

class IplBillListItem extends StatelessWidget {
  final IplBillModel bill;
  final VoidCallback onDelete;

  const IplBillListItem({
    super.key,
    required this.bill,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text('Bill #${bill.id}'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Amount: ${bill.totalAmount}'),
            //Text('Due Date: ${DateFormat('dd MMM yyyy').format(bill.dueDate)}'),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: onDelete,
        ),
      ),
    );
  }
}

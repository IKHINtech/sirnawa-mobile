import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:sirnawa_mobile/config/app_providers.dart';
import 'package:sirnawa_mobile/config/ipl_rate_provider.dart';
import 'package:sirnawa_mobile/domain/model/ipl_rate/ipl_rate_model.dart';
import 'package:sirnawa_mobile/routing/routes.dart';
import 'package:sirnawa_mobile/ui/core/ui/custom_appbar.dart';
import 'package:sirnawa_mobile/ui/core/ui/lottie_loading.dart';

class IplRateListScreen extends ConsumerStatefulWidget {
  const IplRateListScreen({super.key});

  @override
  ConsumerState<IplRateListScreen> createState() => _IplRateListScreenState();
}

class _IplRateListScreenState extends ConsumerState<IplRateListScreen> {
  final ScrollController _scrollController = ScrollController();
  final DateFormat _dateFormat = DateFormat('dd MMM yyyy');

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
      ref.read(iplRateListProvider.notifier).loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    final iplRateListAsync = ref.watch(iplRateListProvider);

    return Scaffold(
      appBar: CustomAppBar(
        title: 'IPL Rates',
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.read(iplRateListProvider.notifier).refresh(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push(Routes.iplRateCreate);
        },
        child: Icon(Icons.add),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await ref.read(iplRateListProvider.notifier).refresh();
        },
        child: iplRateListAsync.when(
          loading: () => MyRtLoading(),
          error: (error, stack) => Center(child: Text('Error: $error')),
          data: (rates) {
            if (rates.isEmpty) {
              return const Center(child: Text('No IPL rates found'));
            }
            return ListView.builder(
              controller: _scrollController,
              itemCount: rates.length + 1,
              itemBuilder: (context, index) {
                if (index == rates.length) {
                  return ref.read(iplRateListProvider.notifier).hasMore
                      ? const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Center(child: CircularProgressIndicator()),
                      )
                      : const SizedBox();
                }
                final rate = rates[index];
                return IplRateCard(rate: rate, dateFormat: _dateFormat);
              },
            );
          },
        ),
      ),
    );
  }
}

class IplRateCard extends ConsumerWidget {
  final IplRateModel rate;
  final DateFormat dateFormat;

  const IplRateCard({super.key, required this.rate, required this.dateFormat});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final role = ref.watch(homeViewModelProvider).userRtModel;

    return role?.role == 'warga'
        ? InkWell(
          onTap: () {
            context.push(Routes.iplRateDetail, extra: rate);
          },
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: ListTile(
              title: Text('Rp. ${rate.ammount}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Berlaku Dari : ${DateFormat('EEEE, d MMMM y', 'id_ID').format(rate.startDate.toLocal())}",
                  ),
                ],
              ),
            ),
          ),
        )
        : Slidable(
          key: ValueKey(rate.id),
          endActionPane: ActionPane(
            motion: const DrawerMotion(),
            children: [
              SlidableAction(
                onPressed: (context) {
                  context.push(Routes.iplRateUpdate, extra: rate);
                },
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                icon: Icons.edit,
                label: 'Edit',
              ),
              SlidableAction(
                onPressed:
                    (context) => _showDeleteDialog(context, ref, rate.id),
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              ),
            ],
          ),
          child: InkWell(
            onTap: () {
              context.push(Routes.iplRateDetail, extra: rate);
            },
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: ListTile(
                title: Text('Rp. ${rate.ammount}'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Berlaku Dari : ${DateFormat('EEEE, d MMMM y', 'id_ID').format(rate.startDate.toLocal())}",
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
  }

  void _showDeleteDialog(
    BuildContext context,
    WidgetRef ref,
    String rateId,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Delete IPL Rate'),
            content: const Text('Are you sure you want to delete this rate?'),
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
          .read(iplRateViewModelProvider.notifier)
          .deleteIplRate(id: rateId);
      ref.read(iplRateListProvider.notifier).refresh();
    }
  }
}

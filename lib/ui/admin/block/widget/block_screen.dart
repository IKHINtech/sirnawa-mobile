import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:sirnawa_mobile/config/app_providers.dart';
import 'package:sirnawa_mobile/routing/routes.dart';
import 'package:sirnawa_mobile/ui/core/ui/custom_appbar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BlockScreen extends ConsumerStatefulWidget {
  const BlockScreen({super.key});

  @override
  ConsumerState<BlockScreen> createState() => _BlockScreenState();
}

class _BlockScreenState extends ConsumerState<BlockScreen> {
  @override
  Widget build(BuildContext context) {
    final homeState = ref.read(homeViewModelProvider);

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Data Blok ${homeState.residentHouse?.house!.rt?.name ?? ""}',
      ),
      body: _buildBody(context, ref),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push(Routes.adminBlockCreate);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildBody(BuildContext context, WidgetRef ref) {
    final blockListState = ref.watch(blockListProvider);
    return RefreshIndicator(
      onRefresh: () => ref.read(blockListProvider.notifier).refresh(),
      child: blockListState.when(
        data:
            (blocks) => ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: blocks.length + 1,
              itemBuilder: (context, index) {
                if (index < blocks.length) {
                  final block = blocks[index];
                  return Card(
                    child: ListTile(
                      onTap: () {
                        context.push(Routes.adminBlockUpdate, extra: block);
                      },
                      leading: const CircleAvatar(child: Icon(Icons.apartment)),
                      title: Text(block.name),
                    ),
                  );
                } else {
                  final notifier = ref.read(blockListProvider.notifier);
                  if (notifier.hasMore && !notifier.isLoading) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      notifier.loadMore();
                    });
                  }
                  return notifier.hasMore
                      ? Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Center(child: CircularProgressIndicator()),
                      )
                      : const SizedBox();
                }
              },
            ),

        error: (error, stack) => Center(child: Text('Error: $error')),
        loading:
            () => Center(
              child: SizedBox(
                height: 140,
                width: 140,
                child: Lottie.asset('assets/loading_my_rt.json'),
              ),
            ),
      ),
    );
  }
}

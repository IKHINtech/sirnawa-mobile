import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sirnawa_mobile/config/app_providers.dart';
import 'package:sirnawa_mobile/routing/routes.dart';
import 'package:sirnawa_mobile/ui/admin/block/block_view_model/block_viewmodel.dart';
import 'package:sirnawa_mobile/ui/core/ui/custom_appbar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sirnawa_mobile/ui/home/view_models/home_viewmodel.dart';

class BlockScreen extends ConsumerStatefulWidget {
  const BlockScreen({super.key});

  @override
  ConsumerState<BlockScreen> createState() => _BlockScreenState();
}

class _BlockScreenState extends ConsumerState<BlockScreen> {
  @override
  void initState() {
    super.initState();

    final homeState = ref.read(homeViewModelProvider);
    Future.microtask(() {
      ref
          .read(blockViewModelProvider.notifier)
          .fetchListBlock(
            reset: true,
            rtId: homeState.residentHouse?.house.rt?.id ?? "",
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(blockViewModelProvider);
    final viewModel = ref.read(blockViewModelProvider.notifier);
    final homeState = ref.read(homeViewModelProvider);

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Data Blok ${homeState.residentHouse?.house.rt?.name ?? ""}',
      ),
      body: _buildBody(state, viewModel, context, homeState),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push(Routes.adminBlockCreate);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildBody(
    BlockState state,
    BlockViewModel viewModel,
    BuildContext context,
    HomeState homeState,
  ) {
    if (state.isLoading && state.list.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Error: ${state.error}"),
            ElevatedButton(
              onPressed:
                  () => viewModel.fetchListBlock(
                    reset: true,
                    rtId: homeState.residentHouse?.house.rt?.id ?? "",
                  ),
              child: const Text("Retry"),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh:
          () => viewModel.fetchListBlock(
            reset: true,
            rtId: homeState.residentHouse?.house.rt?.id ?? "",
          ),
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount:
            state.hasNextPage ? state.list.length + 1 : state.list.length,
        itemBuilder: (context, index) {
          if (index >= state.list.length) {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Center(child: CircularProgressIndicator()),
            );
          }
          final rt = state.list[index];
          return Card(
            child: ListTile(
              onTap: () {
                context.push(Routes.adminBlockUpdate, extra: rt);
              },
              leading: const CircleAvatar(child: Icon(Icons.apartment)),
              title: Text(rt.name),
            ),
          );
        },
      ),
    );
  }
}

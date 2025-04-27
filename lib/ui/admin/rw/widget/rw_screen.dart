import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sirnawa_mobile/config/app_providers.dart';
import 'package:sirnawa_mobile/routing/routes.dart';
import 'package:sirnawa_mobile/ui/admin/rw/rw_viewmodel/rw_viewmodel.dart';
import 'package:sirnawa_mobile/ui/core/ui/custom_appbar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RwScreen extends ConsumerStatefulWidget {
  const RwScreen({super.key});

  @override
  ConsumerState<RwScreen> createState() => _RwScreenState();
}

class _RwScreenState extends ConsumerState<RwScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(rwViewModelProvider.notifier).fetchListRw(reset: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(rwViewModelProvider);
    final viewModel = ref.read(rwViewModelProvider.notifier);

    return Scaffold(
      appBar: CustomAppBar(title: 'Data RW'),
      body: _buildBody(state, viewModel, context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push(Routes.adminRwCreate);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildBody(
    RwState state,
    RwViewModel viewModel,
    BuildContext context,
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
              onPressed: () => viewModel.fetchListRw(reset: true),
              child: const Text("Retry"),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () => viewModel.fetchListRw(reset: true),
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
              onTap: () => context.push(Routes.adminRwUpdate, extra: rt),
              leading: Icon(Icons.group),
              title: Text(rt.name),
            ),
          );
        },
      ),
    );
  }
}

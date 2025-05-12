import 'package:flutter/material.dart';
import 'package:sirnawa_mobile/config/rt_providers.dart';
import 'package:sirnawa_mobile/ui/admin/rt/rt_viewmodel/rt_viewmodel.dart';
import 'package:sirnawa_mobile/ui/core/ui/custom_appbar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RtScreen extends ConsumerStatefulWidget {
  const RtScreen({super.key});

  @override
  ConsumerState<RtScreen> createState() => _RtScreenState();
}

class _RtScreenState extends ConsumerState<RtScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(rtViewModelProvider.notifier).fetchListRt(reset: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(rtViewModelProvider);
    final viewModel = ref.read(rtViewModelProvider.notifier);

    return Scaffold(
      appBar: CustomAppBar(title: 'Data RT'),
      body: _buildBody(state, viewModel, context),
    );
  }

  Widget _buildBody(
    RtState state,
    RtViewModel viewModel,
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
              onPressed: () => viewModel.fetchListRt(reset: true),
              child: const Text("Retry"),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () => viewModel.fetchListRt(reset: true),
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
            child: ListTile(leading: Icon(Icons.group), title: Text(rt.name)),
          );
        },
      ),
    );
  }
}

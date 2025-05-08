import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sirnawa_mobile/config/app_providers.dart';
import 'package:sirnawa_mobile/routing/routes.dart';
import 'package:sirnawa_mobile/ui/admin/resident/resident_view_model/resident_viewmodel.dart';
import 'package:sirnawa_mobile/ui/core/ui/custom_appbar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResidentScreen extends ConsumerStatefulWidget {
  const ResidentScreen({super.key});

  @override
  ConsumerState<ResidentScreen> createState() => _ResidentScreenState();
}

class _ResidentScreenState extends ConsumerState<ResidentScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(residentViewModelProvider);
    final viewModel = ref.read(residentViewModelProvider.notifier);

    return Scaffold(
      appBar: CustomAppBar(title: 'Data Warga'),
      body: _buildBody(state, viewModel, context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push(Routes.adminResidentCreate);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildBody(
    ResidentState state,
    ResidentViewModel viewModel,
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
            ElevatedButton(onPressed: () {}, child: const Text("Retry")),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () async {},
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 1,
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
              leading: const CircleAvatar(child: Icon(Icons.person)),
              title: Text(rt.name),
              subtitle: Text(rt.phoneNumber),
            ),
          );
        },
      ),
    );
  }
}

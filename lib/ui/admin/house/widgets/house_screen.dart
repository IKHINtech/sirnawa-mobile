import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sirnawa_mobile/config/app_providers.dart';
import 'package:sirnawa_mobile/routing/routes.dart';
import 'package:sirnawa_mobile/ui/admin/house/house_viewmodel/house_viewmodel.dart';
import 'package:sirnawa_mobile/ui/core/ui/custom_appbar.dart';
import 'package:sirnawa_mobile/ui/home/view_models/home_viewmodel.dart';

class HouseScreen extends ConsumerStatefulWidget {
  const HouseScreen({super.key});

  @override
  ConsumerState<HouseScreen> createState() => _HouseScreenState();
}

class _HouseScreenState extends ConsumerState<HouseScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final homeState = ref.read(homeViewModelProvider);
      final rtId = homeState.residentHouse?.house.rt?.id;
      ref
          .read(houseViewModelProvider.notifier)
          .fetchListHouse(reset: true, rtId: rtId ?? "");
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(houseViewModelProvider);
    final viewModel = ref.read(houseViewModelProvider.notifier);
    final homeState = ref.watch(homeViewModelProvider);
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Data Rumah ${homeState.residentHouse?.house.rt?.name}',
      ),
      body: _buildBody(state, viewModel, context, homeState),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push(Routes.adminHouseCreate);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildBody(
    HouseState state,
    HouseViewModel viewModel,
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
                  () => viewModel.fetchListHouse(
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
          () => viewModel.fetchListHouse(
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
          final house = state.list[index];
          return Card(
            child: ListTile(
              leading: const CircleAvatar(child: Icon(Icons.cottage)),
              title: Text(house.number),
              subtitle: Text(house.status),
            ),
          );
        },
      ),
    );
  }
}

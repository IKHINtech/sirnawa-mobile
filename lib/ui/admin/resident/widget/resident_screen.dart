import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sirnawa_mobile/config/resident_providers.dart';
import 'package:sirnawa_mobile/routing/routes.dart';
import 'package:sirnawa_mobile/ui/core/ui/custom_appbar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sirnawa_mobile/ui/core/ui/lottie_loading.dart';

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
    return Scaffold(
      appBar: CustomAppBar(title: 'Data Warga'),
      body: _buildBody(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push(Routes.adminResidentCreate);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    final residentListState = ref.watch(residentListProvider);

    return RefreshIndicator(
      onRefresh: () async {
        ref.read(residentListProvider.notifier).refresh();
      },
      child: residentListState.when(
        data: (residents) {
          if (residents.isEmpty) {
            return Center(
              child: Column(
                children: [
                  Icon(Icons.person, size: 48, color: Colors.grey),
                  const SizedBox(height: 16),
                  Text(
                    'Tidak ada data Warga',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Silakan tambahkan warga',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: residents.length + 1,
            itemBuilder: (context, index) {
              if (index < residents.length) {
                final resident = residents[index];
                return Card(
                  child: ListTile(
                    leading: const CircleAvatar(child: Icon(Icons.person)),
                    title: Text(resident.name),
                    subtitle: Text(resident.phoneNumber),
                  ),
                );
              } else {
                return ref.watch(residentListProvider.notifier).hasMore
                    ? const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Center(child: CircularProgressIndicator()),
                    )
                    : SizedBox();
              }
            },
          );
        },
        error: (err, st) => Center(child: Text('Error: $err')),
        loading: () => MyRtLoading(),
      ),
    );
  }
}

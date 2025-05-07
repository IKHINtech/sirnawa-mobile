import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sirnawa_mobile/config/app_providers.dart';
import 'package:sirnawa_mobile/routing/routes.dart';
import 'package:sirnawa_mobile/ui/core/ui/custom_appbar.dart';

class HouseDetailScreen extends ConsumerWidget {
  final String houseId;

  const HouseDetailScreen({super.key, required this.houseId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final houseAsync = ref.watch(houseDetailProvider(houseId));
    final penghuniAsync = ref.watch(
      listPenghuniProvider(houseId),
    ); // Tambahkan ini
    final error = ref.watch(houseErrorProvider);
    if (error != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error), duration: const Duration(seconds: 4)),
        );
        // Clear error setelah ditampilkan
        ref.read(houseErrorProvider.notifier).state = null;
      });
    }
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Detail Rumah',
        actions: [
          houseAsync.when(
            loading: () => IconButton(onPressed: null, icon: Icon(Icons.edit)),
            error: (error, stack) => SizedBox(),
            data:
                (house) =>
                    house == null
                        ? IconButton(onPressed: null, icon: Icon(Icons.edit))
                        : IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed:
                              () =>
                                  context.push(Routes.houseEdit, extra: house),
                        ),
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              final _ = ref.refresh(houseDetailProvider(houseId));
            },
          ),
        ],
      ),
      body: houseAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
        data:
            (house) => SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDetailCard(
                    title: 'Informasi Rumah',
                    children: [
                      _buildDetailItem('Nomor Rumah', house?.number ?? '-'),
                      _buildDetailItem('Status', house?.status ?? "-"),
                      _buildDetailItem('Blok', house?.block?.name ?? '-'),
                      _buildDetailItem('RT', house?.rt?.name ?? '-'),
                      _buildDetailItem('RW', house?.rw?.name ?? '-'),
                      _buildDetailItem(
                        'Perumahan',
                        house?.hosuingArea?.name ?? '-',
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  _buildDetailCard(
                    title: 'Penghuni',
                    children: [
                      penghuniAsync.when(
                        loading:
                            () => const Center(
                              child: CircularProgressIndicator(),
                            ),
                        error: (error, stack) => Text('Error: $error'),
                        data:
                            (penghuniList) => Column(
                              children: [
                                if (penghuniList.isEmpty)
                                  const Text('Tidak ada penghuni'),
                                ...penghuniList.map(
                                  (resident) => ListTile(
                                    leading: const CircleAvatar(
                                      child: Icon(Icons.person),
                                    ),
                                    title: Text(
                                      resident.resident?.name ?? 'No name',
                                    ),
                                    subtitle: Text(
                                      resident.resident!.isHeadOfFamily
                                          ? 'Kepala Keluarga'
                                          : 'Anggota Keluarga',
                                    ),
                                    onTap: () {
                                      // Navigate to resident detail
                                    },
                                  ),
                                ),
                              ],
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Row(
          children: [
            Icon(Icons.add),
            SizedBox(width: 8),
            const Text('Tambah Penghuni'),
          ],
        ),
        onPressed: () {},
      ),
    );
  }

  Widget _buildDetailCard({
    required String title,
    required List<Widget> children,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const Text(': '),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}

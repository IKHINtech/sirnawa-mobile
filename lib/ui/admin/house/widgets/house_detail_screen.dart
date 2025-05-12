import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:sirnawa_mobile/config/house_provders.dart';
import 'package:sirnawa_mobile/config/resident_house_providers.dart';
import 'package:sirnawa_mobile/config/resident_providers.dart';
import 'package:sirnawa_mobile/data/services/api/model/resident_house_request/resident_house_request_model.dart';
import 'package:sirnawa_mobile/domain/model/house/house_model.dart';
import 'package:sirnawa_mobile/domain/model/resident_house/resident_house_model.dart';
import 'package:sirnawa_mobile/routing/routes.dart';
import 'package:sirnawa_mobile/ui/admin/house/widgets/fullscreen_maps.dart';
import 'package:sirnawa_mobile/ui/admin/resident_house/resident_house_viewmodel/resident_house_viewmodel.dart';
import 'package:sirnawa_mobile/ui/core/ui/custom_appbar.dart';

class HouseDetailScreen extends ConsumerWidget {
  final String houseId;

  const HouseDetailScreen({super.key, required this.houseId});
  void _showResidentPicker(BuildContext context, WidgetRef ref) {
    final residentSearchController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  controller: residentSearchController,
                  decoration: InputDecoration(
                    labelText: 'Cari penghuni',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onChanged: (value) {
                    ref.read(residentSearchProvider.notifier).state = value;
                    // Refrensh the provider with search term
                    final _ = ref.refresh(residentOptionsProvider);
                  },
                ),
              ),
              Expanded(
                child: Consumer(
                  builder: (context, ref, child) {
                    final residentsAsync = ref.watch(residentOptionsProvider);

                    return residentsAsync.when(
                      loading:
                          () =>
                              const Center(child: CircularProgressIndicator()),
                      error: (err, stack) => Center(child: Text('Error: $err')),
                      data: (residents) {
                        if (residents.isEmpty) {
                          return const Center(
                            child: Text("Tidak ada data penghuni."),
                          );
                        }

                        // Filter residents based on search term
                        final filteredResidents =
                            residentSearchController.text.isEmpty
                                ? residents
                                : residents
                                    .where(
                                      (resident) =>
                                          resident.name.toLowerCase().contains(
                                            residentSearchController.text
                                                .toLowerCase(),
                                          ),
                                    )
                                    .toList();

                        if (filteredResidents.isEmpty) {
                          return const Center(
                            child: Text(
                              "Tidak ditemukan penghuni dengan nama tersebut.",
                            ),
                          );
                        }

                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: filteredResidents.length,
                          itemBuilder: (context, index) {
                            final resident = filteredResidents[index];
                            return ListTile(
                              leading: CircleAvatar(
                                child: Text(resident.name[0]),
                              ),
                              title: Text(resident.name),
                              subtitle: Text(resident.nik),
                              onTap: () {
                                // Add logic to associate resident with house
                                _addResidentToHouse(
                                  context,
                                  ref,
                                  resident.id,
                                  ref
                                      .watch(houseDetailProvider(houseId))
                                      .value!,
                                );
                              },
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _addResidentToHouse(
    BuildContext context,
    WidgetRef ref,
    String residentId,
    HouseModel house,
  ) async {
    final viewModel = ref.watch<ResidentHouseViewModel>(
      residentHouseViewModelProvider.notifier,
    );
    try {
      await viewModel.createResidentHouse(
        rtId: house.rtId,
        resident: ResidentHouseRequestModel(
          residentId: residentId,
          houseId: houseId,
          isPrimary: false,
        ),
      );
      ref.invalidate(listPenghuniProvider(houseId));
      Navigator.pop(context);
    } catch (e) {
      ref.invalidate(listPenghuniProvider(houseId));
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final houseAsync = ref.watch(houseDetailProvider(houseId));
    final residentHouseViewModel = ref.watch(
      residentHouseViewModelProvider.notifier,
    );
    final penghuniAsync = ref.watch(
      listPenghuniProvider(houseId),
    ); // Tambahkan ini

    // error fetch rumah
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

    // error memambahkan penghuni
    final errorPenguhuni =
        ref.watch<ResidentHouseState>(residentHouseViewModelProvider).error;
    if (errorPenguhuni != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: Theme.of(context).colorScheme.error,
            content: Text(errorPenguhuni),
            duration: const Duration(seconds: 4),
          ),
        );
        // Clear error setelah ditampilkan
        residentHouseViewModel.resetError();
        ref.invalidate(residentHouseViewModelProvider);
      });
    }

    // Status Aksi
    // final success = ref.watch(residentHouseViewModelProvider).isSuccess;
    // if (success != null) {
    //   WidgetsBinding.instance.addPostFrameCallback((_) {
    //     if (success) {
    //       ScaffoldMessenger.of(context).showSnackBar(
    //         const SnackBar(
    //           behavior: SnackBarBehavior.floating,
    //           content: Text('Berhasil'),
    //           duration: Duration(seconds: 2),
    //         ),
    //       );
    //     } else {
    //       ScaffoldMessenger.of(context).showSnackBar(
    //         SnackBar(
    //           behavior: SnackBarBehavior.floating,
    //           backgroundColor: Theme.of(context).colorScheme.error,
    //           content: Text('Gagal'),
    //           duration: Duration(seconds: 2),
    //         ),
    //       );
    //     }
    //     residentHouseViewModel.resetSuccess();
    //     ref.invalidate(residentHouseViewModelProvider);
    //     ref.invalidate(listPenghuniProvider(houseId));
    //   });
    // }

    Future<void> showDeleteConfirmationDialog({
      required BuildContext context,
      required WidgetRef ref,
      required ResidentHouseModel resident,
      required String houseId,
    }) async {
      final residentHouseViewModel = ref.read(
        residentHouseViewModelProvider.notifier,
      );

      return showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Hapus Penghuni'),
            content: Text(
              'Apakah Anda yakin ingin menghapus ${resident.resident?.name ?? 'penghuni ini'}?',
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Batal'),
                onPressed: () => Navigator.of(context).pop(),
              ),
              TextButton(
                child: const Text('Hapus', style: TextStyle(color: Colors.red)),
                onPressed: () async {
                  try {
                    await residentHouseViewModel.deleteResidentHouse(
                      resident.id,
                    );
                    ref.invalidate(listPenghuniProvider(houseId));
                    Navigator.of(context).pop(); // Close dialog
                  } catch (e) {
                    debugPrint(e.toString());
                    Navigator.of(context).pop(); // Close dialog
                  }
                },
              ),
            ],
          );
        },
      );
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
                  if (house != null &&
                      house.latitude != 0.0 &&
                      house.longitude != 0.0)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16),
                        const Text(
                          'Lokasi Rumah di Peta',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          height: 250,
                          child: Stack(
                            children: [
                              FlutterMap(
                                options: MapOptions(
                                  initialCenter: LatLng(
                                    house.latitude!,
                                    house.longitude!,
                                  ),
                                  initialZoom: 16,
                                ),
                                children: [
                                  TileLayer(
                                    urlTemplate:
                                        'https://mt0.google.com/vt/lyrs=r&hl=en&x={x}&y={y}&z={z}',
                                    subdomains: const ['a', 'b', 'c'],
                                    userAgentPackageName: 'com.example.app',
                                  ),
                                  MarkerLayer(
                                    markers: [
                                      Marker(
                                        point: LatLng(
                                          house.latitude!,
                                          house.longitude!,
                                        ),
                                        width: 40,
                                        height: 40,
                                        child: Icon(
                                          Icons.location_pin,
                                          color: Colors.red,
                                          size: 40,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Positioned(
                                top: 8,
                                right: 8,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.fullscreen,
                                    color: Theme.of(context).colorScheme.error,
                                  ),
                                  onPressed:
                                      () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder:
                                              (context) => FullScreenMap(
                                                location: LatLng(
                                                  house.latitude!,
                                                  house.longitude!,
                                                ),
                                                title: 'Lokasi Rumah',
                                              ),
                                        ),
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  _buildDetailCard(
                    isPenghuni: false,
                    ref: ref,
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
                    isPenghuni: true,
                    ref: ref,
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
                                    trailing: IconButton(
                                      onPressed:
                                          () => showDeleteConfirmationDialog(
                                            context: context,
                                            ref: ref,
                                            resident: resident,
                                            houseId: houseId,
                                          ),
                                      icon: Icon(
                                        Icons.cancel,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                      ),
                    ],
                  ),
                  SizedBox(height: 100),
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
        onPressed: () {
          _showResidentPicker(context, ref);
        },
      ),
    );
  }

  Widget _buildDetailCard({
    required String title,
    required bool isPenghuni,
    required List<Widget> children,
    required WidgetRef ref,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                if (isPenghuni)
                  IconButton(
                    icon: const Icon(Icons.refresh),
                    onPressed: () {
                      final _ = ref.refresh(listPenghuniProvider(houseId));
                    },
                  ),
              ],
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

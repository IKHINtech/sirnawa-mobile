import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:sirnawa_mobile/config/app_providers.dart';
import 'package:sirnawa_mobile/data/services/api/model/ronda_schedule/ronda_schedule_request_model.dart';
import 'package:sirnawa_mobile/domain/model/ronda_schedule/ronda_schedule_model.dart';
import 'package:sirnawa_mobile/ui/admin/ronda_schedule/widgets/ronda_schedule_item.dart';
import 'package:sirnawa_mobile/ui/core/ui/custom_appbar.dart';

class RondaScheduleScreen extends ConsumerWidget {
  const RondaScheduleScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rondaSchedulesAsync = ref.watch(rondaSchedulePaginationProvider);
    final rtId = ref.watch(
      homeViewModelProvider.select((s) => s.userRtModel?.rtId ?? ""),
    );

    final role = ref.watch(homeViewModelProvider).userRtModel;

    ref.read(rondaGroupViewModelProvider.notifier);

    return Scaffold(
      appBar: CustomAppBar(title: 'Jadwal Ronda'),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(rondaSchedulePaginationProvider);
        },
        child: rondaSchedulesAsync.when(
          loading:
              () => Center(
                child: SizedBox(
                  height: 140,
                  width: 140,
                  child: Lottie.asset('assets/loading_my_rt.json'),
                ),
              ),
          error: (error, _) => Center(child: Text('Error: $error')),
          data: (schedules) => _buildScheduleList(schedules, ref, context),
        ),
      ),
      floatingActionButton:
          role?.role == 'warga'
              ? null
              : FloatingActionButton.extended(
                onPressed:
                    () => _showAddOrEditScheduleDialog(context, ref, rtId),
                label: Text("Tambah Jadwal"),
                icon: Icon(Icons.add),
              ),
    );
  }

  Widget _buildScheduleList(
    List<RondaScheduleModel> schedules,
    WidgetRef ref,
    BuildContext context,
  ) {
    if (schedules.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.date_range, size: 48, color: Colors.grey),
            const SizedBox(height: 16),
            Text(
              'Tidak ada data Jadwal Ronda',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'Silakan tambahkan jadwal ronda terlebih dahulu',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      );
    }

    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemCount: schedules.length + 1,
      itemBuilder: (context, index) {
        if (index < schedules.length) {
          final schedule = schedules[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: _buildScheduleCardSliable(schedule, ref, context),
          );
        } else {
          final notifier = ref.read(rondaSchedulePaginationProvider.notifier);
          if (notifier.hasMore && !notifier.isLoading) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              notifier.loadMore();
            });
          }
          return notifier.hasMore
              ? const Padding(
                padding: EdgeInsets.all(16.0),
                child: Center(child: CircularProgressIndicator()),
              )
              : const SizedBox();
        }
      },
    );
  }

  Widget _buildScheduleCardSliable(
    RondaScheduleModel schedule,
    WidgetRef ref,
    BuildContext context,
  ) {
    final role = ref.watch(homeViewModelProvider).userRtModel;
    return role?.role == 'warga'
        ? RondaScheduleItem(schedule: schedule)
        : Slidable(
          key: ValueKey(schedule.id),
          // Tambahkan end action pane (slide dari kanan ke kiri)
          endActionPane: ActionPane(
            motion:
                const DrawerMotion(), // Ganti dengan DrawerMotion untuk efek lebih baik
            children: [
              // Tombol Edit
              SlidableAction(
                onPressed:
                    (context) => _showAddOrEditScheduleDialog(
                      context,
                      ref,
                      schedule.rtId,
                      existingSchedule: schedule,
                    ),
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                icon: Icons.edit,
                label: 'Edit',
              ),
              // Tombol Hapus
              SlidableAction(
                onPressed:
                    (context) => _deleteSchedule(context, ref, schedule.id),
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Hapus',
              ),
            ],
          ),
          child: RondaScheduleItem(schedule: schedule),
        );
  }

  // Helper widget untuk baris informasi

  // Fungsi untuk handle edit
  void _editSchedule(
    BuildContext context,
    WidgetRef ref,
    RondaScheduleModel schedule,
  ) {
    // Implementasi logika edit di sini
    // Contoh: navigasi ke halaman edit
    // Navigator.push(context, MaterialPageRoute(builder: (context) => EditSchedulePage(schedule: schedule)));
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Edit jadwal ${schedule.id}')));
  }

  // Fungsi untuk handle hapus
  void _deleteSchedule(BuildContext context, WidgetRef ref, String scheduleId) {
    showDialog(
      context: context,
      builder:
          (context) => Consumer(
            builder: (context, ref, _) {
              final state = ref.watch(rondaScheduleViewModelProvider);
              return AlertDialog(
                title: const Text('Hapus Jadwal'),
                content: const Text(
                  'Apakah Anda yakin ingin menghapus jadwal ini?',
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Batal'),
                  ),
                  TextButton(
                    onPressed:
                        state.isLoading
                            ? null
                            : () {
                              ref
                                  .read(rondaScheduleViewModelProvider.notifier)
                                  .deleteRondaSchedule(scheduleId)
                                  .then((_) {
                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: Colors.green,
                                        behavior: SnackBarBehavior.floating,
                                        content: Text('Jadwal  dihapus'),
                                      ),
                                    );
                                    ref.invalidate(
                                      rondaSchedulePaginationProvider,
                                    );
                                  })
                                  .catchError((err) {
                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: Colors.red,
                                        behavior: SnackBarBehavior.floating,
                                        content: Text('Jadwal gagal dihapus'),
                                      ),
                                    );
                                  });
                            },
                    child:
                        state.isLoading
                            ? SizedBox(
                              height: 20,
                              width: 20,
                              child: const CircularProgressIndicator(
                                strokeWidth: 2,
                              ),
                            )
                            : const Text(
                              'Hapus',
                              style: TextStyle(color: Colors.red),
                            ),
                  ),
                ],
              );
            },
          ),
    );
  }

  void _showAddOrEditScheduleDialog(
    BuildContext context,
    WidgetRef ref,
    String rtId, {
    RondaScheduleModel? existingSchedule,
  }) {
    final dateController = TextEditingController(
      text:
          existingSchedule != null
              ? DateFormat('yyyy-MM-dd').format(existingSchedule.date.toLocal())
              : '',
    );
    final groupController = TextEditingController(
      text: existingSchedule?.group?.name ?? '',
    );
    String? selectedGroupId = existingSchedule?.group?.id;

    final groupState = ref.watch(rondaGroupViewModelProvider);

    showDialog(
      context: context,
      builder:
          (context) => Consumer(
            builder: (context, ref, _) {
              final state = ref.watch(rondaScheduleViewModelProvider);
              final provider = ref.watch(
                rondaScheduleViewModelProvider.notifier,
              );

              return AlertDialog(
                title: Text(
                  existingSchedule == null
                      ? 'Tambah Jadwal Ronda'
                      : 'Edit Jadwal Ronda',
                ),
                content: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: dateController,
                        decoration: const InputDecoration(
                          labelText: 'Tanggal',
                          suffixIcon: Icon(Icons.calendar_today),
                        ),
                        readOnly: true,
                        onTap: () async {
                          final selectedDate = await showDatePicker(
                            context: context,
                            locale: const Locale('id', 'ID'),
                            initialDate:
                                existingSchedule?.date.toLocal() ??
                                DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime.now().add(
                              const Duration(days: 365),
                            ),
                          );
                          if (selectedDate != null) {
                            dateController.text = DateFormat(
                              'yyyy-MM-dd',
                            ).format(selectedDate);
                          }
                        },
                      ),
                      const SizedBox(height: 16),
                      if (groupState.isLoading)
                        const CircularProgressIndicator(),

                      if (groupState.error != null)
                        Text('Error: ${groupState.error}'),

                      if (groupState.list.isNotEmpty)
                        DropdownButtonFormField<String>(
                          value: selectedGroupId,
                          decoration: const InputDecoration(
                            labelText: 'Kelompok Ronda',
                          ),
                          items:
                              groupState.list.map((group) {
                                return DropdownMenuItem(
                                  value: group.id,
                                  child: Text(group.name),
                                );
                              }).toList(),
                          onChanged: (value) {
                            selectedGroupId = value;
                            final selectedGroup = groupState.list.firstWhere(
                              (g) => g.id == value,
                            );
                            groupController.text = selectedGroup.name;
                          },
                        ),
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Batal'),
                  ),
                  TextButton(
                    onPressed:
                        state.isLoading
                            ? null
                            : () {
                              if (dateController.text.isEmpty ||
                                  selectedGroupId == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Harap isi semua field'),
                                  ),
                                );
                                return;
                              }

                              final request = RondaScheduleRequestModel(
                                date:
                                    DateFormat('yyyy-MM-dd')
                                        .parse(dateController.text)
                                        .toUtc()
                                        .toIso8601String(),
                                rtId: rtId,
                                groupId: selectedGroupId!,
                              );

                              final future =
                                  existingSchedule == null
                                      ? provider.createRondaSchedule(request)
                                      : provider.updateRondaSchedule(
                                        existingSchedule.id,
                                        request,
                                      );

                              future
                                  .then((_) {
                                    Navigator.pop(context);
                                    ref.invalidate(
                                      rondaSchedulePaginationProvider,
                                    );
                                  })
                                  .catchError((error) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Gagal menyimpan jadwal: $error',
                                        ),
                                      ),
                                    );
                                  });
                            },
                    child:
                        state.isLoading
                            ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                            : Text(
                              existingSchedule == null ? 'Simpan' : 'Perbarui',
                            ),
                  ),
                ],
              );
            },
          ),
    );
  }

  void _showAddScheduleDialog(
    BuildContext context,
    WidgetRef ref,
    String rtId,
  ) {
    final dateController = TextEditingController();
    final groupController = TextEditingController();
    String? selectedGroupId;
    final groupState = ref.watch(rondaGroupViewModelProvider);

    showDialog(
      context: context,
      builder:
          (context) => Consumer(
            builder: (context, ref, _) {
              final state = ref.watch(rondaScheduleViewModelProvider);
              final provider = ref.watch(
                rondaScheduleViewModelProvider.notifier,
              );
              return AlertDialog(
                title: const Text('Tambah Jadwal Ronda'),
                content: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: dateController,
                        decoration: const InputDecoration(
                          labelText: 'Tanggal',
                          suffixIcon: Icon(Icons.calendar_today),
                        ),
                        readOnly: true,
                        onTap: () async {
                          final selectedDate = await showDatePicker(
                            context: context,
                            locale: const Locale('id', 'ID'),
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime.now().add(
                              const Duration(days: 365),
                            ),
                          );
                          if (selectedDate != null) {
                            dateController.text = DateFormat(
                              'yyyy-MM-dd',
                            ).format(selectedDate);
                          }
                        },
                      ),
                      const SizedBox(height: 16),
                      if (groupState.isLoading) CircularProgressIndicator(),

                      if (groupState.error != null)
                        Text('Error: ${groupState.error}'),

                      if (groupState.list.isNotEmpty)
                        DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                            labelText: 'Kelompok Ronda',
                          ),
                          items:
                              groupState.list.map((group) {
                                return DropdownMenuItem(
                                  value: group.id,
                                  child: Text(group.name),
                                );
                              }).toList(),
                          onChanged: (value) {
                            selectedGroupId = value;
                            final selectedGroup = groupState.list.firstWhere(
                              (g) => g.id == value,
                            );
                            groupController.text = selectedGroup.name;
                          },
                        ),
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Batal'),
                  ),
                  TextButton(
                    onPressed:
                        state.isLoading
                            ? null
                            : () {
                              if (dateController.text.isEmpty ||
                                  selectedGroupId == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Harap isi semua field'),
                                  ),
                                );
                                return;
                              }
                              final request = RondaScheduleRequestModel(
                                date:
                                    DateFormat('yyyy-MM-dd')
                                        .parse(dateController.text)
                                        .toUtc()
                                        .toIso8601String(),
                                rtId: rtId,
                                groupId: selectedGroupId!,
                              );
                              provider
                                  .createRondaSchedule(request)
                                  .then((_) {
                                    Navigator.pop(context);
                                    ref.invalidate(
                                      rondaSchedulePaginationProvider,
                                    );
                                  })
                                  .catchError((error) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Gagal menambah jadwal: $error',
                                        ),
                                      ),
                                    );
                                  });
                            },
                    child:
                        state.isLoading
                            ? SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                            : const Text('Simpan'),
                  ),
                ],
              );
            },
          ),
    );
  }
}

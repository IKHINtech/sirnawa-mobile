import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:sirnawa_mobile/config/app_providers.dart';
import 'package:sirnawa_mobile/data/services/api/model/ronda_schedule/ronda_schedule_request_model.dart';
import 'package:sirnawa_mobile/domain/model/ronda_schedule/ronda_schedule_model.dart';
import 'package:sirnawa_mobile/ui/core/ui/custom_appbar.dart';

class RondaScheduleScreen extends ConsumerWidget {
  const RondaScheduleScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rondaSchedulesAsync = ref.watch(rondaSchedulePaginationProvider);
    final rtId = ref.watch(
      homeViewModelProvider.select((s) => s.userRtModel?.rtId ?? ""),
    );

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
          data: (schedules) => _buildScheduleList(schedules, ref),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showAddScheduleDialog(context, ref, rtId),
        label: Text("Tambah Jadwal"),
        icon: Icon(Icons.add),
      ),
    );
  }

  Widget _buildScheduleList(List<RondaScheduleModel> schedules, WidgetRef ref) {
    if (schedules.isEmpty) {
      return const Center(child: Text('Belum ada jadwal ronda'));
    }

    return ListView.builder(
      itemCount: schedules.length,
      itemBuilder: (context, index) {
        final schedule = schedules[index];
        return _buildScheduleCard(schedule, ref, context);
      },
    );
  }

  Widget _buildScheduleCard(
    RondaScheduleModel schedule,
    WidgetRef ref,
    BuildContext context,
  ) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: () => _showScheduleDetail(context, ref, schedule.id),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat(
                  'EEEE, d MMMM y',
                  'id_ID',
                ).format(schedule.date.toLocal()),
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              if (schedule.group != null) ...[
                Text(
                  'Kelompok: ${schedule.group!.name}',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  'Anggota: ${schedule.group!.totalMembers ?? schedule.group!.rondaGroupMembers?.length ?? 0} orang',
                ),
              ],
              if (schedule.rt != null) Text('RT: ${schedule.rt!.name}'),
            ],
          ),
        ),
      ),
    );
  }

  void _showScheduleDetail(
    BuildContext context,
    WidgetRef ref,
    String scheduleId,
  ) {
    showDialog(
      context: context,
      builder:
          (context) => Consumer(
            builder: (context, ref, _) {
              final scheduleAsync = ref.watch(
                rondaScheduleDetailProvider(scheduleId),
              );
              return Dialog(
                insetPadding: const EdgeInsets.all(16),
                child: scheduleAsync.when(
                  loading:
                      () => Padding(
                        padding: EdgeInsets.all(32),
                        child: SizedBox(
                          width: 80,
                          height: 80,
                          child: Lottie.asset('assets/loading_my_rt.json'),
                        ),
                      ),
                  error:
                      (error, _) => Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Error: $error'),
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Tutup'),
                            ),
                          ],
                        ),
                      ),
                  data:
                      (schedule) =>
                          _buildScheduleDetailDialog(schedule, context),
                ),
              );
            },
          ),
    );
  }

  Widget _buildScheduleDetailDialog(
    RondaScheduleModel? schedule,
    BuildContext context,
  ) {
    if (schedule == null) {
      return const Padding(
        padding: EdgeInsets.all(16),
        child: Text('Data jadwal tidak ditemukan'),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Detail Jadwal Ronda',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          _buildDetailRow(
            'Tanggal',
            DateFormat(
              'EEEE, d MMMM y',
              'id_ID',
            ).format(schedule.date.toLocal()),
          ),
          _buildDetailRow('Kelompok Ronda', schedule.group?.name ?? '-'),
          _buildDetailRow('RT', schedule.rt?.name ?? '-'),
          if (schedule.group?.rondaGroupMembers != null) ...[
            const SizedBox(height: 16),
            Text(
              'Anggota Kelompok:',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            ...schedule.group!.rondaGroupMembers!.map(
              (member) => ListTile(
                leading: const CircleAvatar(child: Icon(Icons.person)),
                title: Text(member.resident?.name ?? 'Anggota tidak diketahui'),
                subtitle: Text(member.house?.number ?? 'Rumah tidak diketahui'),
              ),
            ),
          ],
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Tutup'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
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
          const SizedBox(width: 8),
          Expanded(child: Text(value)),
        ],
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

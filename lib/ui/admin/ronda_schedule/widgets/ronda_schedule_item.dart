import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:sirnawa_mobile/config/app_providers.dart';
import 'package:sirnawa_mobile/domain/model/ronda_schedule/ronda_schedule_model.dart';

class RondaScheduleItem extends ConsumerWidget {
  final RondaScheduleModel schedule;
  const RondaScheduleItem({super.key, required this.schedule});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget buildDetailRow(String label, String value) {
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

    Widget buildScheduleDetailDialog(
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
            buildDetailRow(
              'Tanggal',
              DateFormat(
                'EEEE, d MMMM y',
                'id_ID',
              ).format(schedule.date.toLocal()),
            ),
            buildDetailRow('Kelompok Ronda', schedule.group?.name ?? '-'),
            buildDetailRow('RT', schedule.rt?.name ?? '-'),
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
                  title: Text(
                    member.resident?.name ?? 'Anggota tidak diketahui',
                  ),
                  subtitle: Text(
                    member.house?.number ?? 'Rumah tidak diketahui',
                  ),
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

    void showScheduleDetail(
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
                            buildScheduleDetailDialog(schedule, context),
                  ),
                );
              },
            ),
      );
    }

    Widget buildInfoRow({
      required IconData icon,
      required String label,
      required String value,
      required BuildContext context,
    }) {
      return Row(
        children: [
          Icon(icon, size: 18, color: Colors.blue[300]),
          const SizedBox(width: 8),
          Text(
            '$label: ',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
              color: Colors.grey[800],
            ),
          ),
        ],
      );
    }

    return SizedBox(
      width: double.infinity,
      child: Card(
        margin: EdgeInsets.zero, // Pastikan margin Card 0
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // Border radius untuk Card
        ),
        child: InkWell(
          onTap: () => showScheduleDetail(context, ref, schedule.id),
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.1),
                  spreadRadius: 2,
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header dengan tanggal dan icon
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      DateFormat(
                        'EEEE, d MMMM y',
                        'id_ID',
                      ).format(schedule.date.toLocal()),
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[800],
                      ),
                    ),
                    Icon(
                      Icons.calendar_today_rounded,
                      color: Colors.blue[300],
                      size: 20,
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                // Garis pemisah dekoratif
                Container(
                  height: 1,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.grey[200]!,
                        Colors.blue[100]!,
                        Colors.grey[200]!,
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Informasi kelompok
                if (schedule.group != null) ...[
                  buildInfoRow(
                    icon: Icons.group_rounded,
                    label: 'Kelompok',
                    value: schedule.group!.name,
                    context: context,
                  ),

                  const SizedBox(height: 8),

                  buildInfoRow(
                    icon: Icons.people_alt_rounded,
                    label: 'Anggota',
                    value:
                        '${schedule.group!.totalMembers ?? schedule.group!.rondaGroupMembers?.length ?? 0} orang',
                    context: context,
                  ),

                  const SizedBox(height: 8),
                ],

                // Informasi RT
                if (schedule.rt != null)
                  buildInfoRow(
                    icon: Icons.home_work_rounded,
                    label: 'RT',
                    value: schedule.rt!.name,
                    context: context,
                  ),

                // Badge status (opsional)
                if (schedule.date.isBefore(DateTime.now()))
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green[50],
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.green[200]!),
                      ),
                      child: Text(
                        'Selesai',
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: Colors.green[800],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

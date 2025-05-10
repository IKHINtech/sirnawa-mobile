import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sirnawa_mobile/config/app_providers.dart';
import 'package:sirnawa_mobile/domain/model/ronda_group/ronda_group_model.dart';
import 'package:sirnawa_mobile/domain/model/ronda_group_member/ronda_group_member_model.dart';
import 'package:sirnawa_mobile/ui/admin/ronda_group/widgets/ronda_group_member_dialog.dart';
import 'package:sirnawa_mobile/ui/core/ui/custom_appbar.dart';

class RondaGroupDetailScreen extends ConsumerWidget {
  final String rondaGroupId;
  const RondaGroupDetailScreen({super.key, required this.rondaGroupId});

  Future<void> showDeleteConfirmationDialog({
    required BuildContext context,
    required WidgetRef ref,
    required RondaGroupMemberModel member,
  }) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Consumer(
          builder: (context, ref, _) {
            final provider = ref.watch(
              rondaGroupMemberViewModelProvider.notifier,
            );
            final state = ref.watch(rondaGroupMemberViewModelProvider);
            return AlertDialog(
              title: const Text('Hapus Anggota'),
              content: Text(
                'Apakah Anda yakin ingin menghapus ${member.resident?.name ?? 'anggota ini'}?',
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Batal'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                TextButton(
                  onPressed:
                      state.isLoading
                          ? null
                          : () async {
                            try {
                              await provider.deleteRondaGroupMember(member.id);
                              ref.invalidate(
                                rondaGroupDetailProvider(rondaGroupId),
                              );
                              Navigator.of(context).pop(); // Close dialog
                            } catch (e) {
                              debugPrint(e.toString());
                              Navigator.of(context).pop(); // Close dialog
                            }
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
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rondaGroupAsync = ref.watch(rondaGroupDetailProvider(rondaGroupId));
    return Scaffold(
      appBar: CustomAppBar(title: "Ronda Group Detail"),
      body: rondaGroupAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error:
            (err, stack) =>
                Center(child: Text(err.toString() + stack.toString())),
        data:
            (rondaGroup) => SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildGroupInfoSection(context, rondaGroup!),
                  const SizedBox(height: 24),
                  _buildMembersSection(rondaGroup, context, ref),
                ],
              ),
            ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Tambah Anggota'),
        onPressed: () => _showAddMemberDialog(context, ref, rondaGroupId),
        icon: const Icon(Icons.add),
      ),
    );
  }

  void _showAddMemberDialog(
    BuildContext context,
    WidgetRef ref,
    String rondaGroupId,
  ) {
    showDialog(
      context: context,
      builder: (context) => AddMemberDialog(rondaGroupId: rondaGroupId),
    );
  }

  Widget _buildGroupInfoSection(
    BuildContext context,
    RondaGroupModel rondaGroup,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Informasi Group',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _buildInfoRow('Nama Group', rondaGroup.name),
            _buildInfoRow('RT', rondaGroup.rt?.name ?? ""),
            _buildInfoRow('Dibuat', _formatDate(rondaGroup.createdAt)),
            _buildInfoRow('Terakhir diubah', _formatDate(rondaGroup.updatedAt)),
          ],
        ),
      ),
    );
  }

  Widget _buildMembersSection(
    RondaGroupModel rondaGroup,
    BuildContext context,
    WidgetRef ref,
  ) {
    final members = rondaGroup.rondaGroupMembers ?? [];

    if (members.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.group_off, size: 60, color: Colors.grey),
            Text(
              'Belum ada anggota di grup ini',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Anggota (${members.length})',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Divider(),
            if (members.isEmpty)
              const Text('Belum ada anggota di grup ini')
            else
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: members.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  final member = members[index];
                  return _buildMemberTile(member, context, ref);
                },
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildMemberTile(
    RondaGroupMemberModel member,
    BuildContext context,
    WidgetRef ref,
  ) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        child: Text(member.resident?.name.substring(0, 1) ?? '?'),
      ),
      title: Text(
        member.resident?.name ?? 'Unknown Resident',
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      trailing: IconButton(
        onPressed:
            () => showDeleteConfirmationDialog(
              context: context,
              ref: ref,
              member: member,
            ),
        icon: Icon(Icons.delete_forever, color: Colors.red),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (member.house != null)
            Text('Nomor Rumah: ${member.house!.number}'),
          if (member.resident != null)
            Text('Phone: ${member.resident!.phoneNumber}'),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
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

  String _formatDate(DateTime date) {
    return DateFormat('dd MMM yyyy, HH:mm').format(date);
  }
}

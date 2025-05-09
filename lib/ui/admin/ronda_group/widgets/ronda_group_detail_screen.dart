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
                  _buildMembersSection(rondaGroup, context),
                ],
              ),
            ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddMemberDialog(context, ref, rondaGroupId),
        child: const Icon(Icons.add),
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
              'Group Information',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _buildInfoRow('Nama Group', rondaGroup.name),
            _buildInfoRow('Created', _formatDate(rondaGroup.createdAt)),
            _buildInfoRow('Last Updated', _formatDate(rondaGroup.updatedAt)),
            _buildInfoRow('RT ID', rondaGroup.rtId),
          ],
        ),
      ),
    );
  }

  Widget _buildMembersSection(
    RondaGroupModel rondaGroup,
    BuildContext context,
  ) {
    final members = rondaGroup.rondaGroupMembers ?? [];

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Members (${members.length})',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            if (members.isEmpty)
              const Text('No members in this group yet.')
            else
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: members.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  final member = members[index];
                  return _buildMemberTile(member);
                },
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildMemberTile(RondaGroupMemberModel member) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        child: Text(member.resident?.name.substring(0, 1) ?? '?'),
      ),
      title: Text(
        member.resident?.name ?? 'Unknown Resident',
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (member.house != null) Text('House: ${member.house!.number}'),
          if (member.resident != null)
            Text('Phone: ${member.resident!.phoneNumber}'),
        ],
      ),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        // Navigate to member detail if needed
      },
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

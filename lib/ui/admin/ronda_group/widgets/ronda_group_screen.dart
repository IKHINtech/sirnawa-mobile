import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sirnawa_mobile/config/ronda_group_providers.dart';
import 'package:sirnawa_mobile/routing/routes.dart';
import 'package:sirnawa_mobile/ui/core/ui/custom_appbar.dart';
import 'package:sirnawa_mobile/ui/core/ui/lottie_loading.dart';

class GroupRondaScreen extends ConsumerStatefulWidget {
  const GroupRondaScreen({super.key});

  @override
  ConsumerState<GroupRondaScreen> createState() => _GroupRondaScreenState();
}

class _GroupRondaScreenState extends ConsumerState<GroupRondaScreen> {
  @override
  Widget build(BuildContext context) {
    final rondaGroupPaginationState = ref.watch(rondaGroupPaginationProvider);
    return Scaffold(
      appBar: CustomAppBar(title: 'Kelola Grup Ronda'),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Tambah Grup Ronda'),
        onPressed: () {
          context.push(Routes.adminRondaGroupCreate);
        },
        icon: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: RefreshIndicator(
                onRefresh:
                    () =>
                        ref
                            .read(rondaGroupPaginationProvider.notifier)
                            .refresh(),
                child: rondaGroupPaginationState.when(
                  data: (rondaGroups) {
                    if (rondaGroups.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.group_off,
                              size: 48,
                              color: Colors.grey,
                            ),
                            Text(
                              "Tidak ada Group Ronda",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Silakan tambahkan Group Ronda',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      );
                    } else {
                      return ListView.separated(
                        separatorBuilder:
                            (context, index) => const SizedBox(height: 6),
                        itemBuilder: (context, index) {
                          if (index < rondaGroups.length) {
                            final rondaGroup = rondaGroups[index];
                            return Card(
                              child: ListTile(
                                onTap: () {
                                  context.push(
                                    "${Routes.adminRondaGroup}/${rondaGroup.id}",
                                  );
                                },
                                title: Text(
                                  "${rondaGroup.name} (${rondaGroup.rt?.name ?? ""})",
                                ),
                                subtitle: Text(
                                  "Total Anggota: ${rondaGroup.totalMembers ?? 0}",
                                ),
                                leading: Icon(Icons.security),
                                trailing: const Icon(Icons.chevron_right),
                              ),
                            );
                          } else {
                            final notifier = ref.read(
                              rondaGroupPaginationProvider.notifier,
                            );
                            if (notifier.hasMore && !notifier.isLoading) {
                              WidgetsBinding.instance.addPostFrameCallback((
                                timeStamp,
                              ) {
                                notifier.loadMore();
                              });
                            }
                            return notifier.hasMore
                                ? const Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                )
                                : const SizedBox();
                          }
                        },
                        itemCount: rondaGroups.length + 1,
                      );
                    }
                  },
                  error: (error, stack) => Center(child: Text("Error: $error")),
                  loading: () => MyRtLoading(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

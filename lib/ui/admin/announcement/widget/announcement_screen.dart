import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sirnawa_mobile/config/app_providers.dart';
import 'package:sirnawa_mobile/routing/routes.dart';
import 'package:sirnawa_mobile/ui/admin/announcement/widget/announcement_item.dart';
import 'package:sirnawa_mobile/ui/core/ui/custom_appbar.dart';

class AnnouncementScreen extends ConsumerStatefulWidget {
  const AnnouncementScreen({super.key});

  @override
  ConsumerState<AnnouncementScreen> createState() => _AnnouncementScreenState();
}

class _AnnouncementScreenState extends ConsumerState<AnnouncementScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        ref.read(announcementPaginationProvider.notifier).loadMore();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _onRefresh() async {
    await ref.read(announcementPaginationProvider.notifier).refresh();
  }

  @override
  Widget build(BuildContext context) {
    final announcementState = ref.watch(announcementPaginationProvider);

    return Scaffold(
      appBar: CustomAppBar(title: 'Announcements'),
      body: announcementState.when(
        loading: () => _buildShimmerList(),
        error: (err, stack) => Center(child: Text('Error: $err')),
        data:
            (announcements) => RefreshIndicator(
              onRefresh: _onRefresh,
              child: ListView.builder(
                controller: _scrollController,
                itemCount: announcements.length,
                itemBuilder: (context, index) {
                  final announcement = announcements[index];
                  return AnnouncementItem(announcement: announcement);
                },
              ),
            ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push(Routes.announcecmentCreate);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

Widget _buildShimmerList() {
  return ListView.builder(
    itemCount: 6, // Jumlah placeholder shimmer
    itemBuilder: (context, index) {
      return const AnnouncementItemShimmer();
    },
  );
}

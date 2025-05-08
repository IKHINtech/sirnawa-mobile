import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:sirnawa_mobile/config/app_providers.dart';
import 'package:sirnawa_mobile/domain/model/announcement/announcement_model.dart';
import 'package:sirnawa_mobile/routing/routes.dart';
import 'package:sirnawa_mobile/ui/core/ui/custom_elevated_button.dart';
import 'package:sirnawa_mobile/ui/core/ui/shimmer_box.dart';

class AnnouncementPreview extends ConsumerWidget {
  const AnnouncementPreview({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final announcementState = ref.watch(announcementPaginationProvider);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Theme.of(context).colorScheme.surface,
      ),
      child: announcementState.when(
        loading: () => _buildLoadingPreview(context),
        error: (err, stack) => _buildErrorPreview(context, err, ref),
        data: (announcements) => _buildPreviewContent(context, announcements),
      ),
    );
  }

  Widget _buildPreviewContent(
    BuildContext context,
    List<AnnouncementModel> announcements,
  ) {
    final latestAnnouncement =
        announcements.isNotEmpty ? announcements.first : null;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Pengumuman",
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Icon(LucideIcons.bell, color: Theme.of(context).colorScheme.error),
          ],
        ),
        const SizedBox(height: 10),
        if (latestAnnouncement != null)
          GestureDetector(
            onTap: () {
              context.push(
                Routes.announcementDetail,
                extra: latestAnnouncement,
              );
            },
            child: Card.outlined(
              child: ListTile(
                title: Text(latestAnnouncement.title),
                subtitle: Text(
                  latestAnnouncement.content,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: const Icon(Icons.info, color: Colors.blue),
              ),
            ),
          )
        else
          const Card.outlined(
            child: ListTile(
              title: Text("Tidak ada pengumuman"),
              subtitle: Text("Belum ada pengumuman terbaru"),
            ),
          ),
        CustomElevatedButton(
          title: "Lihat Pengumuman Lain",
          onPressed: () {
            context.push(Routes.announcement);
          },
        ),
      ],
    );
  }

  Widget _buildLoadingPreview(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ShimmerBox(width: 120, height: 24, borderRadius: 4),
            ShimmerBox.circular(width: 24, height: 24),
          ],
        ),
        const SizedBox(height: 10),
        const Card.outlined(
          child: ListTile(
            title: ShimmerBox(width: 180, height: 16),
            subtitle: ShimmerBox(width: double.infinity, height: 14),
            trailing: ShimmerBox.circular(width: 24, height: 24),
          ),
        ),
        const SizedBox(height: 10),
        ShimmerBox(width: double.infinity, height: 48, borderRadius: 8),
      ],
    );
  }

  Widget _buildErrorPreview(BuildContext context, Object error, WidgetRef ref) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Pengumuman",
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Icon(LucideIcons.bell, color: Theme.of(context).colorScheme.error),
          ],
        ),
        const SizedBox(height: 10),
        Card.outlined(
          color: Theme.of(context).colorScheme.errorContainer,
          child: ListTile(
            title: Text("Gagal memuat pengumuman"),
            subtitle: Text(error.toString()),
            trailing: Icon(
              Icons.error,
              color: Theme.of(context).colorScheme.error,
            ),
          ),
        ),
        CustomElevatedButton(
          title: "Coba Lagi",
          onPressed: () {
            final _ = ref.refresh(announcementPaginationProvider);
          },
        ),
      ],
    );
  }
}

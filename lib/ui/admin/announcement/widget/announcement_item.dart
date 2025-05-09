import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart' as intl;
import 'package:sirnawa_mobile/config/app_providers.dart';
import 'package:sirnawa_mobile/domain/model/announcement/announcement_model.dart';
import 'package:sirnawa_mobile/routing/routes.dart';
import 'package:sirnawa_mobile/ui/core/ui/shimmer_box.dart';
import 'package:sirnawa_mobile/ui/home/view_models/home_viewmodel.dart';

class AnnouncementItem extends ConsumerWidget {
  final AnnouncementModel announcement;
  final VoidCallback? onDelete;
  const AnnouncementItem({
    super.key,
    required this.announcement,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context, ref) {
    final currentUserId =
        ref.read<HomeState>(homeViewModelProvider).user?.id ?? '';
    final isAdmin =
        ref.read<HomeState>(homeViewModelProvider).userRtModel?.role != 'admin';

    final isCreator = announcement.createdBy == currentUserId;
    final canDelete = isAdmin || isCreator;
    return GestureDetector(
      onTap: () => context.push(Routes.announcementDetail, extra: announcement),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Theme.of(
                        context,
                      ).primaryColor.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.announcement,
                      color: Theme.of(context).primaryColor,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      announcement.title,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800],
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (canDelete && onDelete != null)
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.red[400]),
                      onPressed: () => _showDeleteConfirmation(context),
                    ),
                ],
              ),
              const SizedBox(height: 12),

              // Attachments Section
              if (announcement.attachmentUrls.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'GAMBAR :',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: Colors.grey[500],
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children:
                            announcement.attachmentUrls.map((url) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) => FullScreenImage(
                                              imageUrl: url,
                                              heroTag: url,
                                            ),
                                      ),
                                    );
                                  },
                                  child: Hero(
                                    tag: url,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: CachedNetworkImage(
                                        imageUrl: url,
                                        width: 120,
                                        height: 120,
                                        fit: BoxFit.cover,
                                        placeholder:
                                            (context, url) => Container(
                                              width: 120,
                                              height: 120,
                                              color: Colors.grey[200],
                                              child: const Center(
                                                child:
                                                    CircularProgressIndicator(
                                                      strokeWidth: 2,
                                                    ),
                                              ),
                                            ),
                                        errorWidget:
                                            (context, url, error) => Container(
                                              width: 120,
                                              height: 120,
                                              color: Colors.grey[200],
                                              child: const Icon(
                                                Icons.broken_image,
                                                size: 40,
                                                color: Colors.grey,
                                              ),
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                      ),
                    ),
                  ],
                ),
              const SizedBox(height: 12),
              // Content with limited lines
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      announcement.content,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey[700],
                        height: 1.5,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (_needsReadMore(announcement.content, context))
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          onPressed:
                              () => context.push(
                                Routes.announcementDetail,
                                extra: announcement,
                              ),
                          child: Text(
                            'Read More',
                            style: Theme.of(
                              context,
                            ).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),

              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Tooltip(
                      message: announcement.createdBy,
                      child: Chip(
                        backgroundColor: Colors.blue[50],
                        label: Text(
                          'Diposting oleh: ${announcement.creator}',
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(color: Colors.blue[700]),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        avatar: const CircleAvatar(
                          radius: 12,
                          child: Icon(Icons.person, size: 14),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    _formatDate(announcement.createdAt),
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showDeleteConfirmation(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Hapus Pengumuman'),
            content: const Text(
              'Apakah Anda yakin ingin menghapus pengumuman ini?',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('Batal'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text('Hapus', style: TextStyle(color: Colors.red)),
              ),
            ],
          ),
    );

    if (confirmed == true && onDelete != null) {
      onDelete!(); // Call the delete callback
    }
  }

  bool _needsReadMore(String text, BuildContext context) {
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: Theme.of(context).textTheme.bodyMedium),
      maxLines: 3,
      textDirection: TextDirection.ltr as TextDirection?,
    )..layout(
      maxWidth: MediaQuery.of(context).size.width - 56,
    ); // Subtract padding

    return textPainter.didExceedMaxLines;
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays > 7) {
      return intl.DateFormat('MMM d, y').format(date);
    } else if (difference.inDays > 0) {
      return '${difference.inDays} days ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hours ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minutes ago';
    } else {
      return 'Just now';
    }
  }
}

// FullScreenImage widget for viewing attachments
class FullScreenImage extends StatelessWidget {
  final String imageUrl;
  final String heroTag;

  const FullScreenImage({
    super.key,
    required this.imageUrl,
    required this.heroTag,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Hero(
          tag: heroTag,
          child: InteractiveViewer(
            panEnabled: true,
            minScale: 0.5,
            maxScale: 3.0,
            child: CachedNetworkImage(imageUrl: imageUrl, fit: BoxFit.contain),
          ),
        ),
      ),
    );
  }
}

class AnnouncementItemShimmer extends StatelessWidget {
  const AnnouncementItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ShimmerBox.circular(
                  width: 40,
                  height: 40,
                  shape: BoxShape.circle,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShimmerBox(
                        width: double.infinity,
                        height: 16,
                        borderRadius: 4,
                      ),
                      const SizedBox(height: 6),
                      ShimmerBox(width: 200, height: 14, borderRadius: 4),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ShimmerBox(width: double.infinity, height: 60, borderRadius: 8),
            const SizedBox(height: 16),
            ShimmerBox(width: 100, height: 20, borderRadius: 4),
            const SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  3,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ShimmerBox(width: 120, height: 120, borderRadius: 8),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ShimmerBox(width: 120, height: 32, borderRadius: 16),
                ShimmerBox(width: 80, height: 14, borderRadius: 4),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

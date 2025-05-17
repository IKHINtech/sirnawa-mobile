import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:sirnawa_mobile/config/dashboard_mobile_providers.dart';
import 'package:sirnawa_mobile/domain/model/dashboard/dashboard_mobile_model.dart';
import 'package:sirnawa_mobile/domain/model/ipl_bill/ipl_bill_model.dart';
import 'package:sirnawa_mobile/routing/routes.dart';
import 'package:sirnawa_mobile/ui/core/ui/custom_elevated_button.dart';
import 'package:sirnawa_mobile/ui/core/ui/shimmer_box.dart';

class IplBillPreview extends ConsumerWidget {
  const IplBillPreview({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<DashboardMobileModel?> dashboarMobileState = ref
        .watch<AsyncValue<DashboardMobileModel?>>(dashboardMobileProvider);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Theme.of(context).colorScheme.surface,
      ),
      child: dashboarMobileState.when(
        loading: () => _buildLoadingPreview(context),
        error: (err, stack) => _buildErrorPreview(context, err, ref),
        data: (res) => _buildPreviewContent(context, res?.iplBill),
      ),
    );
  }

  Widget _buildPreviewContent(
    BuildContext context,
    IplBillModel? latestIplBill,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (latestIplBill != null) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Tagihan Saya",
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Icon(
                Icons.payments_rounded,
                color: Theme.of(context).colorScheme.primary,
              ),
            ],
          ),
          SizedBox(height: 3),
          Text(
            DateFormat('MMM yyyy', 'id_ID').format(DateTime.now()),
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: Theme.of(context).colorScheme.outline,
            ),
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              context.push(Routes.announcementDetail, extra: latestIplBill);
            },
            child: Card.outlined(
              child: ListTile(
                title: Text("Rp. ${latestIplBill.totalAmount}"),
                trailing: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green),
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                  ),
                  padding: EdgeInsets.all(8),
                  child:
                      latestIplBill.status == "paid"
                          ? Text(
                            "Sudah Bayar",
                            style: TextStyle(color: Colors.green),
                          )
                          : Text(
                            "Bayar",
                            style: TextStyle(color: Colors.green),
                          ),
                ),
              ),
            ),
          ),
        ],
        if (latestIplBill == null)
          const Card.outlined(
            child: ListTile(
              title: Text("Tidak ada tagihan"),
              subtitle: Text("Belum ada tagihan bulan ini"),
            ),
          ),
        CustomElevatedButton(
          title: "Lihat Semua Tagihan",
          onPressed: () {
            context.push(Routes.iplBill);
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
              "Jadwal Ronda",
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
            title: Text("Gagal memuat jadwal"),
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
            final _ = ref.invalidate(dashboardMobileProvider);
          },
        ),
      ],
    );
  }
}

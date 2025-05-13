import 'package:flutter/material.dart';
import 'package:sirnawa_mobile/ui/core/ui/shimmer_box.dart';

class RondaScheduleItemShimmer extends StatelessWidget {
  const RondaScheduleItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header shimmer
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ShimmerBox(width: 180, height: 24, borderRadius: 4),
                  ShimmerBox.circular(width: 20, height: 20),
                ],
              ),

              const SizedBox(height: 12),

              // Divider shimmer
              ShimmerBox(width: double.infinity, height: 1, borderRadius: 0),

              const SizedBox(height: 16),

              // Info rows shimmer
              Column(
                children: [
                  _buildShimmerInfoRow(context),
                  const SizedBox(height: 8),
                  _buildShimmerInfoRow(context),
                  const SizedBox(height: 8),
                  _buildShimmerInfoRow(context),
                ],
              ),

              const SizedBox(height: 16),

              // Status badge shimmer
              Align(
                alignment: Alignment.centerRight,
                child: ShimmerBox(width: 60, height: 20, borderRadius: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildShimmerInfoRow(BuildContext context) {
    return Row(
      children: [
        ShimmerBox.circular(width: 18, height: 18),
        const SizedBox(width: 8),
        ShimmerBox(width: 60, height: 16, borderRadius: 4),
        const SizedBox(width: 4),
        ShimmerBox(width: 100, height: 16, borderRadius: 4),
      ],
    );
  }
}

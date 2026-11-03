import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/locale_keys.g.dart';
import '../../../../core/constants/asset_path.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/extensions/due_date_status_extension.dart';
import '../../../../core/models/due_date_status.dart';
import '../../../../core/widgets/custom_card_widget.dart';
import '../../../../core/widgets/custom_icon_widget.dart';

class DetailStatusCard extends StatelessWidget {
  const DetailStatusCard({
    required this.startDate,
    required this.endDate,
    super.key,
  });

  final DateTime startDate;
  final DateTime endDate;

  @override
  Widget build(BuildContext context) {
    final colors = context.color;
    final status = DueDateStatus.calculate(endDate, startDate: startDate);
    final statusColor = status.color(colors);

    return CustomCardWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: 12,
            children: [
              Container(
                width: 44,
                height: 44,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: colors.border),
                ),
                child: CustomIconWidget(
                  path: AssetPath.watch,
                  size: 22,
                  color: statusColor,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 4,
                  children: [
                    Text(
                      context.tr(LocaleKeys.detail_remaining),
                      style: context.typo.size13(color: colors.textSecondary),
                    ),
                    Text(
                      status.label(context),
                      style: context.typo.size18(
                        color: statusColor,
                        weight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          LinearProgressIndicator(
            value: status.progress,
            minHeight: 5,
            borderRadius: BorderRadius.circular(4),
            color: statusColor,
            backgroundColor: colors.border,
            semanticsLabel: context.tr(LocaleKeys.detail_elapsed),
          ),
        ],
      ),
    );
  }
}

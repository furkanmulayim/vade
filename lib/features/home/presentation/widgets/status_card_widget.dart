import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/asset_path.dart';
import '../../../../core/constants/locale_keys.g.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/widgets/button_mini_primary.dart';
import '../../../../core/widgets/card_widget.dart';
import '../../../../core/widgets/icon_widget.dart';

class StatusCardWidget extends StatelessWidget {
  const StatusCardWidget({
    required this.totalCount,
    required this.upcomingCount,
    required this.expiredCount,
    required this.onCreate,
    super.key,
  });

  final int totalCount;
  final int upcomingCount;
  final int expiredCount;
  final VoidCallback onCreate;

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildHeader(context),
          Divider(height: 28),
          _buildStatistics(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final colors = context.color;
    return Row(
      spacing: 8,
      children: [
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.tr(LocaleKeys.home_quick_record),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.typo.size14(),
              ),
              Text(
                context.tr(LocaleKeys.home_quick_record_description),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.typo.size12(color: colors.textSecondary),
              ),
            ],
          ),
        ),
        ButtonMiniPrimary(
          text: context.tr(LocaleKeys.home_new_record),
          onPressed: onCreate,
        ),
      ],
    );
  }

  Widget _buildStatistics(BuildContext context) {
    final colors = context.color;

    return IntrinsicHeight(
      child: Row(
        children: [
          _buildStatistic(
            context,
            title: context.tr(LocaleKeys.home_total),
            count: totalCount,
            iconPath: AssetPath.check,
          ),
          VerticalDivider(width: 1, color: colors.border),
          _buildStatistic(
            context,
            title: context.tr(LocaleKeys.home_upcoming),
            count: upcomingCount,
            iconPath: AssetPath.watch,
            iconColor: colors.upcoming,
          ),
          VerticalDivider(width: 1, color: colors.border),
          _buildStatistic(
            context,
            title: context.tr(LocaleKeys.home_expired),
            count: expiredCount,
            iconPath: AssetPath.alert,
            iconColor: colors.expired,
          ),
        ],
      ),
    );
  }

  Widget _buildStatistic(
    BuildContext context, {
    required String title,
    required int count,
    required String iconPath,
    Color? iconColor,
  }) {
    final colors = context.color;

    return Expanded(
      child: Column(
        spacing: 6,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: context.typo.size12(color: colors.textSecondary),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconWidget(
                path: iconPath,
                size: 18,
                color: iconColor ?? colors.textSecondary,
              ),
              const SizedBox(width: 4),
              Flexible(child: Text('$count', style: context.typo.size16())),
            ],
          ),
        ],
      ),
    );
  }
}

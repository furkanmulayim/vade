import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/locale_keys.g.dart';
import '../../../../core/constants/asset_path.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/widgets/custom_card_widget.dart';
import '../../../../core/widgets/custom_icon_widget.dart';

class DetailDatesCard extends StatelessWidget {
  const DetailDatesCard({
    required this.startDate,
    required this.endDate,
    super.key,
  });

  final DateTime startDate;
  final DateTime endDate;

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat.yMMMd(context.locale.toString());

    return CustomCardWidget(
      child: Column(
        children: [
          _buildDateRow(
            context,
            label: LocaleKeys.detail_start_date.tr(),
            value: dateFormat.format(startDate),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Divider(height: 1),
          ),
          _buildDateRow(
            context,
            label: LocaleKeys.detail_end_date.tr(),
            value: dateFormat.format(endDate),
          ),
        ],
      ),
    );
  }

  Widget _buildDateRow(
    BuildContext context, {
    required String label,
    required String value,
  }) {
    final colors = context.color;

    return Row(
      spacing: 10,
      children: [
        CustomIconWidget(
          path: AssetPath.calendar,
          size: 20,
          color: colors.textSecondary,
        ),
        Expanded(
          child: Text(
            label,
            style: context.typo.size14(color: colors.textSecondary),
          ),
        ),
        Expanded(
          child: Text(
            value,
            textAlign: TextAlign.end,
            style: context.typo.size14(),
          ),
        ),
      ],
    );
  }
}

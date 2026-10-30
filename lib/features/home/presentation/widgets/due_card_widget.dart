import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/asset_path.dart';
import '../../../../core/constants/locale_keys.g.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/extensions/due_date_status_extension.dart';
import '../../../../core/models/due_date_status.dart';
import '../../../../core/widgets/icon_widget.dart';
import '../../../categories/domain/enums/category_enum.dart';

class DueCardWidget extends StatelessWidget {
  const DueCardWidget({
    required this.dueDate,
    required this.title,
    required this.description,
    required this.documentCount,
    required this.category,
    this.onTap,
    super.key,
  }) : assert(documentCount >= 0);

  final DateTime dueDate;
  final String title;
  final String description;
  final int documentCount;
  final CategoryEnum category;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final status = DueDateStatus.calculate(dueDate);
    final colors = context.color;

    return Material(
      color: colors.card,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: colors.border),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        splashColor: colors.textPrimary.withValues(alpha: 0.04),
        highlightColor: colors.textPrimary.withValues(alpha: 0.04),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildHeader(context, status),
            const Divider(height: 1),
            _buildDetails(context, status),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, DueDateStatus status) {
    final colors = context.color;

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        spacing: 8,
        children: [
          _buildProgressIcon(context, status),
          Expanded(
            child: Column(
              spacing: 2,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.typo.size16(),
                ),
                Text(
                  description,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.typo.size13(color: colors.textSecondary),
                ),
              ],
            ),
          ),
          if (onTap != null)
            Icon(Icons.chevron_right_rounded, size: 18, color: colors.disabled),
        ],
      ),
    );
  }

  Widget _buildProgressIcon(BuildContext context, DueDateStatus status) {
    final colors = context.color;

    return SizedBox.square(
      dimension: 44,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox.square(
            dimension: 36,
            child: DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: status.backgroundColor(colors),
              ),
            ),
          ),
          CircularProgressIndicator(
            value: status.progress,
            strokeWidth: 2,
            strokeCap: StrokeCap.round,
            color: status.color(colors),
            backgroundColor: colors.border,
          ),
          IconWidget(path: category.icon, size: 18, color: colors.textPrimary),
        ],
      ),
    );
  }

  Widget _buildDetails(BuildContext context, DueDateStatus status) {
    final date = DateFormat('d MMM', context.locale.toString()).format(dueDate);

    final hasDocuments = documentCount > 0;

    return IntrinsicHeight(
      child: Row(
        children: [
          _buildDetailRow(context, icon: AssetPath.calendar, label: date),
          const VerticalDivider(width: 1),
          _buildDetailRow(
            context,
            icon: AssetPath.watch,
            label: status.label(context),
            color: status.color(context.color),
          ),
          if (hasDocuments) ...[
            const VerticalDivider(width: 1),
            _buildDetailRow(
              context,
              icon: AssetPath.navDocuments,
              label: context.plural(
                LocaleKeys.due_documents,
                documentCount,
                name: 'count',
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildDetailRow(
    BuildContext context, {
    required String label,
    String? icon,
    Color? color,
  }) {
    final foreground = color ?? context.color.textSecondary;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        child: Row(
          spacing: 6,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              IconWidget(path: icon, size: 14, color: foreground),
            Flexible(
              child: Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.typo.size13(color: foreground, weight: .w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

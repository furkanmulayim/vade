import 'package:easy_localization/easy_localization.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../shared/constants/asset_path.dart';
import '../../../../shared/constants/locale_keys.g.dart';
import '../../../../shared/extensions/context_extension.dart';
import '../../../../shared/extensions/due_date_status_extension.dart';
import '../../../../core/models/due_date_status.dart';
import '../../../../core/models/vade.dart';
import '../../../../shared/widgets/custom_icon_widget.dart';
import '../../../../shared/widgets/empty_card_widget.dart';

class DueCardWidget extends StatelessWidget {
  const DueCardWidget({required this.vade, this.onTap, super.key});

  final Vade vade;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final status = DueDateStatus.calculate(
      vade.endDate,
      startDate: vade.startDate,
    );
    return EmptyCardWidget(
      onTap: onTap,
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildHeader(context, status),
          const Divider(height: 1),
          _buildDetails(context, status),
        ],
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
                  vade.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.typo.size16(),
                ),
                Text(
                  vade.description,
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
          CustomIconWidget(
            path: vade.iconPath,
            size: 18,
            color: colors.textPrimary,
          ),
        ],
      ),
    );
  }

  Widget _buildDetails(BuildContext context, DueDateStatus status) {
    final date = DateFormat(
      'd MMM',
      context.locale.toString(),
    ).format(vade.endDate);

    final hasDocuments = vade.documentCount > 0;

    return IntrinsicHeight(
      child: Row(
        children: [
          _buildDetailRow(context, icon: AssetPath.calendar, label: date),
          const VerticalDivider(width: 1),
          _buildDetailRow(
            context,
            icon: AssetPath.watch,
            label: status.label(),
            color: status.color(context.color),
          ),
          if (hasDocuments) ...[
            const VerticalDivider(width: 1),
            _buildDetailRow(
              context,
              icon: AssetPath.documents,
              label: LocaleKeys.due_documents.plural(
                vade.documentCount,
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
              CustomIconWidget(path: icon, size: 14, color: foreground),
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

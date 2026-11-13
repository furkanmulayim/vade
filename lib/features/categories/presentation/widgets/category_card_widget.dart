import 'package:easy_localization/easy_localization.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../shared/constants/locale_keys.g.dart';
import '../../../../shared/enums/category_enum.dart';
import '../../../../shared/extensions/context_extension.dart';
import '../../../../shared/widgets/custom_icon_widget.dart';

class CategoryCardWidget extends StatelessWidget {
  const CategoryCardWidget({
    required this.category,
    required this.count,
    required this.onTap,
    this.upcomingCount = 0,
    super.key,
  });

  final CategoryEnum category;
  final int count;
  final VoidCallback onTap;
  final int upcomingCount;

  Color _accent(BuildContext context) => switch (category) {
    CategoryEnum.electronics => Colors.blue,
    CategoryEnum.homeLiving => Colors.teal,
    CategoryEnum.education => Colors.purple,
    CategoryEnum.health => Colors.pink,
    CategoryEnum.vehicleAndTransport => Colors.indigo,
    CategoryEnum.finance => Colors.green,
    CategoryEnum.subscriptions => context.color.primary,
    CategoryEnum.other => context.color.textSecondary,
  };

  @override
  Widget build(BuildContext context) => Material(
    color: context.color.card,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(32),
      side: BorderSide(color: context.color.border),
    ),
    clipBehavior: Clip.antiAlias,
    child: InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _accent(context).withValues(alpha: 0.12),
                ),
                alignment: Alignment.center,
                child: CustomIconWidget(
                  path: category.icon,
                  size: 26,
                  color: _accent(context),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) => FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.bottomLeft,
                  child: SizedBox(
                    width: constraints.maxWidth,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 3,
                      children: [
                        Text(
                          category.titleKey.tr(),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: context.typo.size18(weight: FontWeight.w600),
                        ),
                        if (upcomingCount > 0)
                          Text(
                            LocaleKeys.category_has_upcoming.tr(),
                            style: context.typo.size12(
                              color: context.color.primary,
                            ),
                          ),
                        Text(
                          LocaleKeys.category_records.plural(
                            count,
                            name: 'count',
                          ),
                          style: context.typo.size12(
                            color: context.color.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

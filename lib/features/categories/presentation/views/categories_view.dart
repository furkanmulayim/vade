import 'package:auto_route/auto_route.dart';
import 'package:blurred_overlay/blurred_overlay.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:material_ui/material_ui.dart';
import 'package:vade/core/models/vade.dart';

import '../../../../app/router/app_router.dart';
import '../../../../core/models/due_date_status.dart';
import '../../../../core/models/sample_records.dart';
import '../../../../shared/constants/locale_keys.g.dart';
import '../../../../shared/enums/category_enum.dart';
import '../../../../shared/extensions/context_extension.dart';
import '../../../../shared/widgets/custom_sheet_widget.dart';
import '../../../home/presentation/widgets/due_card_widget.dart';
import '../widgets/category_card_widget.dart';

@RoutePage()
class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    final records = getSampleRecords();
    final now = DateTime.now();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: BlurredAppBar(
        backgroundColor: context.color.card.withValues(alpha: 0.72),
        automaticallyImplyLeading: false,
        title: Text(LocaleKeys.navigation_categories.tr()),
      ),
      body: GridView.builder(
        padding: _gridPadding(context),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.2,
        ),
        itemCount: CategoryEnum.values.length,
        itemBuilder: (context, index) {
          final category = CategoryEnum.values[index];

          final categoryRecords = records
              .where((record) => record.category == category)
              .toList();

          final upcomingCount = categoryRecords.where((record) {
            final status = DueDateStatus.calculate(
              record.endDate,
              startDate: record.startDate,
              now: now,
            );

            return status.state == DueDateState.upcoming;
          }).length;

          return CategoryCardWidget(
            category: category,
            count: categoryRecords.length,
            upcomingCount: upcomingCount,
            onTap: () => _showCategorySheet(context, category, categoryRecords),
          );
        },
      ),
    );
  }

  EdgeInsets _gridPadding(BuildContext context) {
    final padding = MediaQuery.paddingOf(context);

    return EdgeInsets.fromLTRB(
      16,
      padding.top + kToolbarHeight + 16,
      16,
      padding.bottom + 16,
    );
  }

  void _showCategorySheet(
    BuildContext context,
    CategoryEnum category,
    List<Vade> records,
  ) {
    showModalBottomSheet<void>(
      context: context,
      useRootNavigator: true,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (sheetContext) => CustomSheetWidget(
        title: category.titleKey.tr(),
        onClose: () => Navigator.of(sheetContext).pop(),
        content: Column(
          spacing: 8,
          children: [
            if (records.isEmpty) _buildEmptyState(context),
            for (final record in records)
              DueCardWidget(
                vade: record,
                onTap: () {
                  Navigator.of(sheetContext).pop();
                  context.router.push(DetailRoute(vade: record));
                },
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Text(
        LocaleKeys.category_no_records.tr(),
        style: context.typo.size14(color: context.color.textSecondary),
      ),
    );
  }
}

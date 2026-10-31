import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../app/router/app_router.dart';
import '../../../../core/constants/asset_path.dart';
import '../../../../core/constants/locale_keys.g.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/widgets/custom_sheet_widget.dart';
import '../../../../core/widgets/custom_icon_widget.dart';
import '../../../categories/domain/enums/category_enum.dart';
import '../../../categories/presentation/widgets/category_tab_bar.dart';
import '../widgets/due_card_widget.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/status_card_widget.dart';

@RoutePage()
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  CategoryEnum? _selectedCategory;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: HomeAppBar(
      nameCode: 'FM',
      onSearch: () => context.router.push(const SearchRoute()),
      onNotifications: () => context.router.push(const NotificationsRoute()),
      bottom: CategoryTabBar(
        initialCategory: _selectedCategory,
        onChanged: (category) {
          setState(() => _selectedCategory = category);
        },
      ),
    ),
    body: SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 12,
          children: [
            StatusCardWidget(
              totalCount: 80,
              upcomingCount: 23,
              expiredCount: 12,
              onCreate: () {
                context.router.push(const CreateRoute());
              },
            ),
            _listHeader(),
            DueCardWidget(
              category: CategoryEnum.health,
              title: context.tr(LocaleKeys.home_sample_health_title),
              description: context.tr(
                LocaleKeys.home_sample_health_description,
              ),
              dueDate: DateTime(2027, 05, 05),
              documentCount: 0,
              onTap: () {},
            ),
            DueCardWidget(
              category: CategoryEnum.electronics,
              title: 'MacBook Air M2',
              description: context.tr(
                LocaleKeys.home_sample_computer_description,
              ),
              dueDate: DateTime(2026, 11, 21),
              documentCount: 2,
              onTap: () {},
            ),
            DueCardWidget(
              category: CategoryEnum.vehicleAndTransport,
              title: context.tr(LocaleKeys.home_sample_car_title),
              description: context.tr(LocaleKeys.home_sample_car_description),
              dueDate: DateTime(2026, 10, 30),
              documentCount: 0,
              onTap: () {},
            ),
            DueCardWidget(
              category: CategoryEnum.vehicleAndTransport,
              title: context.tr(LocaleKeys.home_sample_car_title),
              description: context.tr(LocaleKeys.home_sample_car_description),
              dueDate: DateTime(2026, 10, 30),
              documentCount: 0,
              onTap: () {},
            ),
          ],
        ),
      ),
    ),
  );

  Widget _listHeader() {
    final color = context.color.textSecondary;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            context.tr(LocaleKeys.home_my_records),
            style: context.typo.size12(color: color).copyWith(letterSpacing: 1),
          ),
          TextButton(
            onPressed: () => showModalBottomSheet<void>(
              context: context,
              isScrollControlled: true,
              useSafeArea: true,
              builder: (context) => CustomSheetWidget(
                title: context.tr(LocaleKeys.home_sort),
                content: const SizedBox(height: 160),
              ),
            ),
            style: TextButton.styleFrom(
              foregroundColor: color,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              visualDensity: VisualDensity(
                horizontal: VisualDensity.minimumDensity,
                vertical: VisualDensity.minimumDensity,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 4,
              children: [
                Text(
                  context.tr(LocaleKeys.home_sort),
                  style: context.typo.size12(color: color),
                ),
                CustomIconWidget(path: AssetPath.sort, size: 14, color: color),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

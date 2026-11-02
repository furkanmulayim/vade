import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../app/router/app_router.dart';
import '../../../../core/constants/asset_path.dart';
import '../../../../core/constants/locale_keys.g.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/models/vade.dart';
import '../../../../core/widgets/custom_icon_widget.dart';
import '../../../categories/domain/enums/category_enum.dart';
import '../../../categories/presentation/widgets/category_tab_bar.dart';
import '../../../create/presentation/views/create_view.dart';
import '../../domain/enums/filter_enum.dart';
import '../widgets/due_card_widget.dart';
import '../widgets/filter_widget.dart';
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
  FilterEnum? _selectedFilter;

  @override
  Widget build(BuildContext context) {
    final records = _filterRecords(_getSampleRecords());

    return Scaffold(
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
                onCreate: _showCreateSheet,
              ),
              _buildListHeader(),
              _buildRecordsList(records),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRecordsList(List<Vade> records) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: records.length,
      separatorBuilder: (_, _) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final vade = records[index];
        return DueCardWidget(
          vade: vade,
          onTap: () => context.router.push(DetailRoute(vade: vade)),
        );
      },
    );
  }

  Widget _buildListHeader() {
    final color = context.color.textSecondary;
    final sortColor = _selectedFilter == null ? color : context.color.primary;

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
            onPressed: _showFilter,
            style: TextButton.styleFrom(
              foregroundColor: sortColor,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              visualDensity: const VisualDensity(
                horizontal: VisualDensity.minimumDensity,
                vertical: VisualDensity.minimumDensity,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 4,
              children: [
                Text(
                  context.tr(_selectedFilter?.titleKey ?? LocaleKeys.home_sort),
                  style: context.typo.size12(color: sortColor),
                ),
                CustomIconWidget(
                  path: AssetPath.sort,
                  size: 14,
                  color: sortColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // todo Viewmodel'e tasınacak
  List<Vade> _filterRecords(List<Vade> records) {
    if (_selectedCategory == null) return records;
    return records.where((vade) => vade.category == _selectedCategory).toList();
  }

  Future<void> _showFilter() async {
    final filter = await showModalBottomSheet<FilterEnum>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (_) =>
          FilterWidget(selected: _selectedFilter ?? FilterEnum.defaultOrder),
    );

    if (!mounted || filter == null) return;

    setState(() {
      _selectedFilter = filter == FilterEnum.defaultOrder ? null : filter;
    });
  }

  Future<void> _showCreateSheet() {
    return showModalBottomSheet<void>(
      context: context,
      useRootNavigator: true,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (_) => const CreateView(),
    );
  }

  // todo gerçek veriler gelince temizlenecek
  List<Vade> _getSampleRecords() {
    return [
      Vade(
        id: 'sample-1',
        category: CategoryEnum.electronics,
        iconPath: CategoryEnum.electronics.icon,
        name: 'Özel Sağlık Sigortası',
        description: 'Tamamlayıcı sağlık sigortası plan (A)',
        startDate: DateTime(2026, 1, 1),
        endDate: DateTime(2027, 5, 5),
        documentCount: 0,
      ),
      Vade(
        id: 'sample-2',
        category: CategoryEnum.homeLiving,
        iconPath: CategoryEnum.homeLiving.icon,
        name: 'MacBook Air M2',
        description: 'Kişisel edit yaptığım bilgisayarım',
        startDate: DateTime(2026, 1, 1),
        endDate: DateTime(2026, 11, 21),
        documentCount: 2,
      ),
      Vade(
        id: 'sample-3',
        category: CategoryEnum.homeLiving,
        iconPath: CategoryEnum.homeLiving.icon,
        name: 'Hyundai Kasko',
        description: 'Garanti bankası ile yapılan anlaşmalı sigorta',
        startDate: DateTime(2026, 1, 1),
        endDate: DateTime(2026, 10, 30),
        documentCount: 0,
      ),
      Vade(
        id: 'sample-4',
        category: CategoryEnum.education,
        iconPath: CategoryEnum.education.icon,
        name: 'Hyundai Kasko',
        description: 'Garanti bankası ile yapılan anlaşmalı sigorta',
        startDate: DateTime(2026, 1, 1),
        endDate: DateTime(2026, 10, 30),
        documentCount: 0,
      ),
    ];
  }
}

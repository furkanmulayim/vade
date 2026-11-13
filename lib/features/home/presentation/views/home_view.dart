import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../app/router/app_router.dart';
import '../../../../shared/constants/asset_path.dart';
import '../../../../shared/constants/locale_keys.g.dart';
import '../../../../shared/extensions/context_extension.dart';
import '../../../../core/models/vade.dart';
import '../../../../core/models/sample_records.dart';
import '../../../../shared/widgets/custom_icon_widget.dart';
import '../../../../shared/enums/category_enum.dart';
import '../../../categories/presentation/widgets/category_tab_bar.dart';
import '../../../create/create_view.dart';
import '../../../../shared/enums/filter_enum.dart';
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
    final records = _filterRecords(getSampleRecords());

    return Scaffold(
      extendBodyBehindAppBar: true,
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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
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
            LocaleKeys.home_my_records.tr(),
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
                  (_selectedFilter?.titleKey ?? LocaleKeys.home_sort).tr(),
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
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/locale_keys.g.dart';
import '../../../../core/widgets/icon_widget.dart';
import '../../domain/enums/category_enum.dart';

class CategoryTabBar extends StatelessWidget implements PreferredSizeWidget {
  const CategoryTabBar({
    required this.onChanged,
    this.initialCategory,
    super.key,
  });

  final ValueChanged<CategoryEnum?> onChanged;
  final CategoryEnum? initialCategory;

  List<CategoryEnum?> get categories => [null, ...CategoryEnum.values];

  @override
  Size get preferredSize => const Size.fromHeight(kTextTabBarHeight);

  @override
  Widget build(BuildContext context) {
    final selectedIndex = categories.indexOf(initialCategory);

    return DefaultTabController(
      length: categories.length,
      initialIndex: selectedIndex,
      child: TabBar(
        isScrollable: true,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        onTap: (index) => onChanged(categories[index]),
        tabs: categories
            .map((category) => _buildTab(context, category))
            .toList(),
      ),
    );
  }

  Tab _buildTab(BuildContext context, CategoryEnum? category) {
    final title = context.tr(category?.titleKey ?? LocaleKeys.category_all);
    final icon = category?.icon;

    return Tab(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 6,
        children: [
          if (icon != null)
            Builder(
              builder: (context) => IconWidget(
                path: icon,
                size: 16,
                color: IconTheme.of(context).color!,
              ),
            ),
          Text(title),
        ],
      ),
    );
  }
}

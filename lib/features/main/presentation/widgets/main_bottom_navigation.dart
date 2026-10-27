import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/asset_path.dart';
import '../../../../core/constants/locale_keys.g.dart';
import '../../../../core/extensions/context_extension.dart';

class MainBottomNavigation extends StatelessWidget {
  const MainBottomNavigation({
    required this.selectedIndex,
    required this.onSelected,
    super.key,
  });

  final int selectedIndex;
  final ValueChanged<int> onSelected;

  static const _items = [
    (AssetPath.navHome, LocaleKeys.navigation_home),
    (AssetPath.navCategories, LocaleKeys.navigation_categories),
    (null, LocaleKeys.navigation_create),
    (AssetPath.navDocuments, LocaleKeys.navigation_documents),
    (AssetPath.navSettings, LocaleKeys.navigation_settings),
  ];

  @override
  Widget build(BuildContext context) => DecoratedBox(
    decoration: BoxDecoration(
      color: context.color.card,
      border: Border(top: BorderSide(color: context.color.border)),
    ),
    child: SafeArea(
      top: false,
      child: SizedBox(
        height: 70,
        child: Row(
          children: List.generate(_items.length, (index) {
            final (icon, label) = _items[index];
            return Expanded(
              child: _NavigationItem(
                icon: icon,
                label: label.tr(),
                selected: selectedIndex == index,
                onTap: () => onSelected(index),
              ),
            );
          }),
        ),
      ),
    ),
  );
}

class _NavigationItem extends StatefulWidget {
  const _NavigationItem({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String? icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  State<_NavigationItem> createState() => _NavigationItemState();
}

class _NavigationItemState extends State<_NavigationItem>
    with SingleTickerProviderStateMixin {
  late final _scale = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 100),
    lowerBound: 0.70,
    value: 1,
  );

  @override
  void dispose() {
    _scale.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.color;
    final iconColor = widget.selected ? colors.primary : colors.textPrimary;

    return Semantics(
      button: true,
      selected: widget.selected,
      label: widget.label,
      onTap: widget.onTap,
      excludeSemantics: true,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: widget.onTap,
        onTapDown: (_) => _scale.reverse(),
        onTapUp: (_) => _scale.forward(),
        onTapCancel: () => _scale.forward(),
        child: AnimatedBuilder(
          animation: _scale,
          builder: (_, child) =>
              Transform.scale(scale: _scale.value, child: child),
          child: Center(
            child: widget.icon == null
                ? Container(
                    width: 46,
                    height: 46,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.lerp(colors.primary, colors.onPrimary, 0.3)!,
                          colors.primary,
                        ],
                      ),
                    ),
                    child: Icon(Icons.add, color: colors.onPrimary, size: 28),
                  )
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        widget.icon!,
                        width: 24,
                        height: 24,
                        colorFilter: ColorFilter.mode(
                          iconColor,
                          BlendMode.srcIn,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.label,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: context.typo.size12(
                          color: widget.selected
                              ? colors.primary
                              : colors.textSecondary,
                          weight: widget.selected
                              ? FontWeight.w600
                              : FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

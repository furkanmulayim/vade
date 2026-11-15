import 'package:material_ui/material_ui.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../shared/constants/asset_path.dart';
import '../../../../shared/extensions/context_extension.dart';

class MainBottomNavigation extends StatelessWidget {
  const MainBottomNavigation({
    required this.selectedIndex,
    required this.onSelected,
    super.key,
  });

  final int selectedIndex;
  final ValueChanged<int> onSelected;

  static const _items = [
    (AssetPath.navHome, 'Home'),
    (AssetPath.navSpend, 'Masraf'),
    (AssetPath.navRepair, 'Bakım'),
    (AssetPath.navSettings, 'Ayarlar'),
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
                label: label,
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

  final String icon;
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
    final selectedColor = widget.selected
        ? context.color.textPrimary
        : context.color.textSecondary;

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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  widget.icon,
                  width: 24,
                  height: 24,
                  colorFilter: ColorFilter.mode(selectedColor, BlendMode.srcIn),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.typo.size12(
                    color: selectedColor,
                    weight: widget.selected ? FontWeight.w600 : FontWeight.w500,
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

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/asset_path.dart';
import '../../../../core/constants/locale_keys.g.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/widgets/icon_widget.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
    this.nameCode,
    this.onSearch,
    this.onNotifications,
  });

  final String? nameCode;
  final VoidCallback? onSearch;
  final VoidCallback? onNotifications;

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    final colors = context.color;

    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: colors.card,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      toolbarHeight: preferredSize.height,
      titleSpacing: 16,
      title: Row(
        children: [
          if (nameCode != null) ...[
            CircleAvatar(
              radius: 20,
              backgroundColor: colors.backWarning,
              child: Text(
                nameCode!.substring(0, 2),
                style: context.typo.size16(color: colors.primary),
              ),
            ),
          ],
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  LocaleKeys.home_welcome.tr(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.typo.size18(),
                ),
                const SizedBox(height: 6),
                Text(
                  DateFormat(
                    'd MMMM EEEE',
                    context.locale.toString(),
                  ).format(DateTime.now()),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.typo.size12(color: colors.textSecondary),
                ),
              ],
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: onSearch,
          tooltip: LocaleKeys.home_search.tr(),
          disabledColor: colors.textPrimary,
          color: colors.textPrimary,
          icon: IconWidget(
            path: AssetPath.search,
            size: 26,
            color: colors.textPrimary,
          ),
        ),
        IconButton(
          onPressed: onNotifications,
          tooltip: LocaleKeys.home_notifications.tr(),
          disabledColor: colors.textPrimary,
          color: colors.textPrimary,
          icon: IconWidget(
            path: AssetPath.notification,
            size: 26,
            color: colors.textPrimary,
          ),
        ),
        const SizedBox(width: 8),
      ],
    );
  }
}

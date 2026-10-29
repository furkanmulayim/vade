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
    this.bottom,
  });

  final String? nameCode;
  final VoidCallback? onSearch;
  final VoidCallback? onNotifications;
  final PreferredSizeWidget? bottom;

  @override
  Size get preferredSize =>
      Size.fromHeight(64 + (bottom?.preferredSize.height ?? 0));

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: _buildTitle(context),
      bottom: bottom,
      actions: [
        _buildAction(
          iconPath: AssetPath.search,
          tooltip: context.tr(LocaleKeys.home_search),
          onPressed: onSearch,
        ),
        _buildAction(
          iconPath: AssetPath.notification,
          tooltip: context.tr(LocaleKeys.home_notifications),
          onPressed: onNotifications,
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Row(
      children: [
        if (nameCode != null) ...[
          _buildAvatar(context),
          const SizedBox(width: 10),
        ],
        Expanded(child: _buildWelcome(context)),
      ],
    );
  }

  Widget _buildAvatar(BuildContext context) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: context.color.backUpcoming,
      child: Text(
        nameCode!.substring(0, 2).toUpperCase(),
        style: context.typo.size16(color: context.color.primary),
      ),
    );
  }

  Widget _buildWelcome(BuildContext context) {
    final date = DateFormat(
      'd MMMM EEEE',
      context.locale.toString(),
    ).format(DateTime.now());

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 2,
      children: [
        Text(
          context.tr(LocaleKeys.home_welcome),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: context.typo.size18(),
        ),
        Text(
          date,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: context.typo.size12(color: context.color.textSecondary),
        ),
      ],
    );
  }

  Widget _buildAction({
    required String iconPath,
    required String tooltip,
    VoidCallback? onPressed,
  }) {
    return Builder(
      builder: (context) {
        final color = context.color.textPrimary;

        return IconButton(
          onPressed: onPressed,
          tooltip: tooltip,
          icon: IconWidget(path: iconPath, size: 26, color: color),
        );
      },
    );
  }
}

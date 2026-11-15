import 'package:blurred_overlay/blurred_overlay.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../shared/constants/asset_path.dart';
import '../../../../shared/extensions/context_extension.dart';
import '../../../../shared/widgets/custom_icon_widget.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
    this.nameCode,
    this.onNotifications,
    this.bottom,
  });

  final String? nameCode;
  final VoidCallback? onNotifications;
  final PreferredSizeWidget? bottom;

  @override
  Size get preferredSize => BlurredAppBar(bottom: bottom).preferredSize;

  @override
  Widget build(BuildContext context) {
    return BlurredAppBar(
      backgroundColor: context.color.card.withValues(alpha: 0.72),
      automaticallyImplyLeading: false,
      title: _buildTitle(context),
      bottom: bottom,
      actions: [
        _buildAction(
          iconPath: AssetPath.notification,
          tooltip: "Bildirimler",
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
    final now = DateTime.now();
    const months = [
      'Ocak',
      'Şubat',
      'Mart',
      'Nisan',
      'Mayıs',
      'Haziran',
      'Temmuz',
      'Ağustos',
      'Eylül',
      'Ekim',
      'Kasım',
      'Aralık',
    ];
    const days = [
      'Pazartesi',
      'Salı',
      'Çarşamba',
      'Perşembe',
      'Cuma',
      'Cumartesi',
      'Pazar',
    ];
    final date = '${now.day} ${months[now.month - 1]} ${days[now.weekday - 1]}';

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 2,
      children: [
        Text(
          "Autocar’a Hoşgeldin.",
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
          icon: CustomIconWidget(path: iconPath, size: 26, color: color),
        );
      },
    );
  }
}

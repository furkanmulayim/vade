import 'package:material_ui/material_ui.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../extensions/context_extension.dart';

class CustomIconWidget extends StatelessWidget {
  const CustomIconWidget({
    required this.path,
    required this.size,
    required this.color,
    this.border = false,
    this.backColor,
    super.key,
  });

  final String path;
  final double size;
  final Color color;
  final bool border;
  final Color? backColor;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final icon = SvgPicture.asset(
      path,
      width: size,
      height: size,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    );

    if (!border) return icon;

    return Container(
      width: size + 22,
      height: size + 22,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: backColor,
        border: Border.all(color: context.color.border),
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.24 : 0.02),
            blurRadius: isDark ? 2 : 2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: icon,
    );
  }
}

import 'package:material_ui/material_ui.dart';

import '../extensions/context_extension.dart';

class EmptyCardWidget extends StatelessWidget {
  const EmptyCardWidget({
    super.key,
    this.child,
    this.onTap,
    this.width = double.infinity,
    this.padding = const EdgeInsets.all(12),
    this.margin = const EdgeInsets.all(16),
  });

  final Widget? child;
  final VoidCallback? onTap;
  final double? width;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;

  @override
  Widget build(BuildContext context) {
    final colors = context.color;
    final borderRadius = BorderRadius.circular(20);

    if (onTap == null) {
      return Container(
        width: width,
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
          color: colors.card,
          borderRadius: borderRadius,
          border: Border.all(color: colors.border),
        ),
        child: child,
      );
    }

    return Padding(
      padding: margin,
      child: Material(
        color: colors.card,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
          side: BorderSide(color: colors.border),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          splashColor: colors.textPrimary.withValues(alpha: 0.04),
          highlightColor: colors.textPrimary.withValues(alpha: 0.04),
          child: SizedBox(
            width: width,
            child: Padding(padding: padding, child: child),
          ),
        ),
      ),
    );
  }
}

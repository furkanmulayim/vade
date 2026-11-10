import 'package:flutter/material.dart';

import '../extensions/context_extension.dart';

class CustomCardWidget extends StatelessWidget {
  const CustomCardWidget({
    required this.child,
    super.key,
    this.padding = const EdgeInsets.all(12),
    this.color,
    this.borderRadius = const BorderRadius.all(Radius.circular(20)),
    this.border,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final Color? color;
  final BorderRadiusGeometry borderRadius;
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) => Container(
    padding: padding,
    decoration: BoxDecoration(
      color: color ?? context.color.card,
      borderRadius: borderRadius,
      border: border ?? Border.all(color: context.color.border),
    ),
    child: child,
  );
}

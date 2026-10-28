import 'package:flutter/material.dart';

import '../extensions/context_extension.dart';

class ButtonMiniPrimary extends StatelessWidget {
  const ButtonMiniPrimary({
    required this.text,
    super.key,
    this.onPressed,
    this.isDisabled = false,
  });

  final String text;
  final VoidCallback? onPressed;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    final colors = context.color;
    return FilledButton(
      onPressed: isDisabled ? null : onPressed,
      style: FilledButton.styleFrom(
        backgroundColor: isDisabled ? colors.disabled : colors.primary,
        foregroundColor: isDisabled ? colors.border : colors.onPrimary,
        minimumSize: Size.zero,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: context.typo.size14(color: colors.onPrimary),
      ),
      child: Text(text),
    );
  }
}

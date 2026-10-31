import 'package:flutter/material.dart';

import '../extensions/context_extension.dart';

class CustomButtonWidget extends StatefulWidget {
  const CustomButtonWidget({
    required this.text,
    super.key,
    this.onPressed,
    this.isDisabled = false,
  });

  final String text;
  final VoidCallback? onPressed;
  final bool isDisabled;

  @override
  State<CustomButtonWidget> createState() => _CustomButtonWidgetState();
}

class _CustomButtonWidgetState extends State<CustomButtonWidget> {
  final _clickCooldown = Stopwatch();

  void _handlePressed() {
    if (widget.isDisabled || widget.onPressed == null) return;
    if (_clickCooldown.isRunning && _clickCooldown.elapsedMilliseconds < 300) {
      return;
    }

    _clickCooldown
      ..reset()
      ..start();
    widget.onPressed!();
  }

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: widget.isDisabled || widget.onPressed == null
          ? null
          : _handlePressed,
      style: FilledButton.styleFrom(
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: context.typo.size14(),
      ),
      child: Text(widget.text),
    );
  }
}

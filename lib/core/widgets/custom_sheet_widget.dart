import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../constants/locale_keys.g.dart';
import '../extensions/context_extension.dart';
import 'custom_button_widget.dart';

class CustomSheetWidget extends StatelessWidget {
  const CustomSheetWidget({
    super.key,
    required this.content,
    this.title,
    this.buttonText,
    this.onButtonPressed,
    this.isButtonDisabled = false,
    this.contentPadding = const EdgeInsets.fromLTRB(20, 0, 20, 20),
  });

  final Widget content;
  final String? title;
  final String? buttonText;
  final VoidCallback? onButtonPressed;
  final bool isButtonDisabled;
  final EdgeInsetsGeometry contentPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.sizeOf(context).height * 0.9,
        ),
        child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 12, bottom: 24),
                child: Center(
                  child: Container(
                    width: 36,
                    height: 4,
                    decoration: BoxDecoration(
                      color: context.color.disabled,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
              ),
              Flexible(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      if (title != null)
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
                          child: Text(title!, style: context.typo.size20()),
                        ),
                      Padding(padding: contentPadding, child: content),
                    ],
                  ),
                ),
              ),
              if (onButtonPressed != null)
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                  child: CustomButtonWidget(
                    height: 42,
                    text: buttonText ?? context.tr(LocaleKeys.home_sort_apply),
                    onPressed: onButtonPressed,
                    isDisabled: isButtonDisabled,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

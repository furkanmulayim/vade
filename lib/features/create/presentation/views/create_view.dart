import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/locale_keys.g.dart';
import '../../../../core/widgets/custom_sheet_widget.dart';



class CreateView extends StatelessWidget {
  const CreateView({super.key});

  @override
  Widget build(BuildContext context) => CustomSheetWidget(
    isFullScreen: true,
    title: context.tr(LocaleKeys.navigation_create),
    onClose: () => Navigator.of(context).pop(),
    content: const SizedBox.shrink(),
  );
}
